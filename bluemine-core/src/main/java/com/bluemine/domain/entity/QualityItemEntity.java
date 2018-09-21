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
@Table(name = "quality_item")
public class QualityItemEntity extends DescriptionEntity implements Serializable {
    private static final long serialVersionUID = -1059804551090568901L;
    @Id
    @Column(name = "ITEM_ID", nullable = false, updatable = false)
    private Long itemId;
    
    @Column(name = "ROW_ID", nullable = false, updatable = false)
    private Long rowId;

    @Type(type = "yes_no")
    @Column(name = "ACTIVATED", nullable = false, length = 1)
    private Boolean activated;

    @Column(name = "CHANNEL_ID", updatable = false, nullable = false)
    private Long channelId;

    @Column(name = "LOGICRELATION", nullable = false)
    private Integer logicrelation;
    
    @Column(name = "LOGICSORT", nullable = false)
    private Integer logicsort;
    
    @Column(name = "LOGICIF", nullable = false)
    private Integer logicif;
    
    @Column(name = "LOGICVALUE", nullable = false)
    private String logicvalue;
    
    @Column(name = "LOGICUNIT", nullable = false)
    private Integer logicunit;

    @Column(name = "DESC_TEXT", nullable = false, length = 255)
    private String descText;


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

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Integer getLogicrelation() {
		return logicrelation;
	}

	public void setLogicrelation(Integer logicrelation) {
		this.logicrelation = logicrelation;
	}

	public Integer getLogicsort() {
		return logicsort;
	}

	public void setLogicsort(Integer logicsort) {
		this.logicsort = logicsort;
	}

	public Integer getLogicif() {
		return logicif;
	}

	public void setLogicif(Integer logicif) {
		this.logicif = logicif;
	}

	public String getLogicvalue() {
		return logicvalue;
	}

	public void setLogicvalue(String logicvalue) {
		this.logicvalue = logicvalue;
	}

	public Integer getLogicunit() {
		return logicunit;
	}

	public void setLogicunit(Integer logicunit) {
		this.logicunit = logicunit;
	}

	@Override
    public Object primaryKey() {
        return itemId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        QualityItemEntity quaEntity = (QualityItemEntity) o;
        return Objects.equals(itemId, quaEntity.itemId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(itemId);
    }
    
    @Override
	public String toString() {
		return "QualityItemEntity {itemId=" + itemId + ", rowId=" + rowId + ", activated=" + activated + ", channelId="
				+ channelId + ", logicrelation=" + logicrelation + ", logicsort=" + logicsort + ", logicif=" + logicif
				+ ", logicvalue=" + logicvalue + ", logicunit=" + logicunit + ", descText=" + descText + "}"+super.toString();
	}

	public QualityItemEntity itemId(Long itemId) {
        this.itemId = itemId;
        return this;
    }
    
    public QualityItemEntity rowId(Long rowId) {
        this.rowId = rowId;
        return this;
    }

    public QualityItemEntity activated(Boolean activated) {
        this.activated = activated;
        return this;
    }

    public QualityItemEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }


    public QualityItemEntity descText(String descText) {
        this.descText = descText;
        return this;
    }
    
    public QualityItemEntity logicrelation(Integer logicrelation) {
        this.logicrelation = logicrelation;
        return this;
    }

    public QualityItemEntity logicsort(Integer logicsort) {
        this.logicsort = logicsort;
        return this;
    }
    
    public QualityItemEntity logicif(Integer logicif) {
        this.logicif = logicif;
        return this;
    }
    
    public QualityItemEntity logicvalue(String logicvalue) {
        this.logicvalue = logicvalue;
        return this;
    }
    
    public QualityItemEntity logicunit(Integer logicunit) {
        this.logicunit = logicunit;
        return this;
    }

}
