package com.bluemine.common;

import java.io.Serializable;

/**
 * Created by yxghero2 
 */
public class DeptRequest implements Serializable {

    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 7045775793312368551L;

	private Long deptId;

    private Boolean activated;

    private Long channelId;

    private String deptText;

    private Long parentId;

    private String descText;
    
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


    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public String getDeptText() {
		return deptText;
	}

	public void setDeptText(String deptText) {
		this.deptText = deptText;
	}
	
	public String getDescText() {
		return descText;
	}

	public void setDescText(String descText) {
		this.descText = descText;
	}

	@Override
	public String toString() {
		return "DeptRequest [deptId=" + deptId + ", activated=" + activated + ", channelId=" + channelId + ", deptText="
				+ deptText + ", parentId=" + parentId + ", descText=" + descText + "]";
	}


}
