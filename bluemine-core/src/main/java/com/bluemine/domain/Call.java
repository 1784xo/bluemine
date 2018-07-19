package com.bluemine.domain;

import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.SeatEntity;

import java.time.LocalDate;
import java.util.Date;

/**
 * Created by hechao on 2018/7/4.
 */
public class Call {
    private ChannelEntity channel;
    private SeatEntity seat;
    private LocalDate callDate;
    private String callNo;

    public ChannelEntity getChannel() {
        return channel;
    }

    public void setChannel(ChannelEntity channel) {
        this.channel = channel;
    }

    public String getCallNo() {
        return callNo;
    }

    public void setCallNo(String callNo) {
        this.callNo = callNo;
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

    public void setCallDate(String callDate) {
        this.callDate = LocalDate.parse(callDate);
    }


    public Call channel(ChannelEntity channel) {
        this.channel = channel;
        return this;
    }

    public Call seat(SeatEntity seat) {
        this.seat = seat;
        return this;
    }

    public Call callDate(String callDate) {
        setCallDate(callDate);
        return this;
    }

    public Call callNo(String callNo) {
        this.callNo = callNo;
        return this;
    }
}
