package com.bluemine.rest;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bluemine.common.EmployeeRequest;
import com.bluemine.common.EmployeeResponse;
import com.bluemine.common.EmployeeSort;
import com.bluemine.common.HttpRestfulRequest;
import com.bluemine.common.RestfulPageRequest;
import com.bluemine.common.RestfulRequest;
import com.bluemine.common.SortRequest;
import com.bluemine.service.EmployeeService;

/**
 * Created by yxghero2
 */
@RestController
@RequestMapping("/service/emp")
public class EmployeeController extends AbstractController {
    private static final Logger log = LoggerFactory.getLogger(EmployeeController.class);

    @Inject
    private EmployeeService empService;

    @ResponseBody
    @PostMapping("findAll")
    public ResponseEntity findPageAll(@RequestBody RestfulPageRequest<EmployeeRequest, SortRequest> restfulRequest) {
        Page<EmployeeResponse> page = empService.findPageAll(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse(page));
    }
    
    @ResponseBody
    @PostMapping("create")
    public ResponseEntity create(@RequestBody HttpRestfulRequest<EmployeeRequest> restfulRequest){
        EmployeeResponse response = empService.create(restfulRequest);
        return ResponseEntity.ok().body(createRestfulResponse().result(response));
    }

    @ResponseBody
    @PostMapping("update")
    public ResponseEntity update(@RequestBody HttpRestfulRequest<EmployeeRequest> restfulRequest){
    	EmployeeResponse  response = empService.update(restfulRequest);
        return ResponseEntity.ok().body(createRestfulResponse(response));
    }
    
    @ResponseBody
    @PostMapping("search")
    public ResponseEntity search(@RequestBody RestfulRequest<EmployeeRequest> restfulRequest) {
        List<EmployeeResponse> response = empService.findAllBySearch(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse(response));
    }
}
