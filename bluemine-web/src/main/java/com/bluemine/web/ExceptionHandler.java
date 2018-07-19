package com.bluemine.web;

import com.bluemine.common.HttpRestfulResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 统一异常处理
 *
 * @author jinzhengang
 * @date 2018-04-09 11:01
 **/
@ControllerAdvice
public class ExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(ExceptionHandler.class);

    @org.springframework.web.bind.annotation.ExceptionHandler(value = Exception.class)
    @ResponseBody
    public HttpRestfulResponse handlerException(HttpServletRequest request, Exception e) {
        if (log.isErrorEnabled()) {
            log.error("Exception url:{}, error:{}", request.getRequestURI(), e);
        }
        return new HttpRestfulResponse()
                .success(false)
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .message(e.getMessage());
    }
}
