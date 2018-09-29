package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import java.io.Serializable;
import java.util.Objects;

/**
 * Created by hechao on 2018/6/26.
 */
@Entity
@Table(name = "employee")
public class EmployeeEntity extends PartitionEntity implements Serializable{

    private static final long serialVersionUID = 220750482201232090L;
    @Id
    @Column(name = "EMPLOYEE_ID", nullable = false, updatable = false)
    private Long employeeId;

    @Column(name = "EMPLOYEE_NO", nullable = false, length = 11)
    private String employeeNo;

    @Type(type = "yes_no")
    @Column(name = "ACTIVATED", nullable = false, length = 1)
    private Boolean activated;
    
    @Column(name = "ROLE_ID", nullable = true)
    private Long roleId;

    @Column(name = "LEAD_ID", nullable = true)
    private Long leadId;

    @Column(name = "CHANNEL_ID", updatable = false, nullable = false)
    private Long channelId;

    @Column(name = "USER_NAME", nullable = false, length = 32)
    private String userName;

    @Column(name = "EMPLOYEE_NAME", nullable = false, length = 32)
    private String employeeName;

    @Column(name = "SEAT_ID", nullable = true)
    private Long seatId;

    @Column(name = "EMAIL", nullable = true, length = 64)
    private String email;
    
    @Column(name = "MAC", nullable = true, length = 20)
    private String mac;
    
    @Column(name = "DEPT_ID", nullable = true)
    private Long deptId;
    
    @Column(name = "GROUP_ID", nullable = true)
    private Long groupId;
    
    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeNo() {
        return employeeNo;
    }

    public void setEmployeeNo(String employeeNo) {
        this.employeeNo = employeeNo;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getLeadId() {
        return leadId;
    }

    public void setLeadId(Long leadId) {
        this.leadId = leadId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public Long getSeatId() {
        return seatId;
    }

    public void setSeatId(Long seatNo) {
        this.seatId = seatNo;
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

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
    public Object primaryKey() {
        return employeeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EmployeeEntity that = (EmployeeEntity) o;
        return Objects.equals(employeeId, that.employeeId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(employeeId);
    }


	@Override
	public String toString() {
		return "EmployeeEntity {employeeId=" + employeeId + ", employeeNo=" + employeeNo + ", activated=" + activated
				+ ", roleId=" + roleId + ", leadId=" + leadId + ", channelId=" + channelId + ", userName=" + userName
				+ ", employeeName=" + employeeName + ", seatId=" + seatId + ", email=" + email + ", mac=" + mac
				+ ", deptId=" + deptId + ", groupId=" + groupId + "}"+super.toString();
	}

	//flunet
    public EmployeeEntity employeeId(Long employeeId) {
        this.employeeId = employeeId;
        return this;
    }

    public EmployeeEntity employeeNo(String employeeNo) {
        this.employeeNo = employeeNo;
        return this;
    }

    public EmployeeEntity roleId(Long roleId) {
        this.roleId = roleId;
        return this;
    }

    public EmployeeEntity leadId(Long leadId) {
        this.leadId = leadId;
        return this;
    }

    public EmployeeEntity activated(Boolean activated) {
        this.activated = activated;
        return this;
    }

    public EmployeeEntity userName(String userName) {
        this.userName = userName;
        return this;
    }

    public EmployeeEntity employeeName(String employeeName) {
        this.employeeName = employeeName;
        return this;
    }

    public EmployeeEntity seatId(Long seatId) {
        this.seatId = seatId;
        return this;
    }

    public EmployeeEntity channelId(Long channelId) {
        this.channelId = channelId;
        return this;
    }
    
    public EmployeeEntity email(String email) {
        this.email = email;
        return this;
    }
    
    public EmployeeEntity mac(String mac) {
        this.mac = mac;
        return this;
    }
    
    public EmployeeEntity deptId(Long deptId) {
        this.deptId = deptId;
        return this;
    }
    
    public EmployeeEntity groupId(Long groupId) {
        this.groupId = groupId;
        return this;
    }
}
