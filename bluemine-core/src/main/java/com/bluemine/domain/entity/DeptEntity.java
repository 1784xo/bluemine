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
@Table(name = "dept")
public class DeptEntity extends DescriptionEntity implements Serializable {

	private static final long serialVersionUID = -7519533373956733856L;

	@Id
    @Column(name = "DEPT_ID", nullable = false, updatable = false)
    private Long deptId;

    @Type(type = "yes_no")
    @Column(name = "ACTIVATED", nullable = false, length = 1)
    private Boolean activated;

    @Column(name = "CHANNEL_ID", updatable = false, nullable = false)
    private Long channelId;

    @Column(name = "DEPT_NO", nullable = false)
    private Integer deptNo;

    @Column(name = "DEPT_TEXT", nullable = false, length = 255)
    private String deptText;

    @Column(name = "PARENT_ID", nullable = false)
    private Long parentId;

    @Type(type = "yes_no")
    @Column(name = "CUSTOMIZABLE", nullable = false, length = 1)
    private Boolean customizable;



    public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public Integer getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(Integer deptNo) {
		this.deptNo = deptNo;
	}

	public String getDeptText() {
		return deptText;
	}

	public void setDeptText(String deptText) {
		this.deptText = deptText;
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
        return deptId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DeptEntity deptEntity = (DeptEntity) o;
        return Objects.equals(deptId, deptEntity.deptId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(deptId);
    }

    @Override
	public String toString() {
		return "DeptEntity {deptId=" + deptId + ", activated=" + activated + ", channelId=" + channelId + ", deptNo="
				+ deptNo + ", deptText=" + deptText + ", parentId=" + parentId + ", customizable=" + customizable + "}"+super.toString();
	}


    public DeptEntity deptId(Long deptId) {
        this.deptId = deptId;
        return this;
    }

    public DeptEntity activated(Boolean activated) {
        this.activated = activated;
        return this;
    }

    public DeptEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public DeptEntity deptNo(Integer deptNo) {
        this.deptNo = deptNo;
        return this;
    }

    public DeptEntity deptText(String deptText) {
        this.deptText = deptText;
        return this;
    }

    public DeptEntity parentId(Long parentId) {
        this.parentId = parentId;
        return this;
    }

    public DeptEntity customizable(Boolean customizable) {
        this.customizable = customizable;
        return this;
    }
    
}
