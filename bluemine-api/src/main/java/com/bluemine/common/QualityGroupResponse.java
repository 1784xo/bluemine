package com.bluemine.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yxghero2 on 2018/09/10.
 */
public class QualityGroupResponse implements Serializable {

	private static final long serialVersionUID = 1590856888335555849L;

	private long id;

    private boolean activated;

    private long channelId;

	private String name;

    private String text;


    private List<QualityRowResponse> rows = new ArrayList<>();

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


    public void addRow(QualityRowResponse rule){
        this.rows.add(rule);
    }

    public List<QualityRowResponse> getRows() {
        return rows;
    }

    public void setRows(List<QualityRowResponse> rows) {
        this.rows = rows;
    }

	@Override
	public String toString() {
		return "QualityGroupResponse [id=" + id + ", activated=" + activated + ", channelId=" + channelId + ", name="
				+ name + ", text=" + text + ", rows=" + rows + "]";
	}


}
