package com.bluemine.web.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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