package com.bluemine.scheduling;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.TriggerContext;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by hechao on 2018/9/10.
 */
@Component
public class CallBatchScheduler implements SchedulingConfigurer {

    private ThreadPoolTaskScheduler scheduler;

    public void configureTasks(ScheduledTaskRegistrar scheduledTaskRegistrar) {
        scheduler = new ThreadPoolTaskScheduler();
        scheduler.setThreadNamePrefix("call-batch-scheduler-");
        scheduler.setPoolSize(20);
        scheduler.setAwaitTerminationSeconds(60);
        scheduler.setWaitForTasksToCompleteOnShutdown(true);
        scheduler.setRemoveOnCancelPolicy(true);
        scheduler.afterPropertiesSet();
    }

    public void addTriggerTask(Runnable runnable, Date date){
        scheduler.schedule(runnable, date);
    }

    public int getMaxPoolSize(){
        return scheduler.getScheduledThreadPoolExecutor().getMaximumPoolSize();
    }

    public int getPoolSize(){
        return scheduler.getPoolSize();
    }

    public int getActiveCount(){
        return scheduler.getActiveCount();
    }

    public int getCorePoolSize(){
        return scheduler.getScheduledThreadPoolExecutor().getCorePoolSize();
    }

    public int getIdleCoreCount() {
        return getCorePoolSize() - getActiveCount();
    }

    public long getCompletedTaskCount(){
        return scheduler.getScheduledThreadPoolExecutor().getCompletedTaskCount();
    }

    public long getTaskCount(){
        return scheduler.getScheduledThreadPoolExecutor().getTaskCount();
    }
}
