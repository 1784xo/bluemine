package com.bluemine.config;

/**
 * Created by hechao on 2018/7/20.
 */
public class BatchRestartConfiguration {
    private Long delayTime;

    private Integer executiveLimit;

    public BatchRestartConfiguration() {
        executiveLimit = 3;
    }

    public Long getDelayTime() {
        return delayTime;
    }

    public void setDelayTime(Long delayTime) {
        this.delayTime = delayTime;
    }

    public Integer getExecutiveLimit() {
        return executiveLimit;
    }

    public void setExecutiveLimit(Integer executiveLimit) {
        this.executiveLimit = executiveLimit;
    }
}
