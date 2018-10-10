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
@RequestMapping("/service/qualityrow")
public class QualityRowController extends AbstractController {

    private static final Logger log = LoggerFactory.getLogger(QualityRowController.class);

    @Inject
    private QualityRuleService quaService;

    @ResponseBody
    @RequestMapping(value = "findAll/{channelId}")
    public ResponseEntity findAll(@PathVariable("channelId") Long channelId) {
        List<QualityRowResponse> responses = quaService.findRowAll(channelId);
        return ResponseEntity.ok(createRestfulResponse(responses));
    }
    
    @ResponseBody
    @PostMapping("create")
    public ResponseEntity create(@RequestBody RestfulRequest<QualityRowRequest> restfulRequest) {
          QualityRowResponse response = quaService.createRow(restfulRequest);
          return ResponseEntity.ok(createRestfulResponse(response));
    }

    @ResponseBody
    @PostMapping("update")
    public ResponseEntity update(@RequestBody RestfulRequest<QualityRowRequest> restfulRequest) {
    	QualityRowResponse response = quaService.updateRow(restfulRequest);
           return ResponseEntity.ok(createRestfulResponse(response));
    }    
    
    @ResponseBody
    @PostMapping("search")
    public ResponseEntity search(@RequestBody RestfulRequest<QualityRowRequest> restfulRequest) {
        List<QualityRowResponse> response = quaService.findAllRowBySearch(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse(response));
    }
}
