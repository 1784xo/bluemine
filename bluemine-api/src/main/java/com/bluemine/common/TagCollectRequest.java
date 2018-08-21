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
    private LocalDate daterangeForm;
    private LocalDate daterangeTo;
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

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
