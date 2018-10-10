package com.bluemine.job;

import java.util.Date;

/**
 * Created by hechao on 2018/10/8.
 */
public class CallItem {
    private long channelId;
    private Date callDate;
    private String callNo;
    private String seatNo;

    public long getChannelId() {
        return channelId;
    }

    public void setChannelId(long channelId) {
        this.channelId = channelId;
    }

    public Date getCallDate() {
        return callDate;
    }

    public void setCallDate(Date callDate) {
        this.callDate = callDate;
    }

    public String getCallNo() {
        return callNo;
    }

    public void setCallNo(String callNo) {
        this.callNo = callNo;
    }

    public String getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo;
    }

    @Override
    public String toString() {
        return "CallItem{" +
                "callDate=" + callDate +
                ", callNo='" + callNo + '\'' +
                ", channelId=" + channelId +
                ", seatNo='" + seatNo + '\'' +
                '}';
    }
}
