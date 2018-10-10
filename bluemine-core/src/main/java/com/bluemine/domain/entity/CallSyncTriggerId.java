package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

/**
 * Created by hechao on 2018/9/25.
 */
@Embeddable
public class CallSyncTriggerId implements Serializable {

    @Column(name = "CHANNEL_ID", updatable = false, nullable = false)
    private Long channelId;

    @Column(name = "CALL_DATE", updatable = false, nullable = false)
    private LocalDate callDate;

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public LocalDate getCallDate() {
        return callDate;
    }

    public void setCallDate(LocalDate callDate) {
        this.callDate = callDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CallSyncTriggerId that = (CallSyncTriggerId) o;
        return channelId == that.channelId &&
                callDate == that.callDate;
    }

    @Override
    public int hashCode() {
        return Objects.hash(channelId, callDate);
    }

    @Override
    public String toString() {
        return "CallSyncTriggerId{" +
                "callDate=" + callDate +
                ", channelId=" + channelId +
                '}';
    }


    public CallSyncTriggerId channelId(long channelId) {
        this.channelId = channelId;
        return this;
    }

    public CallSyncTriggerId callDate(LocalDate callDate) {
        this.callDate = callDate;
        return this;
    }
}
