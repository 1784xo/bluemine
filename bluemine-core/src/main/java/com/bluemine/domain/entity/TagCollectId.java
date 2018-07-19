package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

/**
 * Created by hechao on 2018/7/11.
 */
@Embeddable
public class TagCollectId implements Serializable {
    private static final long serialVersionUID = -3651250677217855042L;


    @Column(name = "CALL_NO", updatable = false, nullable = false, length = 64)
    private String callNo;

    @Column(name = "TAG_ID", nullable = false)
    private Long tagId;

    @Column(name = "RULE_ID", nullable = false)
    private Long ruleId;

    public String getCallNo() {
        return callNo;
    }

    public void setCallNo(String callNo) {
        this.callNo = callNo;
    }

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public Long getRuleId() {
        return ruleId;
    }

    public void setRuleId(Long ruleId) {
        this.ruleId = ruleId;
    }

    @Override
    public String toString() {
        return "TabCollectId{" +
                "callNo='" + callNo + '\'' +
                ", ruleId=" + ruleId +
                ", tagId=" + tagId +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TagCollectId that = (TagCollectId) o;
        return Objects.equals(callNo, that.callNo) &&
                Objects.equals(tagId, that.tagId) &&
                Objects.equals(ruleId, that.ruleId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(callNo, tagId, ruleId);
    }


    public TagCollectId callNo(String callNo) {
        this.callNo = callNo;
        return this;
    }

    public TagCollectId tagId(Long tagId) {
        this.tagId = tagId;
        return this;
    }

    public TagCollectId ruleId(Long ruleId) {
        this.ruleId = ruleId;
        return this;
    }
}
