package com.bluemine.job;

import com.bluemine.domain.entity.ChannelEntity;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

/**
 * Created by hechao on 2018/10/8.
 */
public class CallItem {
    private ChannelEntity channel;
    private Date callDate;
    private String callNo;
    private String seatNo;

    public ChannelEntity getChannel() {
        return channel;
    }

    public void setChannel(ChannelEntity channel) {
        this.channel = channel;
    }

    public Date getCallDate() {
        return callDate;
    }

    public LocalDate getCallLocalDate(){
        return callDate.toInstant()
                .atZone(ZoneId.systemDefault()).toLocalDate();
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
                ", channel=" + channel +
                ", seatNo='" + seatNo + '\'' +
                '}';
    }
}
