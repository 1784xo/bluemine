package com.bluemine.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yxghero2
 */
public class EmployeeResponse implements Serializable {

	private static final long serialVersionUID = 5202223288907027317L;

	private long id;

    private boolean activated;
    
    private String employeeNo;
    
    private String employeeName;
    
    private String userName;

    private long channelId;

    private String email;
  
    private String mac;

    private long groupId;

    private long deptId;
    
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

	public String getEmployeeNo() {
		return employeeNo;
	}

	public void setEmployeeNo(String employeeNo) {
		this.employeeNo = employeeNo;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getChannelId() {
		return channelId;
	}

	public void setChannelId(long channelId) {
		this.channelId = channelId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public long getGroupId() {
		return groupId;
	}

	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}

	public long getDeptId() {
		return deptId;
	}

	public void setDeptId(long deptId) {
		this.deptId = deptId;
	}

	@Override
	public String toString() {
		return "EmployeeResponse [id=" + id + ", activated=" + activated + ", employeeNo=" + employeeNo
				+ ", employeeName=" + employeeName + ", userName=" + userName + ", channelId=" + channelId + ", email="
				+ email + ", mac=" + mac + ", groupId=" + groupId + ", deptId=" + deptId + "]";
	}

}
