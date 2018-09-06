package com.bluemine.common;

import java.util.Map;

/**
 * Created by hechao on 2018/9/6.
 */
public class SolrResponseHeader {
    private Integer status;
    private Integer QTime;
    private Map<String, String> params;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getQTime() {
        return QTime;
    }

    public void setQTime(Integer QTime) {
        this.QTime = QTime;
    }

    public Map<String, String> getParams() {
        return params;
    }

    public void setParams(Map<String, String> params) {
        this.params = params;
    }
}
