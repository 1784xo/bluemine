package com.bluemine.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yxghero2 on 2018/09/10.
 */
public class QualityRowRequest implements Serializable {


	private static final long serialVersionUID = 329844910516970792L;

	private long id;

    private boolean activated;

    private long channelId;
    
    private long groupId;

    private String rowType;
    
    private String name;

    private String text;
    
    private int weight;
     
    private int point;

    private String status;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
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

	public long getGroupId() {
		return groupId;
	}

	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}

	public String getRowType() {
		return rowType;
	}

	public void setRowType(String rowType) {
		this.rowType = rowType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "QualityRowRequest [id=" + id + ", activated=" + activated + ", channelId=" + channelId + ", groupId="
				+ groupId + ", rowType=" + rowType + ", name=" + name + ", text=" + text + ", weight=" + weight
				+ ", point=" + point + ", status=" + status + "]";
	}
    
   
}
