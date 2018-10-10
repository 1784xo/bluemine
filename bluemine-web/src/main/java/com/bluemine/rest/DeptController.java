package com.bluemine.rest;

import com.bluemine.common.*;
import com.bluemine.service.DeptService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by yxghero2
 */
@RestController
@RequestMapping("/service/dept")
public class DeptController extends AbstractController {

    private static final Logger log = LoggerFactory.getLogger(DeptController.class);

    @Inject
    private DeptService deptService;

    @ResponseBody
    @RequestMapping(value = "findDeptList/{channelId}")
    public ResponseEntity findDeptList(@PathVariable("channelId") Long channelId) {
        List<DeptResponse> responses = deptService.findAll(channelId);
        return ResponseEntity.ok(createRestfulResponse(responses));
    }
    
    @ResponseBody
    @RequestMapping(value = "findAll/{channelId}")
    public ResponseEntity findAll(@PathVariable("channelId") Long channelId) {
        List<DeptResponse> responses = deptService.findTreeWithEmp(channelId);
        return ResponseEntity.ok(createRestfulResponse(responses));
    }

    @ResponseBody
    @PostMapping("create")
    public ResponseEntity create(@RequestBody RestfulRequest<DeptRequest> restfulRequest) {
    	DeptResponse response = deptService.create(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse(response));
    }

    @ResponseBody
    @PostMapping("update")
    public ResponseEntity update(@RequestBody RestfulRequest<DeptRequest> restfulRequest) {
    	DeptResponse response = deptService.update(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse().result(response));
    }
}
