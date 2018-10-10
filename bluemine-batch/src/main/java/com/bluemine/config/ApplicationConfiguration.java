package com.bluemine.config;


import com.bluemine.ftp.FTPClientFactory;
import com.google.common.cache.CacheBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cache.guava.GuavaCache;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.TimeUnit;

/**
 * Created by hechao on 2017/11/23.
 */
@ConfigurationProperties(prefix = "bluemine", ignoreUnknownFields = true)
public class ApplicationConfiguration extends BootConfiguration {

    private CallBatchConfiguration callBatch;

    private FTPClientConfiguration callSync;

    private GuavaCacheConfiguration tagCache;

    private String token;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public CallBatchConfiguration getCallBatch() {
        return callBatch;
    }

    public void setCallBatch(CallBatchConfiguration callBatch) {
        this.callBatch = callBatch;
    }

    public GuavaCacheConfiguration getTagCache() {
        return tagCache;
    }

    public void setTagCache(GuavaCacheConfiguration tagCache) {
        this.tagCache = tagCache;
    }

    public FTPClientConfiguration getCallSync() {
        return callSync;
    }

    public void setCallSync(FTPClientConfiguration callSync) {
        this.callSync = callSync;
    }

    @Bean
    public GuavaCache tagCache() {
        GuavaCache cache = new GuavaCache("tag cache", CacheBuilder.newBuilder()
                .expireAfterAccess(tagCache.getExpire(), TimeUnit.SECONDS).build());
        return cache;
    }

    @Bean
    public ThreadPoolTaskExecutor callBatchTaskExecutor() {
        ThreadPoolTaskExecutor pool = new ThreadPoolTaskExecutor();
        pool.setThreadNamePrefix("call-batch-executor-");
        pool.setKeepAliveSeconds(callBatch.getKeepAliveSeconds());
        pool.setCorePoolSize(callBatch.getCorePoolSize());//核心线程池数
        pool.setMaxPoolSize(callBatch.getMaxPoolSize()); // 最大线程
        pool.setQueueCapacity(callBatch.getQueueCapacity());//队列容量
        pool.setRejectedExecutionHandler(new java.util.concurrent.ThreadPoolExecutor.CallerRunsPolicy()); //队列满，线程被拒绝执行策略
        pool.afterPropertiesSet();
        return pool;
    }

    @Bean
    public FTPClientFactory callSyncFactory(){
        FTPClientFactory factory = new FTPClientFactory(this.callSync);
        return factory;
    }
}
