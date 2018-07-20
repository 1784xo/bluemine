package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
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

    @Column(name = "ROLE_ID", nullable = false)
    private Long roleId;

    @Column(name = "LEAD_ID", nullable = false)
    private Long leadId;

    @Column(name = "CHANNEL_TYPE", nullable = false, length = 4)
    private String channelType;

    @Column(name = "CHANNEL_CODE", nullable = false, length = 4)
    private String channelCode;

    @Column(name = "EMPLOYEE_NAME", nullable = false, length = 32)
    private String employeeName;

    @Column(name = "SEAT_ID", nullable = true)
    private Long seatId;

    @Column(name = "EMAIL", nullable = true, length = 64)
    private String email;

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

    public String getChannelType() {
        return channelType;
    }

    public void setChannelType(String channelType) {
        this.channelType = channelType;
    }

    public String getChannelCode() {
        return channelCode;
    }

    public void setChannelCode(String channelCode) {
        this.channelCode = channelCode;
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
        return "EmployeeEntity{" +
                "channelCode='" + channelCode + '\'' +
                ", channelType='" + channelType + '\'' +
                ", email='" + email + '\'' +
                ", employeeId=" + employeeId +
                ", employeeName='" + employeeName + '\'' +
                ", employeeNo='" + employeeNo + '\'' +
                ", leadId=" + leadId +
                ", roleId=" + roleId +
                ", seatId=" + seatId +
                "} " + super.toString();
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

    public EmployeeEntity channelType(String channelType) {
        this.channelType = channelType;
        return this;
    }

    public EmployeeEntity channelCode(String channelCode) {
        this.channelCode = channelCode;
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

    public EmployeeEntity email(String email) {
        this.email = email;
        return this;
    }
}
