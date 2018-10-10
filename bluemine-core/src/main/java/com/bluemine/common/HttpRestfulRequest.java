package com.bluemine.common;

import com.bluemine.ServerConstants;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;


/**
 *
 * @param <T> data class
 */
public class HttpRestfulRequest<T> extends RestfulRequest<T> {

    public String getChannelToken(){
        return getRequest().getAttribute(ServerConstants.CHANNEL_TOKEN).toString();
    }

    public HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }
}
