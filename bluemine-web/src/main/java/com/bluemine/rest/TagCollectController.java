package com.bluemine.rest;

import com.bluemine.common.*;
import com.bluemine.service.TagCollectService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
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

    @ResponseBody
    @PostMapping("findOne")
    public ResponseEntity find(@RequestBody RestfulRequest<TagCollectRequest> restfulRequest) {

        List<TagCollectResponse> response = tagCollectService.findOne(restfulRequest);

        return ResponseEntity.ok(createRestfulResponse().result(response));
    }

    @ResponseBody
    @PostMapping("findSubTop")
    public ResponseEntity findSubTop(@RequestBody HttpRestfulPageRequest<TagCollectRequest, TagCollectSort> restfulRequest) {

        List<TagCollectResponse> response = tagCollectService.findSubTop(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse().result(response));
    }

    @ResponseBody
    @PostMapping("findAll")
    public ResponseEntity findAll(@RequestBody RestfulPageRequest<TagCollectRequest, TagCollectSort> restfulRequest) {
        Page<TagCollectResponse> page = tagCollectService.findAll(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse(page));
    }

    @ResponseBody
    @PostMapping("findSub")
    public ResponseEntity findSub(@RequestBody RestfulPageRequest<TagCollectRequest, TagCollectSort> restfulRequest) {
        Page<TagCollectResponse> page = tagCollectService.findSub(restfulRequest);
        return ResponseEntity.ok(createRestfulResponse(page));
    }

}
