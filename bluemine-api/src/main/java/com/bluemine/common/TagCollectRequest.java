package com.bluemine.common;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Created by wangjt on 2018/7/22.
 */
public class TagCollectRequest implements Serializable {
    private static final long serialVersionUID = 2573158003745547629L;

    private String sType;//day，week，month
    private Long tagIds;
    private String dateType;
    private String dateStr;
    private Long channelId;
    private String seatNo;
    private String callNo;
    private LocalDate callDate;
    private LocalDate daterangeForm;
    private LocalDate daterangeTo;
    private Integer page;
    private Integer size;
    private String subType;

    public String getsType() {
        return sType;
    }

    public void setsType(String sType) {
        this.sType = sType;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public Long getTagIds() {
        return tagIds;
    }

    public void setTagIds(Long tagIds) {
        this.tagIds = tagIds;
    }

    public String getDateType() {
        return dateType;
    }

    public void setDateType(String dateType) {
        this.dateType = dateType;
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

    public LocalDate getDaterangeForm() {
        return daterangeForm;
    }

    public void setDaterangeForm(LocalDate daterangeForm) {
        this.daterangeForm = daterangeForm;
    }

    public LocalDate getDaterangeTo() {
        return daterangeTo;
    }

    public void setDaterangeTo(LocalDate daterangeTo) {
        this.daterangeTo = daterangeTo;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getSubType() {
        return subType;
    }

    public void setSubType(String subType) {
        this.subType = subType;
    }

    @Override
    public String toString() {
        return "TagCollectRequest{" +
                "sType='" + sType + '\'' +
                ", tagIds=" + tagIds +
                ", dateType='" + dateType + '\'' +
                ", dateStr='" + dateStr + '\'' +
                ", channelId=" + channelId +
                ", seatNo='" + seatNo + '\'' +
                ", callNo='" + callNo + '\'' +
                ", callDate=" + callDate +
                ", daterangeForm=" + daterangeForm +
                ", daterangeTo=" + daterangeTo +
                ", page=" + page +
                ", size=" + size +
                ", subType=" + subType +
                '}';
    }
}
