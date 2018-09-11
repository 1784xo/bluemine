package com.bluemine.common;

import java.time.LocalDateTime;

/**
 * Created by hechao on 2018/9/6.
 */
public class SolrResponseData {
    private String id;
    private String Company;
    private String BusinessType;
    private String FirstLevelDepartment;
    private String  SecondaryDepartment;
    private String  TertiaryDepartment;
    private String  AgentIp;
    private String  AgentMacAddress;
    private Integer  Role;
    private  String Province;
    private  String City;
    private  String County;
    private  Integer SessionType;
    private  String ChineseName;
    private  String UID;
    private  String SessionID;
    private  Integer SessionOrder;
    private LocalDateTime StartTime;
    private LocalDateTime EndTime;
    private String Content;
    private Long _version_;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCompany() {
        return Company;
    }

    public void setCompany(String company) {
        Company = company;
    }

    public String getBusinessType() {
        return BusinessType;
    }

    public void setBusinessType(String businessType) {
        BusinessType = businessType;
    }

    public String getFirstLevelDepartment() {
        return FirstLevelDepartment;
    }

    public void setFirstLevelDepartment(String firstLevelDepartment) {
        FirstLevelDepartment = firstLevelDepartment;
    }

    public String getSecondaryDepartment() {
        return SecondaryDepartment;
    }

    public void setSecondaryDepartment(String secondaryDepartment) {
        SecondaryDepartment = secondaryDepartment;
    }

    public String getTertiaryDepartment() {
        return TertiaryDepartment;
    }

    public void setTertiaryDepartment(String tertiaryDepartment) {
        TertiaryDepartment = tertiaryDepartment;
    }

    public String getAgentIp() {
        return AgentIp;
    }

    public void setAgentIp(String agentIp) {
        AgentIp = agentIp;
    }

    public String getAgentMacAddress() {
        return AgentMacAddress;
    }

    public void setAgentMacAddress(String agentMacAddress) {
        AgentMacAddress = agentMacAddress;
    }

    public Integer getRole() {
        return Role;
    }

    public void setRole(Integer role) {
        Role = role;
    }

    public String getProvince() {
        return Province;
    }

    public void setProvince(String province) {
        Province = province;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getCounty() {
        return County;
    }

    public void setCounty(String county) {
        County = county;
    }

    public Integer getSessionType() {
        return SessionType;
    }

    public void setSessionType(Integer sessionType) {
        SessionType = sessionType;
    }

    public String getChineseName() {
        return ChineseName;
    }

    public void setChineseName(String chineseName) {
        ChineseName = chineseName;
    }

    public String getUID() {
        return UID;
    }

    public void setUID(String UID) {
        this.UID = UID;
    }

    public String getSessionID() {
        return SessionID;
    }

    public void setSessionID(String sessionID) {
        SessionID = sessionID;
    }

    public Integer getSessionOrder() {
        return SessionOrder;
    }

    public void setSessionOrder(Integer sessionOrder) {
        SessionOrder = sessionOrder;
    }

    public LocalDateTime getStartTime() {
        return StartTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        StartTime = startTime;
    }

    public LocalDateTime getEndTime() {
        return EndTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        EndTime = endTime;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public Long get_version_() {
        return _version_;
    }

    public void set_version_(Long _version_) {
        this._version_ = _version_;
    }
}
