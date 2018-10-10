package com.bluemine.domain.entity;

import org.hibernate.annotations.Type;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Objects;

/**
 * Created by yxghero2
 */
@Entity
@Table(name = "quality_group")
public class QualityGroupEntity extends DescriptionEntity implements Serializable {
    private static final long serialVersionUID = -1059804551090568901L;
    @Id
    @Column(name = "GROUP_ID", nullable = false, updatable = false)
    private Long groupId;

    @Type(type = "yes_no")
    @Column(name = "ACTIVATED", nullable = false, length = 1)
    private Boolean activated;

    @Column(name = "CHANNEL_ID", updatable = false, nullable = false)
    private Long channelId;

    @Column(name = "GROUP_NAME", nullable = false)
    private String groupName;

    @Column(name = "DESC_TEXT", nullable = false, length = 255)
    private String descText;


    public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getDescText() {
		return descText;
	}

	public void setDescText(String descText) {
		this.descText = descText;
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


    @Override
    public Object primaryKey() {
        return groupId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        QualityGroupEntity quaEntity = (QualityGroupEntity) o;
        return Objects.equals(groupId, quaEntity.groupId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(groupId);
    }

    @Override
    public String toString() {
        return "QualityGroupEntity{" +
                "activated=" + activated +
                ", channelId=" + channelId +
                ", groupId=" + groupId +
                ", groupName=" + groupName +
                ", descText='" + descText + '\'' +
                "} " + super.toString();
    }


    public QualityGroupEntity groupId(Long groupId) {
        this.groupId = groupId;
        return this;
    }

    public QualityGroupEntity activated(Boolean activated) {
        this.activated = activated;
        return this;
    }

    public QualityGroupEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public QualityGroupEntity groupName(String groupName) {
        this.groupName = groupName;
        return this;
    }

    public QualityGroupEntity descText(String descText) {
        this.descText = descText;
        return this;
    }

}
