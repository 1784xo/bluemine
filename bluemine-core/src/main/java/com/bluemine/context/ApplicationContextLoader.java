package com.bluemine.context;


import com.bluemine.config.BootConfiguration;
import org.springframework.context.ApplicationContext;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by hechao on 2017/8/31.
 */
public abstract class ApplicationContextLoader {

    private static final Map<ClassLoader, ServerApplicationContext> currentContextPerThread =
            new ConcurrentHashMap<ClassLoader, ServerApplicationContext>(1);

    private static volatile ServerApplicationContext currentContext;

    private ServerApplicationContext context;

    protected void contextInitialized(Class<? extends BootConfiguration> cls, ApplicationContext context) {
        if (this.context == null) {
            this.context = initApplicationContext(cls, context);
            currentContext = this.context;
        } else {
            throw new RuntimeException("context is existing.");
        }
    }

    public final static ServerApplicationContext initApplicationContext(Class<? extends BootConfiguration> cls, ApplicationContext context) {
        BootConfiguration config = (BootConfiguration) context.getBean(cls);
        if (config == null) {
            throw new IllegalArgumentException();
        }

        ClassLoader classLoader = cls.getClassLoader();
        ServerApplicationContext serverApplicationContext = getServerApplicationContext(classLoader);
        if (serverApplicationContext == null) {
            serverApplicationContext = new ServerApplicationContext(context);
            currentContextPerThread.put(classLoader, serverApplicationContext);
        }

        config.initialize(serverApplicationContext);
        return serverApplicationContext;
    }

    public final static ServerApplicationContext getServerApplicationContext(ClassLoader classLoader) {
        return currentContextPerThread.get(classLoader);
    }

    public final static ServerApplicationContext getCurrentServerApplicationContext() {
        ClassLoader ccl = Thread.currentThread().getContextClassLoader();
        if (ccl != null) {
            ServerApplicationContext ccpt = getServerApplicationContext(ccl);
            if (ccpt != null) {
                return ccpt;
            }
        }
        return currentContext;
    }
}
