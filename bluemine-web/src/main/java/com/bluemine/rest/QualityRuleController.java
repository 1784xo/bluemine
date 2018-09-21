package com.bluemine.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.bluemine.common.*;
import com.bluemine.service.QualityRuleService;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by hechao on 2018/6/28.
 */
@RestController
@RequestMapping("/service/qualityrule")
public class QualityRuleController extends AbstractController {

    private static final Logger log = LoggerFactory.getLogger(QualityRuleController.class);

    @Inject
    private QualityRuleService quaService;

    @ResponseBody
    @RequestMapping(value = "findAll/{channelId}")
    public ResponseEntity findAll(@PathVariable("channelId") Long channelId) {
        List<QualityGroupResponse> responses = quaService.findAll(channelId);
        return ResponseEntity.ok(createRestfulResponse(responses));
    }

    @ResponseBody
    @PostMapping("create")
    public ResponseEntity create(@RequestBody RestfulRequest<QualityGroupRequest> restfulRequest) {
          QualityGroupResponse response = quaService.create(restfulRequest);
          return ResponseEntity.ok(createRestfulResponse(response));
    }

    @ResponseBody
    @PostMapping("update")
    public ResponseEntity update(@RequestBody RestfulRequest<QualityGroupRequest> restfulRequest) {
           QualityGroupResponse response = quaService.update(restfulRequest);
           return ResponseEntity.ok(createRestfulResponse(response));
    }    
    
    @ResponseBody
    @PostMapping("search")
    public ResponseEntity search(@RequestBody RestfulRequest<QualityGroupRequest> restfulRequest) {
        List<QualityGroupResponse> response = quaService.findAllBySearch(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse(response));
    }
}
