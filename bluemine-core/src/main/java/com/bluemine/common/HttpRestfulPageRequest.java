package com.bluemine.common;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by hechao on 2018/8/21.
 */
public class HttpRestfulPageRequest<D, S extends SortRequest> extends RestfulPageRequest<D, S>{
    public HttpServletRequest getHttpRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }
}
