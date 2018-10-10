package com.bluemine.rest.handler;

import com.bluemine.ServerConstants;
import com.bluemine.util.CookieUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by hechao on 2018/9/14.
 */
public class AuthenticationInterceptorAdapter extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Map<String, String> cookies = CookieUtils.getCookies(request);
        request.setAttribute(ServerConstants.CHANNEL_TOKEN,  cookies.get(ServerConstants.COOKIE_CHANNEL_NO));
        return super.preHandle(request, response, handler);
    }
}
