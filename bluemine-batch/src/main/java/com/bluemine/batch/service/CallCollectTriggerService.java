package com.bluemine.batch.service;

import com.bluemine.domain.entity.CallCollectTriggerEntity;
import com.bluemine.domain.entity.CallCollectTriggerId;
import com.bluemine.repository.CallCollectTriggerRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Created by hechao on 2018/7/19.
 */
@Service
public class CallCollectTriggerService {
    @Inject
    private CallCollectTriggerRepository callCollectTriggerRepository;

    public CallCollectTriggerEntity findOne(CallCollectTriggerId id) {
        return callCollectTriggerRepository.findOne(id);
    }

    public CallCollectTriggerEntity findOne(String channelNo, String callNo, String callDate, String seatNo) {
        return findOne(channelNo, callNo, LocalDate.parse(callDate), seatNo);
    }

    public CallCollectTriggerEntity findOne(String channelNo, String callNo, LocalDate callDate, String seatNo) {
        CallCollectTriggerId triggerId = new CallCollectTriggerId()
                .channelNo(channelNo)
                .callNo(callNo)
                .callDate(callDate)
                .seatNo(seatNo);
        return findOne(triggerId);
    }

    public CallCollectTriggerEntity createTrigger(CallCollectTriggerId id, LocalDateTime triggerDate) {
        CallCollectTriggerEntity entity = new CallCollectTriggerEntity().id(id)
                .triggerDate(triggerDate)
                .executiveNo(0)
                .requestTime(LocalDateTime.now());
        return entity;
    }

    public CallCollectTriggerEntity createTrigger(String channelNo, String callNo, String callDate, String seatNo, LocalDateTime triggerDate) {
        CallCollectTriggerId id = new CallCollectTriggerId().channelNo(channelNo)
                .callNo(callNo)
                .callDate(LocalDate.parse(callDate))
                .seatNo(seatNo);

        return createTrigger(id, triggerDate);
    }

    public void save(CallCollectTriggerEntity entity) {
        callCollectTriggerRepository.save(entity);
    }
}
