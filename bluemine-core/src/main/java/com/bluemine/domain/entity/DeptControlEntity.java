package com.bluemine.domain.entity;

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
@Table(name = "dept_control")
public class DeptControlEntity extends DescriptionEntity implements Serializable {

	private static final long serialVersionUID = -3178103057179525023L;

	@Id
    @Column(name = "CHANNEL_ID", nullable = false, updatable = false)
    private Long channelId;

    @Column(name = "NEXT_DEPT_NO", nullable = false)
    private Integer nextDeptNo;

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public Integer getNextDeptNo() {
        return nextDeptNo;
    }

    public void setNextDeptNo(Integer nextDeptNo) {
        this.nextDeptNo = nextDeptNo;
    }

    @Override
    public Object primaryKey() {
        return null;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DeptControlEntity that = (DeptControlEntity) o;
        return Objects.equals(channelId, that.channelId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(channelId);
    }

    @Override
    public String toString() {
        return "TagControlEntity{" +
                "channelId=" + channelId +
                ", nextDeptNo=" + nextDeptNo +
                "} " + super.toString();
    }


    public DeptControlEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public DeptControlEntity nextDeptNo(Integer nextDeptNo) {
        this.nextDeptNo = nextDeptNo;
        return this;
    }
}
