package com.bluemine.batch.service;

import com.bluemine.batch.job.cycle.CallCollectConfiguration;
import com.bluemine.domain.entity.CallCollectTriggerEntity;
import com.bluemine.repository.CallCollectTriggerRepository;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
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

    public CallCollectTriggerEntity findOne(long jobId) {
        return callCollectTriggerRepository.findOne(jobId);
    }

    public CallCollectTriggerEntity create(JobExecution execution) {
        JobParameters jobParameters = execution.getJobParameters();

        String channelNo = jobParameters.getString(CallCollectConfiguration.PARAM_CHANNEL_NO);
        String seatNo = jobParameters.getString(CallCollectConfiguration.PARAM_SEAT_NO);
        String callNo = jobParameters.getString(CallCollectConfiguration.PARAM_CALL_NO);
        String callDate = jobParameters.getString(CallCollectConfiguration.PARAM_CALL_DATE);

        CallCollectTriggerEntity entity = new CallCollectTriggerEntity()
                .callDate(LocalDate.parse(callDate))
                .callNo(callNo)
                .channelNo(channelNo)
                .executiveNo(0)
                .jobInstanceId(execution.getJobId())
                .requestTime(LocalDateTime.now())
                .statusCode(execution.getStatus().name())
                .seatNo(seatNo)
                .triggerDate(LocalDateTime.now())
                .triggerType(CallCollectConfiguration.TRIGGER_TYPE);

        return entity;
    }

    public void save(CallCollectTriggerEntity entity){
        callCollectTriggerRepository.save(entity);
    }
}
