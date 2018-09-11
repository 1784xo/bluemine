package com.bluemine.rest;

import com.bluemine.common.BatchMonitorResponse;
import com.bluemine.common.HttpRestfulResponse;
import com.bluemine.scheduling.CallBatchExecutor;
import com.bluemine.scheduling.CallBatchScheduler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hechao on 2018/9/7.
 */
@RestController
@RequestMapping("/service/monitor")
public class BatchMonitorController extends AbstractController{

    private static final Logger log = LoggerFactory.getLogger(BatchMonitorController.class);

    @Inject
    private CallBatchExecutor callBatchExecutor;

    @Inject
    private CallBatchScheduler callBatchScheduler;

    @ResponseBody
    @PostMapping("batch")
    public ResponseEntity batch() {
        if (log.isDebugEnabled())
            log.debug(">>>REST Request monitor batch. ");

        Map<String, BatchMonitorResponse> map = new HashMap<>();
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        BatchMonitorResponse executor = new BatchMonitorResponse();
        executor.setIdleCoreCount(callBatchExecutor.getIdleCoreCount());
        executor.setActiveCount(callBatchExecutor.getActiveCount());
        executor.setCorePoolSize(callBatchExecutor.getCorePoolSize());
        executor.setMaxPoolSize(callBatchExecutor.getMaxPoolSize());
        executor.setPoolSize(callBatchExecutor.getPoolSize());
        executor.setCompletedTaskCount(callBatchExecutor.getCompletedTaskCount());
        executor.setTaskCount(callBatchExecutor.getTaskCount());
        map.put("executor", executor);

        BatchMonitorResponse scheduler = new BatchMonitorResponse();
        scheduler.setIdleCoreCount(callBatchScheduler.getIdleCoreCount());
        scheduler.setActiveCount(callBatchScheduler.getActiveCount());
        scheduler.setCorePoolSize(callBatchScheduler.getCorePoolSize());
        scheduler.setMaxPoolSize(callBatchScheduler.getMaxPoolSize());
        scheduler.setPoolSize(callBatchScheduler.getPoolSize());
        scheduler.setCompletedTaskCount(callBatchScheduler.getCompletedTaskCount());
        scheduler.setTaskCount(callBatchScheduler.getTaskCount());
        map.put("scheduler", scheduler);

        restfulResponse.setResult(map);

        if (log.isDebugEnabled())
            log.debug("<<<REST Response monitor batch. {}", restfulResponse);
        return ResponseEntity.ok().body(restfulResponse);
    }
}
