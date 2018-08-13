package com.bluemine.rest;

import com.bluemine.common.HttpRestfulRequest;
import com.bluemine.common.HttpRestfulResponse;
import com.bluemine.common.TagCollectRequest;
import com.bluemine.common.TagCollectResponse;
import com.bluemine.service.TagCollectService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by wangjt on 2018/7/22.
 */
@RestController
@RequestMapping("/service/tag/collect")
public class TagCollectController extends AbstractController {

    private static final Logger log = LoggerFactory.getLogger(TagCollectController.class);

    @Inject
    private TagCollectService tagCollectService;

//    @ResponseBody
//    @PostMapping("findByDate")
//    public ResponseEntity findByDate(@RequestBody HttpRestfulRequest<TagCollectRequest> restfulRequest) {
//        HttpRestfulResponse restfulResponse = createRestfulResponse();
//
//        List<TagCollectResponse> response = tagCollectService.findByDate(restfulRequest);
//        restfulResponse.setResult(response);
//
//        return ResponseEntity.ok(restfulResponse);
//    }

    @ResponseBody
    @PostMapping("find")
    public ResponseEntity find(@RequestBody HttpRestfulRequest<TagCollectRequest> restfulRequest, HttpServletResponse res) {
        res.setHeader("Access-Control-Allow-Origin", "*");
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        List<TagCollectResponse> response = tagCollectService.find(restfulRequest);
        restfulResponse.setResult(response);

        return ResponseEntity.ok(restfulResponse);
    }

    @ResponseBody
    @PostMapping("findSubTop")
    public ResponseEntity findSubTop(@RequestBody HttpRestfulRequest<TagCollectRequest> restfulRequest) {
        HttpRestfulResponse restfulResponse = createRestfulResponse();

        List<TagCollectResponse> response = tagCollectService.findSubTop(restfulRequest);
        restfulResponse.setResult(response);

        return ResponseEntity.ok(restfulResponse);
    }
}
