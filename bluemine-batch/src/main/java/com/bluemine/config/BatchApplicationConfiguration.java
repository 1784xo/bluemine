package com.bluemine.config;


import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Created by hechao on 2017/11/23.
 */
@ConfigurationProperties(prefix = "bluemine.batch", ignoreUnknownFields = false)
public class BatchApplicationConfiguration extends BootConfiguration {
    private BatchRestartConfiguration restart;

    public BatchRestartConfiguration getRestart() {
        return restart;
    }

    public void setRestart(BatchRestartConfiguration restart) {
        this.restart = restart;
    }
}
