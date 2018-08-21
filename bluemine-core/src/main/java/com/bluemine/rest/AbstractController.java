package com.bluemine.rest;


import com.bluemine.common.RestfulGenericRequest;
import com.bluemine.common.HttpRestfulResponse;
import com.bluemine.common.RestfulRequest;
import com.bluemine.context.RequestContext;

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

    public HttpRestfulResponse createRestfulResponse(RequestContext context){
        RestfulRequest request = context.getRequest();
        RestfulGenericRequest generic = request.getGeneric();
        return new HttpRestfulResponse(true, generic.getReceipt());
    }
}
