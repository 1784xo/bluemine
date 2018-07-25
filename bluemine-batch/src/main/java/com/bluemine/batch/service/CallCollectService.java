package com.bluemine.batch.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.LogicException;
import com.bluemine.ServerConstants;
import com.bluemine.batch.config.BatchApplicationConfiguration;
import com.bluemine.batch.config.BatchRestartConfiguration;
import com.bluemine.batch.job.cycle.CallCollectConfiguration;
import com.bluemine.batch.test.TestCollider;
import com.bluemine.common.RuleResponse;
import com.bluemine.common.TagResponse;
import com.bluemine.context.SessionContext;
import com.bluemine.domain.Call;
import com.bluemine.domain.entity.*;
import com.bluemine.repository.ChannelRepository;
import com.bluemine.service.TabService;
import com.bluemine.util.AssertUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.batch.core.*;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.Temporal;
import java.time.temporal.TemporalField;
import java.time.temporal.WeekFields;
import java.util.*;

/**
 * Created by hechao on 2018/7/3.
 */
@Service
public class CallCollectService {

    @Inject
    private JobLauncher jobLauncher;

    @Inject
    private ApplicationContext applicationContext;

    @Inject
    private BatchApplicationConfiguration batchApplicationConfiguration;

    @Inject
    private TabService tabService;

    @Inject
    private CallCollectTriggerService callCollectTriggerService;

    @Inject
    private ChannelRepository channelRepository;

