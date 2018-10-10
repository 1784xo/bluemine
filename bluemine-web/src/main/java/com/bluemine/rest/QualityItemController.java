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
@RequestMapping("/service/qualityitem")
public class QualityItemController extends AbstractController {

    private static final Logger log = LoggerFactory.getLogger(QualityItemController.class);

    @Inject
    private QualityRuleService quaService;
    
    @ResponseBody
    @PostMapping("create")
    public ResponseEntity create(@RequestBody RestfulRequest<QualityItemRequest> restfulRequest) {
          QualityItemResponse response = quaService.createItem(restfulRequest);
          return ResponseEntity.ok(createRestfulResponse(response));
    }

    @ResponseBody
    @PostMapping("update")
    public ResponseEntity update(@RequestBody RestfulRequest<QualityItemRequest> restfulRequest) {
    	QualityItemResponse response = quaService.updateItem(restfulRequest);
           return ResponseEntity.ok(createRestfulResponse(response));
    }    
    
    @ResponseBody
    @PostMapping("saveAll")
    public ResponseEntity saveAll(@RequestBody RestfulRequest<QualityItemRequest> restfulRequest) {
    	List<QualityItemResponse> response = quaService.saveAll(restfulRequest);
           return ResponseEntity.ok(createRestfulResponse(response));
    }
    
    @ResponseBody
    @PostMapping("search")
    public ResponseEntity search(@RequestBody RestfulRequest<QualityItemRequest> restfulRequest) {
        List<QualityItemResponse> response = quaService.findItemAllByRowID(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse(response));
    }
    
    @ResponseBody
    @PostMapping("delete")
    public ResponseEntity delete(@RequestBody RestfulRequest<QualityItemRequest> restfulRequest) {
        int num = quaService.delete(restfulRequest);
        return ResponseEntity.ok().body(createRestfulResponse().result(num));
    }
}
