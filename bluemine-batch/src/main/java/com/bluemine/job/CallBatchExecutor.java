package com.bluemine.job;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.ServerConstants;
import com.bluemine.SysintrException;
import com.bluemine.common.TagResponse;
import com.bluemine.context.SessionContext;
import com.bluemine.domain.entity.*;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.job.tag.TagCollectJobConfiguration;
import com.bluemine.repository.CallSyncTriggerRepository;
import com.bluemine.repository.RuleRepository;
import com.bluemine.repository.TagRepository;
import com.bluemine.service.ResourceSyncObserver;
import com.bluemine.service.TabService;
import com.bluemine.struct.CallTriggerStatus;
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
import org.springframework.stereotype.Component;

import javax.inject.Inject;
import java.io.File;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * Created by hechao on 2018/10/9.
 */
@Component
public class CallBatchExecutor implements ResourceSyncObserver {

    private static final Logger log = LoggerFactory.getLogger(CallBatchExecutor.class);

    @Inject
    private ApplicationContext applicationContext;

    @Inject
    private JobLauncher jobLauncher;

    @Inject
    private Cache tagCache;

    @Inject
    private TabService tabService;

    @Inject
    private CallSyncTriggerRepository callSyncTriggerRepository;



    private CallSyncTriggerEntity change(CallSyncTriggerEntity trigger, CallTriggerStatus changed) {
        trigger.setStatusCode(changed);
        return callSyncTriggerRepository.saveAndFlush(trigger);
    }

    public void run(long channelId, LocalDate date, String file) {
        //TODO:later change thread run
        run(channelId, date.format(ServerConstants.YYYY_MM_DD_FORMATTER), file);
    }

    public void run(long channelId, String date, String file) {

        CallSyncTriggerId triggerId = new CallSyncTriggerId()
                .channelId(channelId)
                .callDate(LocalDate.parse(date));

        CallSyncTriggerEntity triggerEntity = callSyncTriggerRepository.findOne(triggerId);
        AssertUtils.isTrue(CallTriggerStatus.SYNCHRONIZED.equals(triggerEntity.getStatusCode()), ExceptionMessageEnum.LOGIC_EXCEPTION);

        try {
            triggerEntity = change(triggerEntity, CallTriggerStatus.STARTED);
            Job tagCollectJob = (Job) applicationContext.getBean("tagCollectJob");
            JobParameters params = new JobParametersBuilder()
                    .addLong(TagCollectJobConfiguration.PARAM_CHANNEL_ID, channelId)
                    .addDate(TagCollectJobConfiguration.PARAM_CALL_DATE, Date.from(triggerId.getCallDate().atStartOfDay(ZoneId.systemDefault()).toInstant()))
                    .addString(TagCollectJobConfiguration.PARAM_CALL_RESOURCE, file)
                    .toJobParameters();
            JobExecution jobExecution = jobLauncher.run(tagCollectJob, params);
            EntityUtils.describe(triggerEntity, jobExecution.getAllFailureExceptions().toString());
            triggerEntity = change(triggerEntity, CallTriggerStatus.valueOf(jobExecution.getStatus().name()));
        } catch (Throwable e) {
            e.printStackTrace();
            EntityUtils.describe(triggerEntity, e.getMessage());
            triggerEntity = change(triggerEntity, CallTriggerStatus.FAILED);
        }
    }

    @Override
    public void completed(Long channelId, LocalDate callDate, String localPath, String fileName) {
        run(channelId, callDate, new File(localPath, fileName).getAbsolutePath());
    }
}
