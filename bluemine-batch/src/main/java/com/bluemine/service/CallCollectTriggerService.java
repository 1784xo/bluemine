//package com.bluemine.service;
//
//import com.bluemine.domain.entity.CallCollectTriggerEntity;
//import com.bluemine.domain.entity.CallCollectTriggerId;
//import com.bluemine.repository.CallCollectTriggerRepository;
//import org.springframework.stereotype.Service;
//
//import javax.inject.Inject;
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//
///**
// * Created by hechao on 2018/7/19.
// */
//@Service
//public class CallCollectTriggerService {
//    @Inject
//    private CallCollectTriggerRepository callCollectTriggerRepository;
//
//    public CallCollectTriggerEntity findOne(CallCollectTriggerId id) {
//        return callCollectTriggerRepository.findOne(id);
//    }
//
//    public CallCollectTriggerEntity findOne(String channelId, String callNo, String callDate, String seatNo) {
//        return findOne(channelId, callNo, callDate, seatNo);
//    }
//
//    public CallCollectTriggerEntity findOne(String channelId, String callNo, LocalDate callDate) {
//        CallCollectTriggerId triggerId = new CallCollectTriggerId()
//                .channelId(channelId)
//                .callNo(callNo)
//                .callDate(callDate)
//        return findOne(triggerId);
//    }
//
//    public CallCollectTriggerEntity createTrigger(CallCollectTriggerId id, LocalDateTime triggerDate) {
//        CallCollectTriggerEntity entity = new CallCollectTriggerEntity().id(id)
//                .triggerDate(triggerDate)
//                .executiveNo(0)
//                .requestTime(LocalDateTime.now());
//        return entity;
//    }
//
//    public CallCollectTriggerEntity createTrigger(String channelId, String callNo, String callDate, String seatNo, LocalDateTime triggerDate) {
//        CallCollectTriggerId id = new CallCollectTriggerId().channelId(channelId)
//                .callNo(callNo)
//                .callDate(LocalDate.parse(callDate))
//                .seatNo(seatNo);
//
//        return createTrigger(id, triggerDate);
//    }
//
//    public void save(CallCollectTriggerEntity entity) {
//        callCollectTriggerRepository.save(entity);
//    }
//}
