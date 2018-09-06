package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.CallBatchRequest;
import com.bluemine.context.RequestContext;
import com.bluemine.domain.entity.CallBatchTriggerEntity;
import com.bluemine.domain.entity.CallBatchTriggerId;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.repository.CallBatchTriggerRepository;
import com.bluemine.repository.ChannelRepository;
import com.bluemine.struct.BatchTriggerStatus;
import com.bluemine.util.AssertUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by hechao on 2018/9/4.
 */
@Service
public class CallBatchService {

    private static final Logger log = LoggerFactory.getLogger(CallBatchService.class);

    @Inject
    private ChannelRepository channelRepository;

    @Inject
    private CallBatchTriggerRepository callBatchTriggerRepository;

    @Inject
    private CallBatchExecutor callBatchExecutor;

    public void writeAndExecute(CallBatchRequest[] requests, LocalDateTime businessTime, RequestContext context) {
        writeTrigger(requests, businessTime);
        execute(LocalDateTime.now(), context);
    }

    public void execute(LocalDateTime triggerDate, RequestContext context) {
        Page<CallBatchTriggerEntity> page = callBatchTriggerRepository.findAll(BatchTriggerStatus.WAIT, triggerDate, new PageRequest(0, 5));
        List<CallBatchTriggerEntity> content = page.getContent();
        for (CallBatchTriggerEntity trigger : content) {
            callBatchExecutor.start(trigger.getId(), context);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void writeTrigger(CallBatchRequest[] requests, LocalDateTime businessTime) {
        if (log.isDebugEnabled())
            log.debug("start write triggers.");
        List<CallBatchTriggerEntity> entityList = new LinkedList<>();
        ChannelEntity channel;
        CallBatchTriggerEntity trigger;
        for (CallBatchRequest request : requests) {
            channel = channelRepository.findOneByChannelNo(request.getChannelNo());
            AssertUtils.notNull(channel, ExceptionMessageEnum.DB_NO_SUCH_RESULT);
            trigger = createTrigger(channel, request, businessTime);
            trigger.setStatusCode(BatchTriggerStatus.WAIT);
            trigger.setPartitionKey(channel.getPartitionKey());
            entityList.add(trigger);
        }
        save(entityList);
    }

    public CallBatchTriggerEntity createTrigger(ChannelEntity channel, CallBatchRequest request) {
        return createTrigger(channel.getChannelId(), request.getCallNo(), request.getCallDate(), request.getSeatNo(), LocalDateTime.now());
    }

    public CallBatchTriggerEntity createTrigger(ChannelEntity channel, CallBatchRequest request, LocalDateTime triggerDate) {
        return createTrigger(channel.getChannelId(), request.getCallNo(), request.getCallDate(), request.getSeatNo(), triggerDate);
    }

    public CallBatchTriggerEntity createTrigger(CallBatchTriggerId id, LocalDateTime triggerDate) {
        CallBatchTriggerEntity entity = new CallBatchTriggerEntity().id(id)
                .triggerDate(triggerDate)
                .executiveNo(0)
                .requestTime(LocalDateTime.now());
        return entity;
    }

    public CallBatchTriggerEntity createTrigger(Long channelId, String callNo, LocalDate callDate, String seatNo, LocalDateTime triggerDate) {
        CallBatchTriggerId id = new CallBatchTriggerId()
                .channelId(channelId)
                .callNo(callNo)
                .callDate(callDate)
                .seatNo(seatNo);
        return createTrigger(id, triggerDate);
    }

    public void save(CallBatchTriggerEntity entity) {
        callBatchTriggerRepository.save(entity);
    }

    public void save(Iterable<CallBatchTriggerEntity> iterable) {
        callBatchTriggerRepository.save(iterable);
    }
}
