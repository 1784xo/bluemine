package com.bluemine.job.call;

import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.SeatEntity;

import java.time.LocalDate;

/**
 * Created by hechao on 2018/9/5.
 */
public class TagCollectItem {
    private long channelId;
    private SeatEntity seat;
    private LocalDate callDate;
    private String callNo;
    private int partitionKey;

    public long getChannelId() {
        return channelId;
    }

    public void setChannelId(long channelId) {
        this.channelId = channelId;
    }

    public SeatEntity getSeat() {
        return seat;
    }

    public void setSeat(SeatEntity seat) {
        this.seat = seat;
    }

    public LocalDate getCallDate() {
        return callDate;
    }

    public void setCallDate(LocalDate callDate) {
        this.callDate = callDate;
    }

    public String getCallNo() {
        return callNo;
    }

    public void setCallNo(String callNo) {
        this.callNo = callNo;
    }

    public int getPartitionKey() {
        return partitionKey;
    }

    public void setPartitionKey(int partitionKey) {
        this.partitionKey = partitionKey;
    }
}
