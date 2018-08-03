package com.bluemine.web.rest;

import com.bluemine.common.*;
import com.bluemine.rest.AbstractController;
import com.bluemine.service.TabCollectService;
import com.bluemine.service.TabService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by wangjt on 2018/7/22.
 */
@RestController
@RequestMapping("/service/tagcollect")
public class TagCollectController extends AbstractController {

    private static final Logger log = LoggerFactory.getLogger(TagCollectController.class);

    @Inject
    private TabCollectService tabCollectService;

    @PostMapping("findByDate")
    public ResponseEntity findByDate(@RequestBody HttpRestfulRequest<TagCollectRequest> restfulRequest){
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        List<TagCollectResponse> response = tabCollectService.findByDate(restfulRequest);
        restfulResponse.setResult(response);

        return ResponseEntity.ok().body(restfulResponse);
    }

    @PostMapping("findByTag")
    public ResponseEntity findByTag(@RequestBody HttpRestfulRequest<TagCollectRequest> restfulRequest,HttpServletResponse res){
        res.setHeader("Access-Control-Allow-Origin", "*");
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        List<ParentTagCollectResponse> response = tabCollectService.findByTag(restfulRequest);
        restfulResponse.setResult(response);

        return ResponseEntity.ok().body(restfulResponse);
    }

    @PostMapping("findBySubTag")
    public ResponseEntity findBySubTag(@RequestBody HttpRestfulRequest<TagCollectRequest> restfulRequest){
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        List<SubTagCollectResponse> response = tabCollectService.findBySubTag(restfulRequest);
        restfulResponse.setResult(response);

        return ResponseEntity.ok().body(restfulResponse);
    }
}
