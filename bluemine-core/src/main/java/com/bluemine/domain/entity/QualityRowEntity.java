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
@Table(name = "quality_row")
public class QualityRowEntity extends DescriptionEntity implements Serializable {
    private static final long serialVersionUID = -1059804551090568901L;
    @Id
    @Column(name = "ROW_ID", nullable = false, updatable = false)
    private Long rowId;
    
    @Column(name = "GROUP_ID", nullable = false, updatable = false)
    private Long groupId;

    @Type(type = "yes_no")
    @Column(name = "ACTIVATED", nullable = false, length = 1)
    private Boolean activated;

    @Column(name = "CHANNEL_ID", updatable = false, nullable = false)
    private Long channelId;

    @Column(name = "ROW_NAME", nullable = false)
    private String rowName;
    
    @Column(name = "ROW_TYPE", nullable = false)
    private String rowType;
    
    @Column(name = "WEIGHT", nullable = false)
    private Integer weight;
    
    @Column(name = "POINT", nullable = false)
    private Integer point;

    @Column(name = "DESC_TEXT", nullable = false, length = 255)
    private String descText;


    public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
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

    public Long getRowId() {
		return rowId;
	}

	public void setRowId(Long rowId) {
		this.rowId = rowId;
	}

	public String getRowName() {
		return rowName;
	}

	public void setRowName(String rowName) {
		this.rowName = rowName;
	}

	public String getRowType() {
		return rowType;
	}

	public void setRowType(String rowType) {
		this.rowType = rowType;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	@Override
    public Object primaryKey() {
        return rowId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        QualityRowEntity quaEntity = (QualityRowEntity) o;
        return Objects.equals(rowId, quaEntity.rowId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rowId);
    }

    @Override
	public String toString() {
		return "QualityRowEntity {rowId=" + rowId + ", groupId=" + groupId + ", activated=" + activated + ", channelId="
				+ channelId + ", rowName=" + rowName + ", rowType=" + rowType + ", weight=" + weight + ", point="
				+ point + ", descText=" + descText + "}"+super.toString();
	}

    
    public QualityRowEntity rowId(Long rowId) {
        this.rowId = rowId;
        return this;
    }
    
    public QualityRowEntity groupId(Long groupId) {
        this.groupId = groupId;
        return this;
    }

    public QualityRowEntity activated(Boolean activated) {
        this.activated = activated;
        return this;
    }

    public QualityRowEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }


    public QualityRowEntity descText(String descText) {
        this.descText = descText;
        return this;
    }
    
    public QualityRowEntity rowName(String rowName) {
        this.rowName = rowName;
        return this;
    }

    public QualityRowEntity rowType(String rowType) {
        this.rowType = rowType;
        return this;
    }
    
    public QualityRowEntity weight(Integer weight) {
        this.weight = weight;
        return this;
    }
    
    public QualityRowEntity point(Integer point) {
        this.point = point;
        return this;
    }

}
