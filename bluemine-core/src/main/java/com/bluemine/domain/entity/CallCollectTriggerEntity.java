package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * Created by hechao on 2018/7/2.
 */
@Entity
@Table(name = "call_collect_trigger")
public class CallCollectTriggerEntity extends PartitionEntity implements Serializable {

    private static final long serialVersionUID = -9216447503053446059L;
    @EmbeddedId
    private CallCollectTriggerId id;

    @Column(name = "CHANNEL_NO", updatable = false, nullable = false)
    private String channelNo;

    @Column(name = "SEAT_NO", updatable = false, nullable = false)
    private Long seatNo;

    @Column(name = "PROCESSED_FLAG", nullable = false, length = 1)
    private String processedFlag;

    @Column(name = "TRIGGER_TYPE", updatable = false, nullable = false, length = 4)
    private String triggerType;

    @Column(name = "REQUEST_TIME", updatable = false, nullable = false)
    private LocalDateTime requestTime;

    @Column(name = "PRODUCTION_TIME", updatable = false, nullable = false)
    private LocalDateTime productionTime;

    public CallCollectTriggerId getId() {
        return id;
    }

    public void setId(CallCollectTriggerId id) {
        this.id = id;
    }

    public String getChannelNo() {
        return channelNo;
    }

    public void setChannelNo(String channelId) {
        this.channelNo = channelId;
    }

    public Long getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(Long seatId) {
        this.seatNo = seatId;
    }

    public String getProcessedFlag() {
        return processedFlag;
    }

    public void setProcessedFlag(String processedFlag) {
        this.processedFlag = processedFlag;
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

    public LocalDateTime getProductionTime() {
        return productionTime;
    }

    public void setProductionTime(LocalDateTime productionTime) {
        this.productionTime = productionTime;
    }

    @Override
    public Object primaryKey() {
        return id;
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


    public CallCollectTriggerEntity id(CallCollectTriggerId id) {
        this.id = id;
        return this;
    }

    public CallCollectTriggerEntity channelNo(String channelNo) {
        this.channelNo = channelNo;
        return this;
    }

    public CallCollectTriggerEntity seatNo(long seatNo) {
        this.seatNo = seatNo;
        return this;
    }

    public CallCollectTriggerEntity processedFlag(String processedFlag) {
        this.processedFlag = processedFlag;
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

    public CallCollectTriggerEntity productionTime(LocalDateTime productionTime) {
        this.productionTime = productionTime;
        return this;
    }
}
