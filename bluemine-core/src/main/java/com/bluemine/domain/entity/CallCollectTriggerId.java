package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

/**
 * Created by hechao on 2018/7/20.
 */
@Embeddable
public class CallCollectTriggerId implements Serializable{
    private static final long serialVersionUID = 552604337690063175L;

    @Column(name = "CHANNEL_NO", nullable = false, length = 64, updatable = false)
    private String channelNo;

    @Column(name = "CALL_NO", nullable = false, length = 64, updatable = false)
    private String callNo;

    @Column(name = "CALL_DATE", nullable = false, updatable = false)
    private LocalDate callDate;

    @Column(name = "SEAT_NO", nullable = false, length = 64, updatable = false)
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CallCollectTriggerId that = (CallCollectTriggerId) o;
        return Objects.equals(channelNo, that.channelNo) &&
                Objects.equals(callNo, that.callNo) &&
                Objects.equals(callDate, that.callDate) &&
                Objects.equals(seatNo, that.seatNo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(channelNo, callNo, callDate, seatNo);
    }

    @Override
    public String toString() {
        return "CallCollectTriggerId{" +
                "callDate=" + callDate +
                ", callNo='" + callNo + '\'' +
                ", channelNo='" + channelNo + '\'' +
                ", seatNo='" + seatNo + '\'' +
                '}';
    }


    public CallCollectTriggerId channelNo(String channelNo) {
        this.channelNo = channelNo;
        return this;
    }

    public CallCollectTriggerId callNo(String callNo) {
        this.callNo = callNo;
        return this;
    }

    public CallCollectTriggerId callDate(LocalDate callDate) {
        this.callDate = callDate;
        return this;
    }

    public CallCollectTriggerId seatNo(String seatNo) {
        this.seatNo = seatNo;
        return this;
    }
}
