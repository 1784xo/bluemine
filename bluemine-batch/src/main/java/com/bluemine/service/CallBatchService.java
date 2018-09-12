package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.CallBatchRequest;
import com.bluemine.context.RequestContext;
import com.bluemine.domain.entity.CallBatchTriggerEntity;
import com.bluemine.domain.entity.CallBatchTriggerId;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.repository.CallBatchTriggerRepository;
import com.bluemine.repository.ChannelRepository;
import com.bluemine.scheduling.CallBatchExecutor;
import com.bluemine.scheduling.CallBatchScheduler;
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
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
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

    @Inject
    private CallBatchScheduler callBatchScheduler;


    public void check() {
        AssertUtils.isTrue(callBatchScheduler.getCompletedTaskCount() == callBatchScheduler.getTaskCount()
                , ExceptionMessageEnum.LOGIC_EXCEPTION, "调度存在未执行完的任务，不能完成本次操作，请稍后重试。");
    }

    /**
     * 创建一个新跑批触发时间的调度
     * @param triggerTime 调度触发时间
     * @param context
     */
    public void schedule(LocalDateTime triggerTime, final RequestContext context) {
        schedule(triggerTime, LocalDateTime.MAX, context);
    }

    /**
     * 创建一个新跑批触发时间的调度
     * @param triggerTime 调度触发时间
     * @param businessTime 交易查询时间
     * @param context
     */
    public void schedule(LocalDateTime triggerTime, final LocalDateTime businessTime, final RequestContext context) {
        check();
        final CallBatchService me = this;
        final int number = callBatchExecutor.getCorePoolSize();
        ZonedDateTime zdt = triggerTime.atZone(ZoneId.systemDefault());
        Date date = Date.from(zdt.toInstant());
        if (log.isInfoEnabled())
            log.info(">>>add trigger task to scheduler. number: {}; trigger: {}", number, triggerTime);
        callBatchScheduler.addTriggerTask(new Runnable() {
            @Override
            public void run() {
                me.execute(number, businessTime, context);
            }
        }, date);
    }

    /**
     * @param number      跑批批次线程数量
     * @param triggerTime 跑批触发时间
     * @param context     设备上下文
     */
    public void execute(int number, LocalDateTime triggerTime, RequestContext context) {
        long waiting = 1;
        while (waiting > 0) {
            Page<CallBatchTriggerEntity> page = callBatchTriggerRepository.findAll(BatchTriggerStatus.WAIT, triggerTime, new PageRequest(0, number));
            waiting = page.getTotalElements() - page.getNumberOfElements();

            if (page.getNumberOfElements() == 0)
                return;

            if (log.isInfoEnabled())
                log.info(">>>push call batchs to executor. number: {}; waiting: {}", number, waiting);

            List<CallBatchTriggerEntity> content = page.getContent();
            for (CallBatchTriggerEntity trigger : content) {
                callBatchExecutor.prepare(trigger.getId(), context).start();
            }

            while (callBatchExecutor.getIdleCoreCount() != number) {
            }
        }
    }

    /**
     * 写入跑批元数据并加入调度
     *
     * @param requests
     * @param businessTime
     */
    @Transactional(rollbackFor = Exception.class)
    public void writeTrigger(CallBatchRequest[] requests, LocalDateTime businessTime) {
        if (log.isDebugEnabled())
            log.debug(">>>write call batch triggers.");
        List<CallBatchTriggerEntity> entityList = new LinkedList<>();
        ChannelEntity channel;
        CallBatchTriggerEntity trigger;
        for (CallBatchRequest request : requests) {
            channel = channelRepository.findOneByChannelNo(request.getChannelNo());
            AssertUtils.notNull(channel, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "channelNo", request.getChannelNo());
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
