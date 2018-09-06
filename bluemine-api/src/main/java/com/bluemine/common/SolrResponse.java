package com.bluemine.common;

/**
 * Created by hechao on 2018/9/6.
 */
public class SolrResponse {
    private SolrResponseHeader responseHeader;
    private SolrResponseBody response;

    public SolrResponseHeader getResponseHeader() {
        return responseHeader;
    }

    public void setResponseHeader(SolrResponseHeader responseHeader) {
        this.responseHeader = responseHeader;
    }

    public SolrResponseBody getResponse() {
        return response;
    }

    public void setResponse(SolrResponseBody response) {
        this.response = response;
    }
}
