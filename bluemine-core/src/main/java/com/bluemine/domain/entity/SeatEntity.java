package com.bluemine.domain.entity;

import org.hibernate.annotations.Type;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Objects;

/**
 * Created by hechao on 2018/7/4.
 */
@Entity
@Table(name = "seat")
public class SeatEntity extends PartitionEntity implements Serializable {

    private static final long serialVersionUID = 2558345397752140185L;
    @Id
    @Column(name = "SEAT_ID", nullable = false)
    private Long seatId;

    @Column(name = "CHANNEL_ID", nullable = false)
    private Long channelId;

    @Column(name = "SEAT_NO", nullable = false, length = 16)
    private String seatNo;

    @Column(name = "SEAT_IP", nullable = true, length = 46)
    private String seatIp;

    @Type(type = "yes_no")
    @Column(name = "ACTIVATED_FLAG", nullable = false, length = 1)
    private Boolean activatedFlag;

    public Long getSeatId() {
        return seatId;
    }

    public void setSeatId(Long seatId) {
        this.seatId = seatId;
    }

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public String getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo;
    }

    public String getSeatIp() {
        return seatIp;
    }

    public void setSeatIp(String seatIp) {
        this.seatIp = seatIp;
    }

    public Boolean getActivatedFlag() {
        return activatedFlag;
    }

    public void setActivatedFlag(Boolean activatedFlag) {
        this.activatedFlag = activatedFlag;
    }

    @Override
    public Object primaryKey() {
        return seatId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SeatEntity that = (SeatEntity) o;
        return Objects.equals(seatId, that.seatId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(seatId);
    }


    public SeatEntity seatId(Long seatId) {
        this.seatId = seatId;
        return this;
    }

    public SeatEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public SeatEntity seatNo(String seatNo) {
        this.seatNo = seatNo;
        return this;
    }

    public SeatEntity seatIp(String seatIp) {
        this.seatIp = seatIp;
        return this;
    }

    public SeatEntity activatedFlag(Boolean activatedFlag) {
        this.activatedFlag = activatedFlag;
        return this;
    }
}
