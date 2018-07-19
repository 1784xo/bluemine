package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;

/**
 * Created by hechao on 2018/6/26.
 */
@MappedSuperclass
public abstract class PartitionEntity extends DescriptionEntity implements Serializable{
    private static final long serialVersionUID = -6648991809382980399L;

    @Column(name = "PARTITION_KEY", nullable = false, updatable = false)
    private Integer partitionKey;

    public Integer getPartitionKey() {
        return partitionKey;
    }

    public void setPartitionKey(Integer partitionKey) {
        this.partitionKey = partitionKey;
    }

    //override object
    @Override
    public String toString() {
        return "PartitionEntity{" +
                "partitionKey=" + partitionKey +
                "} " + super.toString();
    }

    //fluent
    public PartitionEntity partitionKey(Integer partitionKey) {
        this.partitionKey = partitionKey;
        return this;
    }
}
