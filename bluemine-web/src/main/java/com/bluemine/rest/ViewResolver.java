package com.bluemine.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author hechao
 * @date 2017/5/16.
 */
@Controller
@RequestMapping("/view")
public class ViewResolver {
    @RequestMapping(value = "**")
    public String view(HttpServletRequest request) {
        return request.getRequestURI().substring(5);
    }
}