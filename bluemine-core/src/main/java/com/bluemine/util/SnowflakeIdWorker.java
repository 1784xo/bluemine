package com.bluemine.util;

import java.math.BigDecimal;

/**
 * Created by hechao on 2017/8/28.
 */
public class SnowflakeIdWorker extends IdWorker{

    private final static int bits = 63;

    private final static int seqMaxBits  = 12;

    private final static int seqMinBits  = 2;

    private final static  int timestampMinBits=41;

    private final static int workerIdMaxBits = 8;

    private final static int idMinBits = 5;

    private final long twepoch = 1483200000000L;

    private final int sequenceBits;

    private final int workerIdBits;

    private final int clusterIdBits;

    private long lastTimestamp=-1L;

    private long timestamp=-1L;

    private int sequence=0;

    private final int sequenceMask;

    private final int maxWorkerId;

    private final int maxClusterId;

    private final long workerId;

    private final long clusterId;

    public SnowflakeIdWorker(Long clusterId, Long workerId, int sequenceBits) {

        if(sequenceBits>seqMaxBits || sequenceBits<seqMinBits){
            throw new IllegalArgumentException(String.format("worker Id can't be greater than %d or less than 0", sequenceBits));
        }

        if(clusterId==null){
            this.clusterId=0;
            this.clusterIdBits=0;
            this.maxClusterId=0;
        }else{
            this.clusterId=clusterId.longValue();
            this.clusterIdBits = idMinBits;
            this.maxClusterId = -1<<clusterIdBits ^ -1;
        }

        if (this.clusterId > maxClusterId || this.clusterId < 0) {
            throw new IllegalArgumentException(String.format("cluster Id can't be greater than %d or less than 0", maxClusterId));
        }

        if(this.clusterIdBits == 0){
            this.workerIdBits = workerIdMaxBits;
        }else{
            this.workerIdBits = idMinBits;
        }

        this.maxWorkerId=-1<<workerIdBits ^ -1;

        this.workerId = workerId.longValue();

        if (this.workerId > this.maxWorkerId || this.workerId < 0) {
            throw new IllegalArgumentException(String.format("worker Id can't be greater than %d or less than 0", maxWorkerId));
        }

        this.sequenceBits = sequenceBits;

        this.sequenceMask=-1 << sequenceBits ^ -1;

    }

    public SnowflakeIdWorker(Long workerId, int sequenceBits) {
        this(null, workerId, sequenceBits);
    }

    public SnowflakeIdWorker(Long workerId) {
        this(null, workerId, seqMaxBits);
    }

    public SnowflakeIdWorker(Long clusterId, Long workerId) {
        this(clusterId, workerId, seqMaxBits);
    }

    public synchronized Long nextId(){

        timestamp=System.currentTimeMillis();

        if(timestamp<lastTimestamp){
            throw new RuntimeException(String.format("Clock moved backwards.  Refusing to generate id for %d milliseconds", lastTimestamp - timestamp));
        }

        if(timestamp==lastTimestamp){
            sequence=(sequence+1) & sequenceMask;
            if(sequence == 0){
                timestamp = tilNextMillis(timestamp);
            }
        }

        lastTimestamp=timestamp;

        return (((timestamp - twepoch) << clusterIdBits | clusterId) << workerIdBits | workerId) << sequenceBits | sequence;
    }

    @Override
    public Long workerId() {
        return workerId;
    }

    @Override
    public Long clusterId() {
        return clusterIdBits==0? null: clusterId;
    }

    private long tilNextMillis(long timestamp){
        while (timestamp==this.lastTimestamp){
            timestamp=System.currentTimeMillis();
        }
        return timestamp;
    }

    public static void main(String[] args){
        SnowflakeIdWorker snowflakeIdWorker = new SnowflakeIdWorker(1L, 1L);
        System.out.println(snowflakeIdWorker.nextId());
    }
}
