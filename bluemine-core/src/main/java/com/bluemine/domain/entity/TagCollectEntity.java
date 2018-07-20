package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

/**
 * Created by hechao on 2018/7/11.
 */
@Entity
@Table(name = "tag_collect")
public class TagCollectEntity extends PartitionEntity implements Serializable{

    private static final long serialVersionUID = 698779721568670077L;
    @EmbeddedId
    private TagCollectId id;

    @Column(name = "CHANNEL_ID", updatable = false, nullable = false)
    private long channelId;

    @Column(name = "SEAT_ID", nullable = false)
    private Long seatId;

    @Column(name = "CALL_DATE", nullable = false)
    private LocalDate callDate;

    @Column(name = "FREQUENCY", nullable = false)
    private Integer frequency;

    @Column(name = "SUB_FREQUENCY", nullable = false)
    private Integer subFrequency;

    @Column(name = "SUB_TOTAL", nullable = false)
    private Integer subTotal;

    public TagCollectId getId() {
        return id;
    }

    public void setId(TagCollectId id) {
        this.id = id;
    }

    public long getChannelId() {
        return channelId;
    }

    public void setChannelId(long channelId) {
        this.channelId = channelId;
    }

    public Long getSeatId() {
        return seatId;
    }

    public void setSeatId(Long seatId) {
        this.seatId = seatId;
    }

    public LocalDate getCallDate() {
        return callDate;
    }

    public void setCallDate(LocalDate callDate) {
        this.callDate = callDate;
    }

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }

    public Integer getSubFrequency() {
        return subFrequency;
    }

    public void setSubFrequency(Integer subFrequency) {
        this.subFrequency = subFrequency;
    }

    public Integer getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Integer subTotal) {
        this.subTotal = subTotal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TagCollectEntity that = (TagCollectEntity) o;
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
        return "TabCollectEntity{" +
                "callDate=" + callDate +
                ", channelId=" + channelId +
                ", frequency=" + frequency +
                ", id=" + id +
                ", seatId=" + seatId +
                ", subFrequency=" + subFrequency +
                ", subTotal=" + subTotal +
                "} " + super.toString();
    }

    public TagCollectEntity id(TagCollectId id) {
        this.id = id;
        return this;
    }

    public TagCollectEntity channelId(long channelId) {
        this.channelId = channelId;
        return this;
    }

    public TagCollectEntity seatId(Long seatId) {
        this.seatId = seatId;
        return this;
    }

    public TagCollectEntity callDate(LocalDate callDate) {
        this.callDate = callDate;
        return this;
    }

    public TagCollectEntity frequency(Integer frequency) {
        this.frequency = frequency;
        return this;
    }

    public TagCollectEntity subFrequency(Integer subFrequency) {
        this.subFrequency = subFrequency;
        return this;
    }

    public TagCollectEntity subTotal(Integer subTotal) {
        this.subTotal = subTotal;
        return this;
    }
}