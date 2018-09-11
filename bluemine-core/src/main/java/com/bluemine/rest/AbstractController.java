package com.bluemine.rest;


import com.bluemine.common.HttpRestfulPageResponse;
import com.bluemine.common.HttpRestfulResponse;
import org.springframework.data.domain.Page;

/**
 * Created by hechao on 2017/8/29.
 */
public abstract class AbstractController {
    public <T> HttpRestfulResponse createRestfulResponse(T a){
        return createRestfulResponse().result(a);
    }

    public HttpRestfulResponse createRestfulResponse(){
        return new HttpRestfulResponse();
    }

    public<T> HttpRestfulPageResponse createRestfulResponse(Page<T> page){
        HttpRestfulPageResponse response = new HttpRestfulPageResponse();
        response.setResult(page.getContent());
        response.setTotal(page.getTotalElements());
        response.setTotalPages(page.getTotalPages());
        return response;
    }
}
