package com.bluemine.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yxghero2
 */
public class DeptResponse implements Serializable {

	private static final long serialVersionUID = -511378919777536543L;

	private long id;

    private boolean activated;

    private long channelId;

    private int deptNo;

    private String text;

    private long parentId;

    private boolean customizable;
    
    private String descText;

    private List<DeptResponse> children = new ArrayList<DeptResponse>();

    private List<EmployeeResponse> users = new ArrayList<>();

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

    public void addChildren(DeptResponse children){
        this.children.add(children);
    }

    public List<DeptResponse> getChildren() {
        return children;
    }

    public void setChildren(List<DeptResponse> children) {
        this.children = children;
    } 
    
    public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public List<EmployeeResponse> getUsers() {
		return users;
	}

	public void setUsers(List<EmployeeResponse> users) {
		this.users = users;
	}

    public void addUsers(EmployeeResponse rule){
        this.users.add(rule);
    }
    
	public String getDescText() {
		return descText;
	}

	public void setDescText(String descText) {
		this.descText = descText;
	}

	@Override
	public String toString() {
		return "DeptResponse [id=" + id + ", activated=" + activated + ", channelId=" + channelId + ", deptNo=" + deptNo
				+ ", text=" + text + ", parentId=" + parentId + ", customizable=" + customizable + ", descText="
				+ descText + ", children=" + children + ", users=" + users + "]";
	}
	
}
