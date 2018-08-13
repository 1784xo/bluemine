package com.bluemine.domain.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

/**
 * Created by hechao on 2018/7/11.
 */
@Entity
@Table(name = "tag_collect")
public class TagCollectEntity extends PartitionEntity implements Serializable{

    private static final long serialVersionUID = 698779721568670077L;

    @Id
    @Column(name = "COLLECT_ID", updatable = false, nullable = false)
    private Long collectId;

    @Column(name = "CHANNEL_ID", updatable = false, nullable = false)
    private Long channelId;

    @Column(name = "CALL_NO", updatable = false, nullable = false, length = 64)
    private String callNo;

    @Column(name = "TAG_ID", updatable = false, nullable = false)
    private Long tagId;

    @Column(name = "RULE_ID", updatable = false, nullable = false)
    private Long ruleId;

    @Column(name = "CALL_TYPE", updatable = false, nullable = false, length = 4)
    private String callType;

    @Column(name = "ROLE_TYPE", updatable = false, nullable = false, length = 4)
    private String roleType;

    @Column(name = "PARENT_ID", updatable = false, nullable = false)
    private Long parentId;

    @Column(name = "TAG_TEXT", updatable = false, nullable = false, length = 255)
    private String tagText;

    @Column(name = "RULE_EXPS", updatable = false, nullable = false,length = 255)
    private String ruleExps;

    @Column(name = "SEAT_ID", updatable = false, nullable = false)
    private Long seatId;

    @Column(name = "CALL_DATE", updatable = false, nullable = false)
    private LocalDate callDate;

    @Column(name = "CALL_YEAR", updatable = false, nullable = false)
    private Integer callYear;

    @Column(name = "CALL_MONTH", updatable = false, nullable = false)
    private Integer callMonth;

    @Column(name = "CALL_DAY", updatable = false, nullable = false)
    private Integer callDay;

    @Column(name = "CALL_WEEK", updatable = false, nullable = false)
    private Integer callWeek;

    @Column(name = "FREQUENCY", updatable = false, nullable = false)
    private Integer frequency;

    @Column(name = "SUB_FREQUENCY", updatable = false, nullable = false)
    private Integer subFrequency;

    @Column(name = "TOTAL_FREQUENCY", updatable = false)
    private Integer totleFrequency;

    @Column(name = "SUB_TOTAL", updatable = false, nullable = false)
    private Integer subTotal;

    public Long getCollectId() {
        return collectId;
    }

    public void setCollectId(Long collectId) {
        this.collectId = collectId;
    }

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

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

    public String getRuleExps() {
        return ruleExps;
    }

    public void setRuleExps(String ruleExps) {
        this.ruleExps = ruleExps;
    }

    public Long getSeatId() {
        return seatId;
    }

    public void setSeatId(Long seatId) {
        this.seatId = seatId;
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

    public Integer getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Integer subTotal) {
        this.subTotal = subTotal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TagCollectEntity that = (TagCollectEntity) o;
        return Objects.equals(collectId, that.collectId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(collectId);
    }

    @Override
    public Object primaryKey() {
        return collectId;
    }

    @Override
    public String toString() {
        return "TagCollectEntity{" +
                "callDate=" + callDate +
                ", callDay=" + callDay +
                ", callMonth=" + callMonth +
                ", callNo='" + callNo + '\'' +
                ", callType='" + callType + '\'' +
                ", callWeek=" + callWeek +
                ", callYear=" + callYear +
                ", channelId=" + channelId +
                ", collectId=" + collectId +
                ", frequency=" + frequency +
                ", parentId=" + parentId +
                ", roleType='" + roleType + '\'' +
                ", ruleExps='" + ruleExps + '\'' +
                ", ruleId=" + ruleId +
                ", seatId=" + seatId +
                ", subFrequency=" + subFrequency +
                ", subTotal=" + subTotal +
                ", tagId=" + tagId +
                ", tagText='" + tagText + '\'' +
                ", totleFrequency=" + totleFrequency +
                "} " + super.toString();
    }

    public TagCollectEntity collectId(Long collectId) {
        this.collectId = collectId;
        return this;
    }

    public TagCollectEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public TagCollectEntity callNo(String callNo) {
        this.callNo = callNo;
        return this;
    }

    public TagCollectEntity tagId(Long tagId) {
        this.tagId = tagId;
        return this;
    }

    public TagCollectEntity ruleId(Long ruleId) {
        this.ruleId = ruleId;
        return this;
    }

    public TagCollectEntity callType(String callType) {
        this.callType = callType;
        return this;
    }

    public TagCollectEntity roleType(String roleType) {
        this.roleType = roleType;
        return this;
    }

    public TagCollectEntity parentId(Long parentId) {
        this.parentId = parentId;
        return this;
    }

    public TagCollectEntity tagText(String tagText) {
        this.tagText = tagText;
        return this;
    }

    public TagCollectEntity ruleExps(String ruleExps) {
        this.ruleExps = ruleExps;
        return this;
    }

    public TagCollectEntity seatId(Long seatId) {
        this.seatId = seatId;
        return this;
    }

    public TagCollectEntity callDate(LocalDate callDate) {
        this.callDate = callDate;
        return this;
    }

    public TagCollectEntity callYear(Integer callYear) {
        this.callYear = callYear;
        return this;
    }

    public TagCollectEntity callMonth(Integer callMonth) {
        this.callMonth = callMonth;
        return this;
    }

    public TagCollectEntity callDay(Integer callDay) {
        this.callDay = callDay;
        return this;
    }

    public TagCollectEntity callWeek(Integer callWeek) {
        this.callWeek = callWeek;
        return this;
    }

    public TagCollectEntity frequency(Integer frequency) {
        this.frequency = frequency;
        return this;
    }

    public TagCollectEntity subFrequency(Integer subFrequency) {
        this.subFrequency = subFrequency;
        return this;
    }

    public TagCollectEntity subTotal(Integer subTotal) {
        this.subTotal = subTotal;
        return this;
    }

    public TagCollectEntity totleFrequency(Integer totleFrequency) {
        this.totleFrequency = totleFrequency;
        return this;
    }
}
