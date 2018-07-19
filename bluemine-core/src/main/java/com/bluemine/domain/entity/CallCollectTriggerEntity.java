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

    @Id
    @Column(name = "JOB_INSTANCE_ID", nullable = false, updatable = false)
    private Long jobInstanceId;

    @Column(name = "JOB_EXECUTION_ID", nullable = false)
    private Long jobExecutionId;

    @Column(name = "CHANNEL_NO", nullable = false, length = 64, updatable = false)
    private String channelNo;

    @Column(name = "CALL_NO", nullable = false, length = 64, updatable = false)
    private String callNo;

    @Column(name = "CALL_DATE", nullable = false, updatable = false)
    private LocalDate callDate;

    @Column(name = "SEAT_NO", nullable = false, length = 64, updatable = false)
    private String seatNo;

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

    public Long getJobInstanceId() {
        return jobInstanceId;
    }

    public void setJobInstanceId(Long jobInstanceId) {
        this.jobInstanceId = jobInstanceId;
    }


    public Long getJobExecutionId() {
        return jobExecutionId;
    }

    public void setJobExecutionId(Long jobExecutionId) {
        this.jobExecutionId = jobExecutionId;
    }

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
    public Object primaryKey() {
        return jobInstanceId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CallCollectTriggerEntity that = (CallCollectTriggerEntity) o;
        return Objects.equals(jobInstanceId, that.jobInstanceId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(jobInstanceId);
    }

    @Override
    public String toString() {
        return "CallCollectTriggerEntity{" +
                "callDate=" + callDate +
                ", callNo='" + callNo + '\'' +
                ", channelNo='" + channelNo + '\'' +
                ", executiveNo=" + executiveNo +
                ", jobExecutionId=" + jobExecutionId +
                ", jobInstanceId=" + jobInstanceId +
                ", requestTime=" + requestTime +
                ", seatNo='" + seatNo + '\'' +
                ", statusCode='" + statusCode + '\'' +
                ", triggerDate=" + triggerDate +
                ", triggerType='" + triggerType + '\'' +
                "} " + super.toString();
    }


    public CallCollectTriggerEntity jobInstanceId(Long jobInstanceId) {
        this.jobInstanceId = jobInstanceId;
        return this;
    }

    public CallCollectTriggerEntity jobExecutionId(Long jobExecutionId) {
        this.jobExecutionId = jobExecutionId;
        return this;
    }

    public CallCollectTriggerEntity channelNo(String channelNo) {
        this.channelNo = channelNo;
        return this;
    }

    public CallCollectTriggerEntity callNo(String callNo) {
        this.callNo = callNo;
        return this;
    }

    public CallCollectTriggerEntity callDate(LocalDate callDate) {
        this.callDate = callDate;
        return this;
    }

    public CallCollectTriggerEntity seatNo(String seatNo) {
        this.seatNo = seatNo;
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
