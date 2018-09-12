package com.bluemine.rest;

import com.bluemine.common.*;
import com.bluemine.service.RuleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;

/**
 * Created by hechao on 2018/6/29.
 */
@RestController
@RequestMapping("/service/rule")
public class RuleController extends AbstractController {
    private static final Logger log = LoggerFactory.getLogger(RuleController.class);

    @Inject
    private RuleService ruleService;

    @ResponseBody
    @PostMapping("create")
    public ResponseEntity create(@RequestBody HttpRestfulRequest<RuleRequest> restfulRequest){
        RuleResponse response = ruleService.create(restfulRequest);
        return ResponseEntity.ok().body(createRestfulResponse().result(response));
    }

    @ResponseBody
    @PostMapping("delete")
    public ResponseEntity delete(@RequestBody HttpRestfulRequest<RuleRequest> restfulRequest){
        int num = ruleService.delete(restfulRequest);
        return ResponseEntity.ok().body(createRestfulResponse().result(num));
    }

    @ResponseBody
    @PostMapping("update")
    public ResponseEntity update(@RequestBody HttpRestfulRequest<RuleRequest> restfulRequest){
        RuleResponse  response = ruleService.update(restfulRequest);
        return ResponseEntity.ok().body(createRestfulResponse(response));
    }
}
