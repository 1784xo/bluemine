package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Objects;

/**
 * Created by hechao on 2018/6/28.
 */
@Entity
@Table(name = "rule")
public class RuleEntity extends PartitionEntity implements Serializable {
    private static final long serialVersionUID = 4809807217438537404L;
    @Id
    @Column(name = "RULE_ID", nullable = false, updatable = false)
    private Long ruleId;

    @Column(name = "CHANNEL_ID", nullable = false, updatable = false)
    private Long channelId;

    @Column(name = "CALL_TYPE", nullable = false, length = 4)
    private String callType;

    @Column(name = "ROLE_TYPE", nullable = false, length = 4)
    private String roleType;

    @Column(name = "TAG_ID", nullable = false, updatable = false)
    private Long tagId;

    @Column(name = "PRIORITY_NO", nullable = false)
    private Integer priorityNo;

    @Column(name = "RULE_EXPS", nullable = false,length = 255)
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
    public Object primaryKey() {
        return ruleId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RuleEntity that = (RuleEntity) o;
        return Objects.equals(ruleId, that.ruleId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ruleId);
    }

    @Override
    public String toString() {
        return "RuleEntity{" +
                "callType='" + callType + '\'' +
                ", channelId=" + channelId +
                ", priorityNo=" + priorityNo +
                ", roleType='" + roleType + '\'' +
                ", ruleExps='" + ruleExps + '\'' +
                ", ruleId=" + ruleId +
                ", tagId=" + tagId +
                "} " + super.toString();
    }

    public RuleEntity ruleId(Long ruleId) {
        this.ruleId = ruleId;
        return this;
    }

    public RuleEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public RuleEntity callType(String callType) {
        this.callType = callType;
        return this;
    }

    public RuleEntity roleType(String roleType) {
        this.roleType = roleType;
        return this;
    }

    public RuleEntity tagId(Long tagId) {
        this.tagId = tagId;
        return this;
    }

    public RuleEntity priorityNo(Integer priorityNo) {
        this.priorityNo = priorityNo;
        return this;
    }

    public RuleEntity ruleExps(String ruleExps) {
        this.ruleExps = ruleExps;
        return this;
    }
}
