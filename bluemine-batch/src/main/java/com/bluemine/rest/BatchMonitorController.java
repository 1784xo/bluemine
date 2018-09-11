package com.bluemine.rest;

import com.bluemine.common.BatchMonitorResponse;
import com.bluemine.common.CallBatchRequest;
import com.bluemine.common.HttpRestfulResponse;
import com.bluemine.common.RestfulRequest;
import com.bluemine.service.CallBatchExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * Created by hechao on 2018/9/7.
 */
@RestController
@RequestMapping("/service/monitor")
public class BatchMonitorController extends AbstractController{

    private static final Logger log = LoggerFactory.getLogger(BatchMonitorController.class);

    @Inject
    private CallBatchExecutor callBatchExecutor;

    @ResponseBody
    @PostMapping("batch")
    public ResponseEntity batch() {
        if (log.isDebugEnabled())
            log.debug(">>>REST Request monitor batch. ");

        HttpRestfulResponse restfulResponse = createRestfulResponse();

        BatchMonitorResponse response = new BatchMonitorResponse();
        response.setIdleCoreCount(callBatchExecutor.getIdleCoreCount());
        response.setActiveCount(callBatchExecutor.getActiveCount());
        response.setCorePoolSize(callBatchExecutor.getCorePoolSize());
        response.setMaxPoolSize(callBatchExecutor.getMaxPoolSize());
        response.setPoolSize(callBatchExecutor.getPoolSize());
        restfulResponse.setResult(response);

        if (log.isDebugEnabled())
            log.debug("<<<REST Response monitor batch. {}", restfulResponse);
        return ResponseEntity.ok().body(restfulResponse);
    }
}
