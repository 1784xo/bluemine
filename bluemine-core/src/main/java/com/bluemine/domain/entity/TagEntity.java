package com.bluemine.domain.entity;

import org.hibernate.annotations.Type;

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
@Table(name = "tag")
public class TagEntity extends DescriptionEntity implements Serializable {
    private static final long serialVersionUID = -1059804551090568901L;
    @Id
    @Column(name = "TAG_ID", nullable = false, updatable = false)
    private Long tagId;

    @Type(type = "yes_no")
    @Column(name = "ACTIVATED", nullable = false, length = 1)
    private Boolean activated;

    @Column(name = "CHANNEL_ID", updatable = false, nullable = false)
    private Long channelId;

    @Column(name = "TAG_NO", nullable = false)
    private Integer tagNo;

    @Column(name = "TAG_TEXT", nullable = false, length = 255)
    private String tagText;

    @Column(name = "PARENT_ID", nullable = false)
    private Long parentId;

    @Type(type = "yes_no")
    @Column(name = "CUSTOMIZABLE", nullable = false, length = 1)
    private Boolean customizable;

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public Boolean getActivated() {
        return activated;
    }

    public void setActivated(Boolean activatedFlag) {
        this.activated = activatedFlag;
    }

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public Integer getTagNo() {
        return tagNo;
    }

    public void setTagNo(Integer tagCode) {
        this.tagNo = tagCode;
    }

    public String getTagText() {
        return tagText;
    }

    public void setTagText(String tagText) {
        this.tagText = tagText;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Boolean getCustomizable() {
        return customizable;
    }

    public void setCustomizable(Boolean propertyFlag) {
        this.customizable = propertyFlag;
    }

    @Override
    public Object primaryKey() {
        return tagId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TagEntity tagEntity = (TagEntity) o;
        return Objects.equals(tagId, tagEntity.tagId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(tagId);
    }

    @Override
    public String toString() {
        return "TagEntity{" +
                "activatedFlag=" + activated +
                ", channelId=" + channelId +
                ", parentId=" + parentId +
                ", propertyFlag=" + customizable +
                ", tagId=" + tagId +
                ", tagNo=" + tagNo +
                ", tagText='" + tagText + '\'' +
                "} " + super.toString();
    }


    public TagEntity tagId(Long tagId) {
        this.tagId = tagId;
        return this;
    }

    public TagEntity activatedFlag(Boolean activatedFlag) {
        this.activated = activatedFlag;
        return this;
    }

    public TagEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public TagEntity tagNo(Integer tagNo) {
        this.tagNo = tagNo;
        return this;
    }

    public TagEntity tagText(String tagText) {
        this.tagText = tagText;
        return this;
    }

    public TagEntity parentId(Long parentId) {
        this.parentId = parentId;
        return this;
    }

    public TagEntity propertyFlag(Boolean propertyFlag) {
        this.customizable = propertyFlag;
        return this;
    }
}
