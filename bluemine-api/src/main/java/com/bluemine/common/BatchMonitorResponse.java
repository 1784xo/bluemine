package com.bluemine.common;

/**
 * Created by hechao on 2018/9/7.
 */
public class BatchMonitorResponse {
    private int idleCoreCount;
    private int activeCount;
    private int corePoolSize;
    private int maxPoolSize;
    private int poolSize;
    private long completedTaskCount;
    private long taskCount;

    public int getIdleCoreCount() {
        return idleCoreCount;
    }

    public void setIdleCoreCount(int idleCoreCount) {
        this.idleCoreCount = idleCoreCount;
    }

    public int getActiveCount() {
        return activeCount;
    }

    public void setActiveCount(int activeCount) {
        this.activeCount = activeCount;
    }

    public int getCorePoolSize() {
        return corePoolSize;
    }

    public void setCorePoolSize(int corePoolSize) {
        this.corePoolSize = corePoolSize;
    }

    public int getMaxPoolSize() {
        return maxPoolSize;
    }

    public void setMaxPoolSize(int maxPoolSize) {
        this.maxPoolSize = maxPoolSize;
    }

    public int getPoolSize() {
        return poolSize;
    }

    public void setPoolSize(int poolSize) {
        this.poolSize = poolSize;
    }

    public long getTaskCount() {
        return taskCount;
    }

    public void setTaskCount(long taskCount) {
        this.taskCount = taskCount;
    }

    public long getCompletedTaskCount() {
        return completedTaskCount;
    }

    public void setCompletedTaskCount(long completedTaskCount) {
        this.completedTaskCount = completedTaskCount;
    }
}
