package com.bluemine.domain.entity;

import com.bluemine.struct.BatchTriggerStatus;

import javax.persistence.*;
import javax.persistence.EnumType;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * Created by hechao on 2018/7/19.
 */
@Entity
@Table(name = "call_batch_trigger")
public class CallBatchTriggerEntity extends PartitionEntity implements Serializable{

    private static final long serialVersionUID = 546553193863082042L;

    @EmbeddedId
    private CallBatchTriggerId id;

    @Column(name = "TRIGGER_DATE", nullable = false)
    private LocalDateTime triggerDate;

    @Column(name = "REQUEST_TIME", nullable = false, updatable = false)
    private LocalDateTime requestTime;

    @Column(name = "EXECUTIVE_NO", nullable = false)
    private Integer executiveNo;

    @Enumerated(EnumType.STRING)
    @Column(name = "STATUS_CODE", nullable = false, length = 255)
    private BatchTriggerStatus statusCode;

    public CallBatchTriggerId getId() {
        return id;
    }

    public void setId(CallBatchTriggerId id) {
        this.id = id;
    }

    public LocalDateTime getTriggerDate() {
        return triggerDate;
    }

    public void setTriggerDate(LocalDateTime triggerDate) {
        this.triggerDate = triggerDate;
    }

    public LocalDateTime getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(LocalDateTime requestTime) {
        this.requestTime = requestTime;
    }

    public Integer getExecutiveNo() {
        return executiveNo;
    }

    public void setExecutiveNo(Integer executiveNo) {
        this.executiveNo = executiveNo;
    }

    public BatchTriggerStatus getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(BatchTriggerStatus statusCode) {
        this.statusCode = statusCode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CallBatchTriggerEntity that = (CallBatchTriggerEntity) o;
        return Objects.equals(id, that.id);
    }

    @Override
    @Column(name = "DESC_TEXT", nullable = true, length = 2500)
    public void setDescText(String descText) {
        super.setDescText(descText);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public Object primaryKey() {
        return id;
    }

    @Override
    public String toString() {
        return "CallBatchTriggerEntity{" +
                "executiveNo=" + executiveNo +
                ", id=" + id +
                ", requestTime=" + requestTime +
                ", statusCode=" + statusCode +
                ", triggerDate=" + triggerDate +
                "} " + super.toString();
    }


    public CallBatchTriggerEntity id(CallBatchTriggerId id) {
        this.id = id;
        return this;
    }

    public CallBatchTriggerEntity triggerDate(LocalDateTime triggerDate) {
        this.triggerDate = triggerDate;
        return this;
    }

    public CallBatchTriggerEntity requestTime(LocalDateTime requestTime) {
        this.requestTime = requestTime;
        return this;
    }

    public CallBatchTriggerEntity executiveNo(Integer executiveNo) {
        this.executiveNo = executiveNo;
        return this;
    }

    public CallBatchTriggerEntity statusCode(BatchTriggerStatus statusCode) {
        this.statusCode = statusCode;
        return this;
    }
}
