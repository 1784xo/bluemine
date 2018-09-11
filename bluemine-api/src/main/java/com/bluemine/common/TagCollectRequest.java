package com.bluemine.common;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * Created by wangjt on 2018/7/22.
 */
public class TagCollectRequest implements Serializable {
    private static final long serialVersionUID = 2573158003745547629L;
    private Long channelId;
    private Long[] tagIds;
    private LocalDate[] daterange;
    private String dateType;
    private Long parentId;
    private String callType;
    private String roleType;
    private Integer limit;

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public Long[] getTagIds() {
        return tagIds;
    }

    public void setTagIds(Long[] tagIds) {
        this.tagIds = tagIds;
    }

    public LocalDate[] getDaterange() {
        return daterange;
    }

    public void setDaterange(LocalDate[] daterange) {
        this.daterange = daterange;
    }

    public int  daterangeSize(){
        return daterange==null? -1: daterange.length;
    }

    public LocalDate getStartDate(){
        return daterange[0];
    }

    public LocalDate getEndDate(){
        return daterange[1];
    }

    public String getDateType() {
        return dateType;
    }

    public void setDateType(String dateType) {
        this.dateType = dateType;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
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

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
