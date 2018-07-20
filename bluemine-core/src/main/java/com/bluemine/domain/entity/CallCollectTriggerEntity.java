package com.bluemine.domain.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * Created by hechao on 2018/7/19.
 */
@Entity
@Table(name = "call_collect_trigger")
public class CallCollectTriggerEntity extends PartitionEntity implements Serializable{

    private static final long serialVersionUID = 546553193863082042L;

    @EmbeddedId
    private CallCollectTriggerId id;

    @Column(name = "TRIGGER_DATE", nullable = false)
    private LocalDateTime triggerDate;

    @Column(name = "TRIGGER_TYPE", nullable = false, updatable = false, length = 4)
    private String triggerType;

    @Column(name = "REQUEST_TIME", nullable = false, updatable = false)
    private LocalDateTime requestTime;

    @Column(name = "EXECUTIVE_NO", nullable = false)
    private Integer executiveNo;

    @Column(name = "STATUS_CODE", nullable = false, length = 255)
    private String statusCode;

    public CallCollectTriggerId getId() {
        return id;
    }

    public void setId(CallCollectTriggerId id) {
        this.id = id;
    }

    public LocalDateTime getTriggerDate() {
        return triggerDate;
    }

    public void setTriggerDate(LocalDateTime triggerDate) {
        this.triggerDate = triggerDate;
    }

    public String getTriggerType() {
        return triggerType;
    }

    public void setTriggerType(String triggerType) {
        this.triggerType = triggerType;
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

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CallCollectTriggerEntity that = (CallCollectTriggerEntity) o;
        return Objects.equals(id, that.id);
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
        return "CallCollectTriggerEntity{" +
                "executiveNo=" + executiveNo +
                ", id=" + id +
                ", requestTime=" + requestTime +
                ", statusCode='" + statusCode + '\'' +
                ", triggerDate=" + triggerDate +
                ", triggerType='" + triggerType + '\'' +
                "} " + super.toString();
    }


    public CallCollectTriggerEntity id(CallCollectTriggerId id) {
        this.id = id;
        return this;
    }

    public CallCollectTriggerEntity triggerDate(LocalDateTime triggerDate) {
        this.triggerDate = triggerDate;
        return this;
    }

    public CallCollectTriggerEntity triggerType(String triggerType) {
        this.triggerType = triggerType;
        return this;
    }

    public CallCollectTriggerEntity requestTime(LocalDateTime requestTime) {
        this.requestTime = requestTime;
        return this;
    }

    public CallCollectTriggerEntity executiveNo(Integer executiveNo) {
        this.executiveNo = executiveNo;
        return this;
    }

    public CallCollectTriggerEntity statusCode(String statusCode) {
        this.statusCode = statusCode;
        return this;
    }
}
