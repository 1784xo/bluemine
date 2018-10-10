package com.bluemine.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yxghero2 on 2018/09/10.
 */
public class QualityGroupRequest implements Serializable {

	private static final long serialVersionUID = -1411094797574221115L;

	private long id;

    private boolean activated;

    private long channelId;

    private String name;

    private String text;

    private String status;
    
    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    } 

	@Override
	public String toString() {
		return "QualityGroupRequest [id=" + id + ", activated=" + activated + ", channelId=" + channelId + ", name="
				+ name + ", text=" + text + ", status=" + status + "]";
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



}
