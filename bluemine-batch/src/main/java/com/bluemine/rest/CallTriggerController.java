package com.bluemine.rest;

import com.bluemine.common.CallSyncRequest;
import com.bluemine.common.HttpRestfulResponse;
import com.bluemine.common.RestfulRequest;
import com.bluemine.domain.entity.CallSyncTriggerEntity;
import com.bluemine.service.CallSyncService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * Created by hechao on 2018/9/3.
 */
@RestController
@RequestMapping("/service/call")
public class CallTriggerController extends AbstractController {

    private static final Logger log = LoggerFactory.getLogger(CallTriggerController.class);

    @Inject
    private CallSyncService callSyncService;

//    @Inject
//    private CallBatchService callBatchService;

//    @ResponseBody
//    @PostMapping("batch")
//    public ResponseEntity batch(@RequestBody RestfulRequest<CallBatchRequest[]> restfulRequest) {
//
//        if (log.isDebugEnabled())
//            log.debug(">>>REST Request call batch. {}", restfulRequest);
//
//        HttpRestfulResponse restfulResponse = createRestfulResponse();
//
//        LocalDateTime businessTime = restfulRequest.getBusinessTime();
//
//        callBatchService.writeTrigger(restfulRequest.getData(), businessTime);
//        callBatchService.schedule(businessTime.plusSeconds(10), restfulRequest.getContext());
//
//        if (log.isDebugEnabled())
//            log.debug("<<<REST Response call batch. {}", restfulResponse);
//
//        return ResponseEntity.ok().body(restfulResponse);
//    }

    @ResponseBody
    @PostMapping("sync")
    public ResponseEntity sync(@RequestBody RestfulRequest<CallSyncRequest> restfulRequest) {

        if (log.isDebugEnabled())
            log.debug(">>>REST Request call sync. {}", restfulRequest);

        CallSyncTriggerEntity entity = callSyncService.writeTrigger(restfulRequest);
        HttpRestfulResponse restfulResponse = createRestfulResponse(entity);

        if (log.isDebugEnabled())
            log.debug("<<<REST Response call sync. {}", restfulResponse);

        return ResponseEntity.ok().body(restfulResponse);
    }
}
