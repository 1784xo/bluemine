package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.ServerConstants;
import com.bluemine.SysintrException;
import com.bluemine.common.TagResponse;
import com.bluemine.context.RequestContext;
import com.bluemine.domain.entity.CallBatchTriggerId;
import com.bluemine.domain.entity.RuleEntity;
import com.bluemine.domain.entity.TagEntity;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.job.call.TagCollectJobConfiguration;
import com.bluemine.repository.CallBatchTriggerRepository;
import com.bluemine.repository.ChannelRepository;
import com.bluemine.repository.RuleRepository;
import com.bluemine.repository.TagRepository;
import com.bluemine.struct.BatchTriggerStatus;
import com.bluemine.util.AssertUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.cache.Cache;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * Created by hechao on 2018/9/5.
 */
@Service
public class CallBatchExecutor {

    private static final Logger log = LoggerFactory.getLogger(CallBatchExecutor.class);

    @Inject
    private Cache tagCache;

    @Inject
    private JobLauncher jobLauncher;

    @Inject
    private ThreadPoolTaskExecutor callBatchTaskExecutor;

    @Inject
    private CallBatchTriggerRepository callBatchTriggerRepository;

    @Inject
    private ChannelRepository channelRepository;

    @Inject
    private TagRepository tagRepository;

    @Inject
    private RuleRepository ruleRepository;

    private void updateStatus(CallBatchTriggerId triggerId, BatchTriggerStatus current, BatchTriggerStatus target, String descText) {
        int count = callBatchTriggerRepository.updateStatus(triggerId.getChannelId(), triggerId.getCallNo(), triggerId.getCallDate(), triggerId.getSeatNo(), current
                , target, descText);
        AssertUtils.isTrue(count == 1, ExceptionMessageEnum.DB_NO_SUCH_RESULT);
    }

    private void prepareCache(Long channelId) {
        try {
            if (tagCache.get(channelId) == null) {
                if (log.isDebugEnabled())
                    log.debug("prepare tag cache for channel:  " + channelId);

                List<TagEntity> tags = tagRepository.findAll(channelId, true, TagRepository.ORDER_TAG_NO_ASC);
                List<RuleEntity> rules = ruleRepository.findAllByChannelId(channelId);
                Map<Long, TagResponse> tagMap = EntityUtils.mergeToMap(tags, rules);
                tagCache.put(channelId, tagMap);
            }
            if (log.isDebugEnabled())
                log.debug("tag cache prepared for channel: " + channelId);
        } catch (Exception e) {
            throw new SysintrException("prepare  tag cache for channel: " + channelId, e);
        }
    }

    public void start(CallBatchTriggerId triggerId, RequestContext context) {
        updateStatus(triggerId, BatchTriggerStatus.WAIT, BatchTriggerStatus.STARTED, "started");
        try {
            prepareCache(triggerId.getChannelId());
            CallBatchThread thread = new CallBatchThread(triggerId, this, context);
            callBatchTaskExecutor.execute(thread);
        } catch (Exception e) {
            if (log.isErrorEnabled())
                log.error(e.getMessage(), e);
            updateStatus(triggerId, BatchTriggerStatus.STARTED, BatchTriggerStatus.FAILED, e.getMessage());
        }
    }

    public void execute(CallBatchTriggerId triggerId, RequestContext context) {
        if (log.isInfoEnabled())
            log.info("start execute call batch task. call: {}", triggerId.getCallNo());

        JobExecution jobExecution = null;
        updateStatus(triggerId, BatchTriggerStatus.STARTED, BatchTriggerStatus.STARTING, "starting");
        try {
            ApplicationContext applicationContext = context.getParent().getParent();
            JobParameters params = new JobParametersBuilder()
                    .addLong(TagCollectJobConfiguration.PARAM_CHANNEL_ID, triggerId.getChannelId())
                    .addString(TagCollectJobConfiguration.PARAM_CALL_NO, triggerId.getCallNo())
                    .addString(TagCollectJobConfiguration.PARAM_CALL_DATE, triggerId.getCallDate().format(ServerConstants.YYYY_MM_DD_FORMATTER))
                    .addString(TagCollectJobConfiguration.PARAM_SEAT_NO, triggerId.getSeatNo())
                    .toJobParameters();
            Job tagCollectJob = (Job) applicationContext.getBean("tagCollectJob");
            jobExecution = jobLauncher.run(tagCollectJob, params);
        } catch (Exception e) {
            if (log.isErrorEnabled())
                log.error(e.getMessage(), e);
            updateStatus(triggerId, BatchTriggerStatus.STARTING, BatchTriggerStatus.FAILED, e.getMessage());
        } finally {
            if (jobExecution != null) {
                updateStatus(triggerId, BatchTriggerStatus.STARTING, BatchTriggerStatus.valueOf(jobExecution.getStatus().name()), jobExecution.getAllFailureExceptions().toString());
            }
            if (log.isInfoEnabled())
                log.info("end execute call batch task. call: {}");
        }
    }
}