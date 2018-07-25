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

    @Column(name = "SEAT_ID", nullable = false)
    private Long seatId;

    @Column(name = "CALL_DATE", nullable = false)
    private LocalDate callDate;

    @Column(name = "CALL_YEAR", nullable = false)
    private Integer callYear;

    @Column(name = "CALL_MONTH", nullable = false)
    private Integer callMonth;

    @Column(name = "CALL_DAY", nullable = false)
    private Integer callDay;

    @Column(name = "CALL_WEEK", nullable = false)
    private Integer callWeek;


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

    public Integer getCallYear() {
        return callYear;
    }

    public void setCallYear(Integer callYear) {
        this.callYear = callYear;
    }

    public Integer getCallMonth() {
        return callMonth;
    }

    public void setCallMonth(Integer callMonth) {
        this.callMonth = callMonth;
    }

    public Integer getCallDay() {
        return callDay;
    }

    public void setCallDay(Integer callDay) {
        this.callDay = callDay;
    }

    public Integer getCallWeek() {
        return callWeek;
    }

    public void setCallWeek(Integer callWeek) {
        this.callWeek = callWeek;
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
        return "TagCollectEntity{" +
                "callDate=" + callDate +
                ", callDay=" + callDay +
                ", callMonth=" + callMonth +
                ", callWeek=" + callWeek +
                ", callYear=" + callYear +
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

    public TagCollectEntity seatId(Long seatId) {
        this.seatId = seatId;
        return this;
    }

    public TagCollectEntity callDate(LocalDate callDate) {
        this.callDate = callDate;
        return this;
    }

    public TagCollectEntity callYear(Integer callYear) {
        this.callYear = callYear;
        return this;
    }

    public TagCollectEntity callMonth(Integer callMonth) {
        this.callMonth = callMonth;
        return this;
    }

    public TagCollectEntity callDay(Integer callDay) {
        this.callDay = callDay;
        return this;
    }

    public TagCollectEntity callWeek(Integer callWeek) {
        this.callWeek = callWeek;
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
