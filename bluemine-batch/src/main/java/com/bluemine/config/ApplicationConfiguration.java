package com.bluemine.config;


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

    @Bean
    public GuavaCache tagCache(){
        GuavaCache cache = new GuavaCache("tag cache", CacheBuilder.newBuilder()
                .expireAfterAccess(tagCache.getExpire(), TimeUnit.SECONDS).build());
        return cache;
    }

    @Bean
    public ThreadPoolTaskExecutor callBatchTaskExecutor() {
        ThreadPoolTaskExecutor pool = new ThreadPoolTaskExecutor();
        pool.setKeepAliveSeconds(callBatch.getKeepAliveSeconds());
        pool.setCorePoolSize(callBatch.getCorePoolSize());//核心线程池数
        pool.setMaxPoolSize(callBatch.getMaxPoolSize()); // 最大线程
        pool.setQueueCapacity(callBatch.getQueueCapacity());//队列容量
        pool.setRejectedExecutionHandler(new java.util.concurrent.ThreadPoolExecutor.CallerRunsPolicy()); //队列满，线程被拒绝执行策略
        return pool;
    }
}
