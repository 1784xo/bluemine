package com.bluemine.scheduling;

import com.bluemine.context.SessionContext;
import com.bluemine.domain.entity.CallBatchTriggerId;
import com.bluemine.scheduling.CallBatchExecutor;

/**
 * Created by hechao on 2018/9/4.
 */
public class CallBatchThread implements Runnable {

    private CallBatchTriggerId triggerId;

    private CallBatchExecutor executor;

    private SessionContext context;

    public CallBatchThread(CallBatchTriggerId triggerId, CallBatchExecutor executor, SessionContext context) {
        this.triggerId = triggerId;
        this.executor = executor;
        this.context = context;
    }

    @Override
    public void run() {
        try {
//            Thread.sleep(5000);
            executor.execute(triggerId, context);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
        } finally {

        }
    }
}
