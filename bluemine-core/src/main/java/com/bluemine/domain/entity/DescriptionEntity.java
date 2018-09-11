package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;

/**
 * Created by hechao on 2017/11/29.
 */
@MappedSuperclass
public abstract class DescriptionEntity extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 6447564684929633256L;

    private String descText;

    public String getDescText() {
        return descText;
    }

    @Column(name = "DESC_TEXT", nullable = true, length = 120)
    public void setDescText(String descText) {
        this.descText = descText;
    }

    @Override
    public String toString() {
        return "DescriptionEntity{" +
                "descText='" + descText + '\'' +
                "} " + super.toString();
    }
}