    /**
     *
     * @param channelNo 商家号
     * @param callNo 会话号，不能重复
     * @param callDate 会话日期
     * @param seatNo 坐席号
     * @return
     */
    public boolean run(String channelNo, String callNo, String callDate, String seatNo) {

        ChannelEntity channel = channelRepository.findOneByChannelNo(channelNo);
        AssertUtils.notNull(channel, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        LocalDateTime now = LocalDateTime.now();
        CallCollectTriggerId triggerId = new CallCollectTriggerId()
                .channelNo(channelNo)
                .callNo(callNo)
                .callDate(LocalDate.parse(callDate))
                .seatNo(seatNo);

        CallCollectTriggerEntity trigger = callCollectTriggerService.findOne(triggerId);
        if ((trigger != null) && (!BatchStatus.FAILED.name().equals(trigger.getStatusCode()))) {
            throw new LogicException();
        }

        if (trigger == null) {
            trigger = callCollectTriggerService.createTrigger(triggerId, now);
            trigger.setStatusCode(BatchStatus.FAILED.name());
            trigger.setTriggerType(CallCollectConfiguration.TRIGGER_TYPE);
            trigger.setPartitionKey(channel.getPartitionKey());
        }

        boolean status = true;
        BatchRestartConfiguration restart = batchApplicationConfiguration.getRestart();

        if (trigger.getExecutiveNo().compareTo(restart.getExecutiveLimit()) > 0) {
            status = false;
        } else {
            try {
                Job callCollectJob = (Job) applicationContext.getBean("callCollectJob");
                JobParameters params = new JobParametersBuilder()
                        .addString(CallCollectConfiguration.PARAM_CHANNEL_NO, channelNo)
                        .addString(CallCollectConfiguration.PARAM_CALL_NO, callNo)
                        .addString(CallCollectConfiguration.PARAM_CALL_DATE, callDate)
                        .addString(CallCollectConfiguration.PARAM_SEAT_NO, seatNo)
                        .toJobParameters();
                JobExecution jobExecution = jobLauncher.run(callCollectJob, params);
                trigger.setDescText(StringUtils.abbreviate(jobExecution.getAllFailureExceptions().toString(),100));
                if (BatchStatus.COMPLETED.equals(jobExecution.getStatus())) {
                    trigger.setStatusCode(jobExecution.getStatus().name());
                } else {
                    status = false;
                }
            } catch (Exception e) {
                status = false;
            } finally {
                if (!status) {
                    trigger.setTriggerDate(now.plusSeconds(restart.getDelayTime()));
                }
                trigger.setExecutiveNo(trigger.getExecutiveNo() + 1);
                SessionContext context = new SessionContext();
                context.getRepository().commit(trigger);
            }
        }

        return status;
    }

    public void run(String channelNo, String callNo, LocalDate callDate, String seatNo) throws JobParametersInvalidException, JobExecutionAlreadyRunningException, JobRestartException, JobInstanceAlreadyCompleteException {
        run(channelNo, callNo, callDate.format(ServerConstants.YYYY_MM_DD_FORMATTER), seatNo);
    }

    public Collection<TagCollectEntity> collect(Call call, SessionContext context) {

        ChannelEntity channel = call.getChannel();
        AssertUtils.notNull(channel, ExceptionMessageEnum.NULL_EXCEPTION);

        Long channelId = channel.getChannelId();
        String channelNo = channel.getChannelNo();

        String callNo = call.getCallNo();
        AssertUtils.notNull(callNo, ExceptionMessageEnum.NULL_EXCEPTION);

        LocalDate callDate = call.getCallDate();
        AssertUtils.notNull(callDate, ExceptionMessageEnum.NULL_EXCEPTION);

        Set<TagCollectEntity> collects = new HashSet<>();
        Map<Long, TagResponse> tagMap = tabService.findAllWithRule(channelId);
        Collection<TagResponse> values = tagMap.values();

        int frequency;
        Stack<TagCollectEntity> venation;
        List<RuleResponse> rules;
        List<String> messages;
        for (TagResponse tag : values) {
            venation = vein(tag, tagMap, call, context);
            if ((venation != null) && (venation.size() > 0)) {
                rules = tag.getRules();
                for (RuleResponse rule : rules) {
                    messages = TestCollider.collide(channelNo, callNo, rule.getCallType(), rule.getRoleType(), rule.getRuleExps());
                    frequency = messages.size();
                    if (frequency > 0) {
                        collects.addAll(collect(tag, venation, rule, frequency));
                        continue;
                    }
                }
            }
        }
        return collects;
    }

    private static Stack<TagCollectEntity> vein(TagResponse tag, Map<Long, TagResponse> tags, Call call
            , SessionContext context) {
        if (!tag.getActivatedFlag()) {
            return null;
        }
        Map<Long, TagCollectEntity> venation = new LinkedHashMap<>();
        long tagId = tag.getTagId();
        TagCollectEntity tagCollect = createTabCollect(tag, call, context);
        venation.put(tagId, tagCollect);
        Long parentId = tag.getParentId();
        TagCollectEntity parentCollect;
        TagResponse parentTag;
        while ((parentId != null) && (parentId.compareTo(0L) > 0)) {
            parentTag = tags.get(parentId);
            if ((parentTag == null) || (!parentTag.getActivatedFlag())) {
                venation.clear();
                return null;
            }
            parentCollect = createTabCollect(parentTag, call, context);
            venation.put(parentId, parentCollect);
            parentId = parentTag.getParentId();
        }

        Stack<TagCollectEntity> stack = new Stack();
        stack.addAll(venation.values());
        return stack;
    }

    private static List<TagCollectEntity> collect(TagResponse tag, Stack<TagCollectEntity> venation, RuleResponse rule, int frequency) {
        TagCollectEntity tagCollect;
        List<TagCollectEntity> collects = new LinkedList<>();
        while (!venation.empty()) {
            tagCollect = venation.pop();
            TagCollectId id = tagCollect.getId();
            id.ruleId(rule.getRuleId());
            if (id.getTagId().compareTo(tag.getTagId()) == 0) {
                tagCollect.frequency(frequency);
            } else {
                tagCollect.subTotal(tagCollect.getSubTotal() + 1)
                        .subFrequency(tagCollect.getSubFrequency() + frequency);
            }
            collects.add(tagCollect);
        }
        return collects;
    }

    private static TagCollectEntity createTabCollect(TagResponse tag, Call call, SessionContext context) {
        SeatEntity seat = call.getSeat();
        ChannelEntity channel = call.getChannel();
        Long channelId = channel.getChannelId();
        String callNo = call.getCallNo();
        LocalDate callDate = call.getCallDate();

        TagCollectId id = new TagCollectId()
                .channelId(channelId)
                .callNo(callNo)
                .tagId(tag.getTagId())
                .ruleId(0L);
        TagCollectEntity entity = new TagCollectEntity()
                .id(id)
                .callDate(callDate)
                .callYear(callDate.getYear())
                .callMonth(callDate.getMonthValue())
                .callDay(callDate.getDayOfMonth())
                .callWeek(callDate.get(WeekFields.ISO.weekOfMonth()))
                .seatId(seat.getSeatId())
                .frequency(0)
                .subFrequency(0)
                .subTotal(0);
        entity.setPartitionKey(channel.getPartitionKey());
        return entity;
    }

}
