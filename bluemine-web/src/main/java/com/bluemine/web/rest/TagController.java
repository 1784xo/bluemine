package com.bluemine.web.rest;

import com.bluemine.common.HttpRestfulRequest;
import com.bluemine.common.HttpRestfulResponse;
import com.bluemine.common.TagRequest;
import com.bluemine.common.TagResponse;
import com.bluemine.rest.AbstractController;
import com.bluemine.service.TabService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    @PostMapping("findAll")
    public ResponseEntity findAll(@RequestBody HttpRestfulRequest<TagRequest> restfulRequest){
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        List<TagResponse> responses = tabService.findTreeWithRule(restfulRequest);
        restfulResponse.setResult(responses);

        return ResponseEntity.ok().body(restfulResponse);
    }

    @PostMapping("create")
    public ResponseEntity create(@RequestBody HttpRestfulRequest<TagRequest> restfulRequest){
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        TagResponse response = tabService.create(restfulRequest);
        restfulResponse.setResult(response);

        return ResponseEntity.ok().body(restfulResponse);
    }

    @PostMapping("update")
    public ResponseEntity update(@RequestBody HttpRestfulRequest<TagRequest> restfulRequest){
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        TagResponse response = tabService.update(restfulRequest);
        restfulResponse.setResult(response);

        return ResponseEntity.ok().body(restfulResponse);
    }
}
