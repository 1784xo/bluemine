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
public class CallBatchTriggerId implements Serializable{
    private static final long serialVersionUID = 552604337690063175L;

    @Column(name = "CHANNEL_ID", nullable = false, updatable = false)
    private Long channelId;

    @Column(name = "CALL_NO", nullable = false, length = 64, updatable = false)
    private String callNo;

    @Column(name = "CALL_DATE", nullable = false, updatable = false)
    private LocalDate callDate;

    @Column(name = "SEAT_NO", nullable = false, length = 64, updatable = false)
    private String seatNo;


    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelNo) {
        this.channelId = channelNo;
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
        CallBatchTriggerId that = (CallBatchTriggerId) o;
        return Objects.equals(channelId, that.channelId) &&
                Objects.equals(callNo, that.callNo) &&
                Objects.equals(callDate, that.callDate) &&
                Objects.equals(seatNo, that.seatNo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(channelId, callNo, callDate, seatNo);
    }

    @Override
    public String toString() {
        return "CallBatchTriggerId{" +
                "callDate=" + callDate +
                ", callNo='" + callNo + '\'' +
                ", channelId='" + channelId + '\'' +
                ", seatNo='" + seatNo + '\'' +
                '}';
    }


    public CallBatchTriggerId channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public CallBatchTriggerId callNo(String callNo) {
        this.callNo = callNo;
        return this;
    }

    public CallBatchTriggerId callDate(LocalDate callDate) {
        this.callDate = callDate;
        return this;
    }

    public CallBatchTriggerId seatNo(String seatNo) {
        this.seatNo = seatNo;
        return this;
    }
}
