package com.bluemine.common;

import java.io.Serializable;

/**
 * Created by wangjt on 2018/7/22.
 */
public class TagCollectResponse implements Serializable {

    private static final long serialVersionUID = 4940137728011791573L;

    private String callDate;

    private Integer frequency;

    private Long tagId;

    private String tagText;

    private Integer callNum;


    public String getCallDate() {
        return callDate;
    }

    public void setCallDate(String callDate) {
        this.callDate = callDate;
    }

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }

    public String getTagText() {
        return tagText;
    }

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public void setTagText(String tagText) {
        this.tagText = tagText;
    }

    public Integer getCallNum() {
        return callNum;
    }

    public void setCallNum(Integer callNum) {
        this.callNum = callNum;
    }

    @Override
    public String toString() {
        return "TagCollectResponse{" +
                "callDate='" + callDate + '\'' +
                ", frequency=" + frequency +
                ", tagText='" + tagText + '\'' +
                ", tagId=" + tagId +
                ", callNum=" + callNum +
                '}';
    }
}
