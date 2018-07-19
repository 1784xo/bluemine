package com.bluemine.context;

import com.bluemine.ServerConstants;
import com.bluemine.util.IdWorker;
import com.bluemine.util.SnowflakeIdWorker;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSourceResolvable;
import org.springframework.core.env.Environment;
import org.springframework.data.repository.support.Repositories;

import java.util.Locale;

/**
 * Created by hechao on 2017/8/28.
 */
public class ServerApplicationContext {

    private ApplicationContext parent;

    private Repositories repositories;

    private IdWorker idWorker;

    public ServerApplicationContext(ApplicationContext parent) {
        this.idWorker = createIdWorker(parent);
        this.parent = parent;
        this.repositories = new Repositories(parent);
    }

    public IdWorker getIdWorker() {
        return idWorker;
    }

    public ApplicationContext getParent() {
        return parent;
    }

    public Repositories getRepositories() {
        return repositories;
    }

    public Environment getEnvironment() {
        return parent.getEnvironment();
    }

    public String getMessage(MessageSourceResolvable resolvable, Locale locale) {
        return parent.getMessage(resolvable, locale);
    }

    public String getMessage(String code, Object[] args, String defaultMessage, Locale locale) {
        return parent.getMessage(code, args, defaultMessage, locale);
    }

    public String getMessage(String code, Object[] args, String defaultMessage) {
        return parent.getMessage(code, args, defaultMessage, Locale.getDefault());
    }

    public String getMessage(String code, Object[] args, Locale locale) {
        return parent.getMessage(code, args, locale);
    }

    public String getMessage(String code, Object[] args) {
        return parent.getMessage(code, args, Locale.getDefault());
    }

    public String getVersion() {
        return parent.getEnvironment().getProperty(ServerConstants.PROFILE_SERVER_VERSION);
    }

    private IdWorker createIdWorker(ApplicationContext context) {
        try {
            Environment env = context.getEnvironment();
            String serverId = env.getProperty(ServerConstants.PROFILE_SERVER_ID);
            String clusterId = env.getProperty(ServerConstants.PROFILE_CLUSTER_ID);
            if (serverId == null || serverId.length() == 0)
                throw new IllegalArgumentException("web id is not defined.");
            if(clusterId==null){
                return new SnowflakeIdWorker(Long.valueOf(serverId), 10);
            }else{
                return new SnowflakeIdWorker(Long.valueOf(clusterId), Long.valueOf(serverId), 10);
            }
        } catch (NumberFormatException nfex) {
            throw new IllegalArgumentException(nfex);
        }
    }
}
