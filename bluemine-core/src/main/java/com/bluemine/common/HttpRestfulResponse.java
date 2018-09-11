package com.bluemine.common;

import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;

import java.io.Serializable;

/**
 * Created by hechao on 2017/5/15.
 */
public class HttpRestfulResponse<T> implements Serializable{

    private static final long serialVersionUID = -1946898100338672779L;

    protected boolean success;

    protected HttpStatus status;

    protected T result;

    private String message;

    public HttpRestfulResponse() {
        this(true);
    }

    public HttpRestfulResponse(boolean success) {
        this(success, true);
    }

    public HttpRestfulResponse(boolean success, boolean receipt){
        this(success? HttpStatus.OK: HttpStatus.INTERNAL_SERVER_ERROR, receipt);
    }

    public HttpRestfulResponse(HttpStatus status) {
        this(status, true);
    }

    public HttpRestfulResponse(HttpStatus status, boolean receipt){
        this.success= HttpStatus.OK ==status;
        this.status = status;
    }

    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public HttpRestfulResponse<T> message(String message){
        setMessage(message);
        return this;
    }

    public String getStatus() {
        return status.toString();
    }
    public HttpRestfulResponse<T> status(HttpStatus status){
        setStatus(status);
        return this;
    }
    public void setStatus(HttpStatus status) {
        this.status = status;
    }

    public boolean getSuccess() {
        return success;
    }
    public void setSuccess(boolean success) {
        this.success = success;
    }
    public HttpRestfulResponse<T> success(boolean success){
        setSuccess(success);
        return this;
    }

    public T getResult() {
        return result;
    }
    public void setResult(T data) {
        this.result = data;
    }
    public HttpRestfulResponse<T> result(T data) {
        setResult(data);
        return this;
    }

    @Override
    public String toString() {
        return "HttpRestfulResponse{" +
                "message='" + message + '\'' +
                ", result=" + result +
                ", status=" + status +
                ", success=" + success +
                '}';
    }


}
