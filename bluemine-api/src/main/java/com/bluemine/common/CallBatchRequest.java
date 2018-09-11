package com.bluemine.common;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Created by hechao on 2018/9/3.
 */
public class CallBatchRequest implements Serializable {
    private String channelNo;
    private String callNo;
    private LocalDate callDate;
    private String seatNo;

    public String getChannelNo() {
        return channelNo;
    }

    public void setChannelNo(String channelNo) {
        this.channelNo = channelNo;
    }

    public String getCallNo() {
        return callNo;
    }

    public void setCallNo(String callNo) {
        this.callNo = callNo;
    }

    public LocalDate getCallDate() {
        return callDate;
    }

    public void setCallDate(LocalDate callDate) {
        this.callDate = callDate;
    }

    public String getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo;
    }

    @Override
    public String toString() {
        return "CallBatchRequest{" +
                "callDate=" + callDate +
                ", callNo='" + callNo + '\'' +
                ", channelNo='" + channelNo + '\'' +
                ", seatNo='" + seatNo + '\'' +
                '}';
    }
}
