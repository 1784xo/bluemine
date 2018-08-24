package com.bluemine.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hechao on 2018/6/28.
 */
public class TagResponse implements Serializable {

    private static final long serialVersionUID = 8493736150628716726L;

    private long tagId;

    private boolean activated;

    private long channelId;

    private int tagNo;

    private String tagText;

    private long parentId;

    private boolean customizable;

    private List<TagResponse> children = new ArrayList<TagResponse>();

    private List<RuleResponse> rules = new ArrayList<>();

    public long getTagId() {
        return tagId;
    }

    public void setTagId(long tagId) {
        this.tagId = tagId;
    }

    public boolean getActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }

    public long getChannelId() {
        return channelId;
    }

    public void setChannelId(long channelId) {
        this.channelId = channelId;
    }

    public int getTagNo() {
        return tagNo;
    }

    public void setTagNo(int tagNo) {
        this.tagNo = tagNo;
    }

    public String getTagText() {
        return tagText;
    }

    public void setTagText(String tagText) {
        this.tagText = tagText;
    }

    public long getParentId() {
        return parentId;
    }

    public void setParentId(long parentId) {
        this.parentId = parentId;
    }

    public boolean getCustomizable() {
        return customizable;
    }

    public void setCustomizable(boolean customizable) {
        this.customizable = customizable;
    }

    public void addChildren(TagResponse children){
        this.children.add(children);
    }

    public List<TagResponse> getChildren() {
        return children;
    }

    public void setChildren(List<TagResponse> children) {
        this.children = children;
    }

    public void addRule(RuleResponse rule){
        this.rules.add(rule);
    }

    public List<RuleResponse> getRules() {
        return rules;
    }

    public void setRules(List<RuleResponse> rules) {
        this.rules = rules;
    }

    @Override
    public String toString() {
        return "TagResponse{" +
                "activated=" + activated +
                ", channelId=" + channelId +
                ", children=" + children +
                ", parentId=" + parentId +
                ", customizable=" + customizable +
                ", rules=" + rules +
                ", tagNo='" + tagNo + '\'' +
                ", tagId=" + tagId +
                ", tagText='" + tagText + '\'' +
                '}';
    }
}
