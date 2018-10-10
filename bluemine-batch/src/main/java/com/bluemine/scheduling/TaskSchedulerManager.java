package com.bluemine.scheduling;

import com.bluemine.job.CallBatchExecutor;
import com.bluemine.service.CallSyncService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.inject.Inject;

/**
 * Created by hechao on 2018/9/25.
 */
@Component
public class TaskSchedulerManager {

    @Inject
    private CallSyncService callSyncService;

    //TODO: later call sync observer configurable
    @Inject
    private CallBatchExecutor callBatchExecutor;

    @Scheduled(cron = "${bluemine.call-sync.cron}")
    public void callSync() {
        callSyncService.sync(callBatchExecutor);
    }
}
