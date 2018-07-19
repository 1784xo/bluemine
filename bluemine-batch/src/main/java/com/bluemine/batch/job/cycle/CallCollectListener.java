package com.bluemine.batch.job.cycle;

import com.bluemine.batch.service.CallCollectTriggerService;
import com.bluemine.domain.entity.CallCollectTriggerEntity;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.repository.ChannelRepository;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobExecutionListener;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.annotation.AfterJob;
import org.springframework.batch.core.annotation.BeforeJob;
import org.springframework.stereotype.Component;

import javax.inject.Inject;
import java.util.Date;

/**
 * Created by hechao on 2018/7/19.
 */
@Component
public class CallCollectListener implements JobExecutionListener {

    @Inject
    private ChannelRepository channelRepository;

    @Inject
    private CallCollectTriggerService callCollectTriggerService;

    @Override
    @BeforeJob
    public void beforeJob(JobExecution jobExecution) {
        Long jobId = jobExecution.getJobId();
        CallCollectTriggerEntity triggerEntity = callCollectTriggerService.findOne(jobId);
        if (triggerEntity == null) {
            JobParameters jobParameters = jobExecution.getJobParameters();
            String channelNo = jobParameters.getString(CallCollectConfiguration.PARAM_CHANNEL_NO);
            ChannelEntity channelEntity = channelRepository.findOneByChannelNo(channelNo);
            triggerEntity = callCollectTriggerService.create(jobExecution);
            triggerEntity.partitionKey(channelEntity.getPartitionKey());
        }
        triggerEntity.executiveNo(triggerEntity.getExecutiveNo() + 1)
                .jobExecutionId(jobExecution.getId());

        callCollectTriggerService.save(triggerEntity);
    }

    @Override
    @AfterJob
    public void afterJob(JobExecution jobExecution) {
        this.hashCode();
    }
}
