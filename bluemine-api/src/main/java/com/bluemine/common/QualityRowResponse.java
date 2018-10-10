package com.bluemine.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yxghero2 on 2018/09/10.
 */
public class QualityRowResponse implements Serializable {


	private static final long serialVersionUID = -3859885156928029099L;

	private long id;

    private boolean activated;

    private long channelId;
    
    private long groupId;

    private String rowType;
    
    private String name;

    private String text;
    
    private int weight;
     
    private int point;
    
    private List<QualityItemResponse> items = new ArrayList<>();

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


    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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

	public void addItems(QualityItemResponse item){
		this.items.add(item);
	}
	
	public List<QualityItemResponse> getItems() {
		return items;
	}

	public void setItems(List<QualityItemResponse> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "QualityRowResponse [id=" + id + ", activated=" + activated + ", channelId=" + channelId + ", groupId="
				+ groupId + ", rowType=" + rowType + ", name=" + name + ", text=" + text + ", weight=" + weight
				+ ", point=" + point + "]";
	}
	
}
