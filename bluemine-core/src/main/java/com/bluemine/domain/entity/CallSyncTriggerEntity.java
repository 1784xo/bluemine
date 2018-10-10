package com.bluemine.domain.entity;

import com.bluemine.struct.CallTriggerStatus;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * Created by hechao on 2018/9/25.
 */
@Entity
@Table(name = "call_sync_trigger")
public class CallSyncTriggerEntity extends PartitionEntity implements Serializable {

    private static final long serialVersionUID = 8513391370238809584L;
    @EmbeddedId
    private CallSyncTriggerId id;

    @Column(name = "RESOURCE_FILE", nullable = false, updatable = false, length = 1024)
    private String resourceFile;

    @Enumerated(EnumType.STRING)
    @Column(name = "STATUS_CODE", nullable = false, length = 10)
    private CallTriggerStatus statusCode;

    @Column(name = "EXECUTE_COUNT", nullable = false)
    private Integer executeCount;

    @Override
    @Column(name = "DESC_TEXT", nullable = true, length = 20480)
    public void setDescText(String descText) {
        super.setDescText(descText);
    }

    @Column(name = "REQUEST_TIME", nullable = false, updatable = false)
    private LocalDateTime requestTime;

    public CallSyncTriggerId getId() {
        return id;
    }

    public void setId(CallSyncTriggerId id) {
        this.id = id;
    }

    public String getResourceFile() {
        return resourceFile;
    }

    public void setResourceFile(String resourceFile) {
        this.resourceFile = resourceFile;
    }

    public CallTriggerStatus getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(CallTriggerStatus statusCode) {
        this.statusCode = statusCode;
    }

    public Integer getExecuteCount() {
        return executeCount;
    }

    public void setExecuteCount(Integer executeCount) {
        this.executeCount = executeCount;
    }

    public LocalDateTime getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(LocalDateTime requestTime) {
        this.requestTime = requestTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CallSyncTriggerEntity that = (CallSyncTriggerEntity) o;
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
        return "CallSyncTriggerEntity{" +
                "executeCount=" + executeCount +
                ", id=" + id +
                ", requestTime=" + requestTime +
                ", resourceFile='" + resourceFile + '\'' +
                ", statusCode=" + statusCode +
                "} " + super.toString();
    }


    public CallSyncTriggerEntity id(CallSyncTriggerId id) {
        this.id = id;
        return this;
    }

    public CallSyncTriggerEntity resourceFile(String resourceFile) {
        this.resourceFile = resourceFile;
        return this;
    }

    public CallSyncTriggerEntity statusCode(CallTriggerStatus statusCode) {
        this.statusCode = statusCode;
        return this;
    }

    public CallSyncTriggerEntity executeCount(Integer executeCount) {
        this.executeCount = executeCount;
        return this;
    }

    public CallSyncTriggerEntity requestTime(LocalDateTime requestTime) {
        this.requestTime = requestTime;
        return this;
    }
}
