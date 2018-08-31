package com.bluemine.rest;

import com.bluemine.config.WebApplicationConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

/**
 * @author hechao
 * @date 2017/5/16.
 */
@Controller
@RequestMapping("/view")
public class ViewResolver {

    @Inject
    private WebApplicationConfiguration webApplicationConfiguration;

    @RequestMapping(value = "**")
    public String view(Model model, HttpServletRequest request) {
        model.addAttribute("token", webApplicationConfiguration.getToken());
        return request.getRequestURI().substring(6);
    }
}