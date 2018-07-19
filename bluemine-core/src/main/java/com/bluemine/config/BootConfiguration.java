package com.bluemine.config;

import com.bluemine.context.ServerApplicationContext;

/**
 * Created by hechao on 2017/9/8.
 */

public abstract class BootConfiguration {

    private String version;

    private ServerApplicationContext context;

    public void initialize(ServerApplicationContext context) {
        this.context = context;
    }

    public ServerApplicationContext getContext() {
        return context;
    }

    public void setContext(ServerApplicationContext context) {
        this.context = context;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }
}
