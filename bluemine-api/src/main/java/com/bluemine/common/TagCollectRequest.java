package com.bluemine.common;

import com.bluemine.struct.IndexTypeEnum;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Created by wangjt on 2018/7/22.
 */
public class TagCollectRequest implements Serializable {
    private static final long serialVersionUID = 2573158003745547629L;
    private Long channelId;
    private Long tagIds;
    private LocalDate daterangeForm;
    private LocalDate daterangeTo;
    private String callType;
    private String roleType;
    private IndexTypeEnum indexType;

    private String sType;//day，week，month
    private String dateType;
    private String dateStr;
    private String seatNo;
    private String callNo;
    private LocalDate callDate;
    private Integer page;
    private Integer size;


    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public Long getTagIds() {
        return tagIds;
    }

    public void setTagIds(Long tagIds) {
        this.tagIds = tagIds;
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

    public String getCallType() {
        return callType;
    }

    public void setCallType(String callType) {
        this.callType = callType;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    public String getsType() {
        return sType;
    }

    public void setsType(String sType) {
        this.sType = sType;
    }

    public String getDateType() {
        return dateType;
    }

    public void setDateType(String dateType) {
        this.dateType = dateType;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
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

    public IndexTypeEnum getIndexType() {
        return indexType;
    }

    public void setIndexType(IndexTypeEnum indexType) {
        this.indexType = indexType;
    }

    @Override
    public String toString() {
        return "TagCollectRequest{" +
                "callDate=" + callDate +
                ", callNo='" + callNo + '\'' +
                ", callType='" + callType + '\'' +
                ", channelId=" + channelId +
                ", daterangeForm=" + daterangeForm +
                ", daterangeTo=" + daterangeTo +
                ", dateStr='" + dateStr + '\'' +
                ", dateType='" + dateType + '\'' +
                ", page=" + page +
                ", roleType='" + roleType + '\'' +
                ", seatNo='" + seatNo + '\'' +
                ", size=" + size +
                ", sType='" + sType + '\'' +
                ", indexType='" + indexType + '\'' +
                ", tagIds=" + tagIds +
                '}';
    }
}
