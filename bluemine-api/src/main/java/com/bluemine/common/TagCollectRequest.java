package com.bluemine.common;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Created by wangjt on 2018/7/22.
 */
public class TagCollectRequest implements Serializable {
    private static final long serialVersionUID = 2573158003745547629L;

    private String sType;//day，week，month
    private Long tagId;
    private String dateType;
    private String dateStr;
    private Long channelNo;
    private String seatNo;
    private String callNo;
    private LocalDate callDate;
    private LocalDate start;
    private LocalDate end;
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

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public String getDateType() {
        return dateType;
    }

    public void setDateType(String dateType) {
        this.dateType = dateType;
    }

    public Long getChannelNo() {
        return channelNo;
    }

    public void setChannelNo(Long channelNo) {
        this.channelNo = channelNo;
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

    public LocalDate getStart() {
        return start;
    }

    public void setStart(LocalDate start) {
        this.start = start;
    }

    public LocalDate getEnd() {
        return end;
    }

    public void setEnd(LocalDate end) {
        this.end = end;
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
                ", tagId=" + tagId +
                ", dateType='" + dateType + '\'' +
                ", dateStr='" + dateStr + '\'' +
                ", channelNo=" + channelNo +
                ", seatNo='" + seatNo + '\'' +
                ", callNo='" + callNo + '\'' +
                ", callDate=" + callDate +
                ", start=" + start +
                ", end=" + end +
                ", page=" + page +
                ", size=" + size +
                ", subType=" + subType +
                '}';
    }
}
