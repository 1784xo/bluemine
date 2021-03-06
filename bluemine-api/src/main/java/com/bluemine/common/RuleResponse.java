package com.bluemine.common;

import java.io.Serializable;

/**
 * Created by hechao on 2018/6/29.
 */
public class RuleResponse implements Serializable{
    private static final long serialVersionUID = -5572704176228713634L;

    private Long ruleId;

    private Long channelId;

    private String callType;

    private String roleType;

    private Long tagId;

    private Integer priorityNo;

    private String ruleExps;

    public Long getRuleId() {
        return ruleId;
    }

    public void setRuleId(Long ruleId) {
        this.ruleId = ruleId;
    }

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
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

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public Integer getPriorityNo() {
        return priorityNo;
    }

    public void setPriorityNo(Integer priorityNo) {
        this.priorityNo = priorityNo;
    }

    public String getRuleExps() {
        return ruleExps;
    }

    public void setRuleExps(String ruleExps) {
        this.ruleExps = ruleExps;
    }

    @Override
    public String toString() {
        return "RuleResponse{" +
                "callType='" + callType + '\'' +
                ", channelId=" + channelId +
                ", priorityNo=" + priorityNo +
                ", roleType='" + roleType + '\'' +
                ", ruleExps='" + ruleExps + '\'' +
                ", ruleId=" + ruleId +
                ", tagId=" + tagId +
                '}';
    }
}
