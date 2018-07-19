package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

/**
 * Created by hechao on 2018/6/28.
 */
@Embeddable
public class CodeProfileId implements Serializable {

    private static final long serialVersionUID = -3973543349088302953L;

    @Column(name = "CHANNEL_ID", nullable = false)
    private Long channelId;

    @Column(name = "CODE_TYPE", nullable = false, updatable = false, length = 4)
    private String codeType;

    @Column(name = "CODE_VALUE", nullable = false, updatable = false, length = 4)
    private String codeValue;

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public String getCodeType() {
        return codeType;
    }

    public void setCodeType(String codeType) {
        this.codeType = codeType;
    }

    public String getCodeValue() {
        return codeValue;
    }

    public void setCodeValue(String codeValue) {
        this.codeValue = codeValue;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CodeProfileId that = (CodeProfileId) o;
        return channelId == that.channelId &&
                Objects.equals(codeType, that.codeType) &&
                Objects.equals(codeValue, that.codeValue);
    }

    @Override
    public int hashCode() {
        return Objects.hash(channelId, codeType, codeValue);
    }


    public CodeProfileId channelId(long channelId) {
        this.channelId = channelId;
        return this;
    }

    public CodeProfileId codeType(String codeType) {
        this.codeType = codeType;
        return this;
    }

    public CodeProfileId codeValue(String codeValue) {
        this.codeValue = codeValue;
        return this;
    }
}
