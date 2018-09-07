package com.bluemine.rest;

import com.bluemine.common.CallBatchRequest;
import com.bluemine.common.HttpRestfulResponse;
import com.bluemine.common.RestfulRequest;
import com.bluemine.service.CallBatchService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * Created by hechao on 2018/9/3.
 */
@RestController
@RequestMapping("/service/call/trigger")
public class CallTriggerController extends AbstractController {

    private static final Logger log = LoggerFactory.getLogger(CallTriggerController.class);

    @Inject
    private CallBatchService callBatchService;

    @ResponseBody
    @PostMapping("batch")
    public ResponseEntity batch(@RequestBody RestfulRequest<CallBatchRequest[]> restfulRequest) {

        if (log.isDebugEnabled())
            log.debug(">>>REST Request call batch. {}", restfulRequest);

        HttpRestfulResponse restfulResponse = createRestfulResponse();

        callBatchService.writeAndExecute(restfulRequest.getData(), restfulRequest.getBusinessTime(), restfulRequest.getContext());

        if (log.isDebugEnabled())
            log.debug("<<<REST Response call batch. {}", restfulResponse);

        return ResponseEntity.ok().body(restfulResponse);
    }
}
