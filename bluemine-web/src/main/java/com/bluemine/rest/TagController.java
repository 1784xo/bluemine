package com.bluemine.rest;

import com.bluemine.common.*;
import com.bluemine.service.TabService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by hechao on 2018/6/28.
 */
@RestController
@RequestMapping("/service/tag")
public class TagController extends AbstractController {

    private static final Logger log = LoggerFactory.getLogger(TagController.class);

    @Inject
    private TabService tabService;

    @ResponseBody
    @RequestMapping(value = "test/{channelId}")
    public ResponseEntity test(@PathVariable("channelId") Long channelId) {
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        List<TagResponse> responses = tabService.findTreeWithRule(channelId);
        restfulResponse.setResult(responses);
        new Integer(null);
        return ResponseEntity.ok(restfulResponse);
    }

    @ResponseBody
    @RequestMapping(value = "findAll/{channelId}")
    public ResponseEntity findAll(@PathVariable("channelId") Long channelId) {
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        List<TagResponse> responses = tabService.findTreeWithRule(channelId);
        restfulResponse.setResult(responses);
        return ResponseEntity.ok(restfulResponse);
    }

    @ResponseBody
    @PostMapping("create")
    public ResponseEntity create(@RequestBody RestfulRequest<TagRequest> restfulRequest) {
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        TagResponse response = tabService.create(restfulRequest);
        restfulResponse.setResult(response);

        return ResponseEntity.ok(restfulResponse);
    }

    @ResponseBody
    @PostMapping("update")
    public ResponseEntity update(@RequestBody RestfulRequest<TagRequest> restfulRequest) {
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        TagResponse response = tabService.update(restfulRequest);
        restfulResponse.setResult(response);

        return ResponseEntity.ok(restfulResponse);
    }
}
