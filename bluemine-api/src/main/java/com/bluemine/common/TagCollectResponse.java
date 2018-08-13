package com.bluemine.common;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Created by wangjt on 2018/7/22.
 */
public class TagCollectResponse implements Serializable {

    private static final long serialVersionUID = 4940137728011791573L;

    private Integer callYear;

    private Integer callMonth;

    private Integer callDay;

    private Integer callWeek;

    private LocalDate callDate;

    private Integer frequency;

    private Integer subFrequency;

    private Integer totalFrequency;

    private Long tagId;

    private String tagText;

    private Long callNum;

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

    public Integer getTotalFrequency() {
        return totalFrequency;
    }

    public void setTotalFrequency(Integer totalFrequency) {
        this.totalFrequency = totalFrequency;
    }

    public String getTagText() {
        return tagText;
    }

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public void setTagText(String tagText) {
        this.tagText = tagText;
    }

    public Long getCallNum() {
        return callNum;
    }

    public void setCallNum(Long callNum) {
        this.callNum = callNum;
    }

    @Override
    public String toString() {
        return "TagCollectResponse{" +
                "callDate=" + callDate +
                ", callDay=" + callDay +
                ", callMonth=" + callMonth +
                ", callNum=" + callNum +
                ", callWeek=" + callWeek +
                ", callYear=" + callYear +
                ", frequency=" + frequency +
                ", subFrequency=" + subFrequency +
                ", tagId=" + tagId +
                ", tagText='" + tagText + '\'' +
                ", totalFrequency=" + totalFrequency +
                '}';
    }
}
