package com.bluemine.config;


import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Created by hechao on 2017/11/23.
 */
@ConfigurationProperties(prefix = "bluemine", ignoreUnknownFields = false)
public class WebApplicationConfiguration extends BootConfiguration {

    private String token;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
