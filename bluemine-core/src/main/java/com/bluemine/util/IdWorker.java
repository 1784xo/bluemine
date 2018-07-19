package com.bluemine.util;

/**
 * Created by hechao on 2017/8/28.
 */
public abstract class IdWorker {
    /**
     * 得到下一个唯一ID
     * @return
     */
    public abstract Long nextId();

    /**
     * 得到节点ID
     * @return
     */
    public abstract Long workerId();

    /**
     * 得到集群ID
     * @return
     */
    public abstract  Long clusterId();
}