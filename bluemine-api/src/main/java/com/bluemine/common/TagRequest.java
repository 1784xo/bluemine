package com.bluemine.common;

import java.io.Serializable;

/**
 * Created by hechao on 2018/6/28.
 */
public class TagRequest implements Serializable {
    private static final long serialVersionUID = 1734359057012266047L;

    private Long tagId;

    private Boolean activated;

    private Long channelId;

    private String tagText;

    private Long parentId;

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public Boolean getActivated() {
        return activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public String getTagText() {
        return tagText;
    }

    public void setTagText(String tagText) {
        this.tagText = tagText;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return "TagRequest{" +
                "activated=" + activated +
                ", channelId=" + channelId +
                ", parentId=" + parentId +
                ", tagId=" + tagId +
                ", tagText='" + tagText + '\'' +
                '}';
    }
}
