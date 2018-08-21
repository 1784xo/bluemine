package com.bluemine.domain.entity;


import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

/**
 * Created by hechao on 2018/8/10.
 */
@Entity
@Table(name = "tag_collect_virtual")
public class TagCollectVirtualEntity implements Serializable {
    private static final long serialVersionUID = 3477482686878039821L;

    @Id
    @Column(name = "COLLECT_ID", updatable = false)
    private Long collectId;

    @Column(name = "TAG_ID", updatable = false)
    private Long tagId;

    @Column(name = "CALL_NUM", updatable = false)
    private Integer callNum;

    @Column(name = "PARENT_ID", updatable = false)
    private Long parentId;

    @Column(name = "TAG_TEXT", updatable = false)
    private String tagText;

    @Column(name = "CALL_DATE", updatable = false, nullable = false)
    private LocalDate callDate;

    @Column(name = "CALL_YEAR", updatable = false)
    private Integer callYear;

    @Column(name = "CALL_MONTH", updatable = false)
    private Integer callMonth;

    @Column(name = "CALL_DAY", updatable = false)
    private Integer callDay;

    @Column(name = "CALL_WEEK", updatable = false)
    private Integer callWeek;

    @Column(name = "FREQUENCY", updatable = false)
    private Integer frequency;

    @Column(name = "SUB_FREQUENCY", updatable = false)
    private Integer subFrequency;

    @Column(name = "TOTAL_FREQUENCY", updatable = false)
    private Integer totleFrequency;

    public Long getCollectId() {
        return collectId;
    }

    public void setCollectId(Long collectId) {
        this.collectId = collectId;
    }

    public Integer getCallNum() {
        return callNum;
    }

    public void setCallNum(Integer callNum) {
        this.callNum = callNum;
    }

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getTagText() {
        return tagText;
    }

    public void setTagText(String tagText) {
        this.tagText = tagText;
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

    public Integer getTotleFrequency() {
        return totleFrequency;
    }

    public void setTotleFrequency(Integer totleFrequency) {
        this.totleFrequency = totleFrequency;
    }
}
