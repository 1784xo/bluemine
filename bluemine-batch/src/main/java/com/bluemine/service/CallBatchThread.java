package com.bluemine.service;

import com.bluemine.context.RequestContext;
import com.bluemine.domain.entity.CallBatchTriggerEntity;
import com.bluemine.domain.entity.CallBatchTriggerId;

/**
 * Created by hechao on 2018/9/4.
 */
public class CallBatchThread implements Runnable {

    private CallBatchTriggerId triggerId;

    private CallBatchExecutor executor;

    private RequestContext context;

    public CallBatchThread(CallBatchTriggerId triggerId, CallBatchExecutor executor, RequestContext context) {
        this.triggerId = triggerId;
        this.executor = executor;
        this.context = context;
    }

    @Override
    public void run() {
        try {
            executor.execute(triggerId, context);
        } finally {

        }
    }
}
