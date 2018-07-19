package com.bluemine.domain.entity;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by hechao on 2018/6/26.
 */
@Entity
@Table(name = "channel")
public class ChannelEntity extends PartitionEntity implements Serializable {

    private static final long serialVersionUID = 7669992236671455630L;

    @Id
    @Column(name = "CHANNEL_ID", nullable = false, updatable = false, length = 4)
    private Long channelId;

    @Column(name = "CHANNEL_NO", nullable = false, updatable = false, length = 64)
    private String channelNo;

    @Column(name = "CHANNEL_TYPE", nullable = false, length = 4)
    private String channelType;

    @Column(name = "CHANNEL_CODE", nullable = false, length = 4)
    private String channelCode;

    @Type(type = "yes_no")
    @Column(name = "ACTIVATED_FLAG", nullable = false, length = 1)
    private Boolean activatedFlag;

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public String getChannelNo() {
        return channelNo;
    }

    public void setChannelNo(String channelNo) {
        this.channelNo = channelNo;
    }

    public String getChannelType() {
        return channelType;
    }

    public void setChannelType(String channelType) {
        this.channelType = channelType;
    }

    public String getChannelCode() {
        return channelCode;
    }

    public void setChannelCode(String channelCode) {
        this.channelCode = channelCode;
    }

    public Boolean getActivatedFlag() {
        return activatedFlag;
    }

    public void setActivatedFlag(Boolean activatedFlag) {
        this.activatedFlag = activatedFlag;
    }

    @Override
    public Object primaryKey() {
        return channelId;
    }

    @Override
    public String toString() {
        return "ChannelEntity{" +
                "activatedFlag=" + activatedFlag +
                ", channelCode='" + channelCode + '\'' +
                ", channelNo=" + channelId +
                ", channelNo='" + channelNo + '\'' +
                ", channelType='" + channelType + '\'' +
                "} " + super.toString();
    }

    //fluent
    public ChannelEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public ChannelEntity channelNo(String channelNo) {
        this.channelNo = channelNo;
        return this;
    }

    public ChannelEntity channelType(String channelType) {
        this.channelType = channelType;
        return this;
    }

    public ChannelEntity channelCode(String channelCode) {
        this.channelCode = channelCode;
        return this;
    }

    public ChannelEntity activatedFlag(Boolean activatedFlag) {
        this.activatedFlag = activatedFlag;
        return this;
    }
}
