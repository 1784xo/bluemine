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
@Table(name = "tag_control")
public class TagControlEntity extends DescriptionEntity implements Serializable {
    private static final long serialVersionUID = 2303064574443394391L;
    @Id
    @Column(name = "CHANNEL_ID", nullable = false, updatable = false)
    private Long channelId;

    @Column(name = "NEXT_TAG_NO", nullable = false)
    private Integer nextTagNo;

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public Integer getNextTagNo() {
        return nextTagNo;
    }

    public void setNextTagNo(Integer nextTagNo) {
        this.nextTagNo = nextTagNo;
    }

    @Override
    public Object primaryKey() {
        return null;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TagControlEntity that = (TagControlEntity) o;
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
                ", nextTagNo=" + nextTagNo +
                "} " + super.toString();
    }


    public TagControlEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }

    public TagControlEntity nextTagNo(Integer nextTagNo) {
        this.nextTagNo = nextTagNo;
        return this;
    }
}
