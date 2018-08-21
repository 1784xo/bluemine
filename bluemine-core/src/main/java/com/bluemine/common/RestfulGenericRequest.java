package com.bluemine.common;

import java.time.LocalDateTime;

/**
 * Created by hechao on 2017/8/29.
 */
public class RestfulGenericRequest {

    private Boolean receipt=true;
    //the function code
    private String funCode;

    //the request system name
    private String requestSystem;

    //the request operator/user
    private String requestUser;

    private String requestIp;

    //the request datetime
    private LocalDateTime requestTime = LocalDateTime.now();

    //the interface version
    private String version;

    //the check signature
    private String checkSign;

    //the attachment
    private String attachment;

    public Boolean getReceipt() {
        return receipt;
    }

    public void setReceipt(Boolean receipt) {
        this.receipt = receipt;
    }

    public String getFunCode() {
        return funCode;
    }

    public void setFunCode(String funCode) {
        this.funCode = funCode;
    }

    public String getRequestSystem() {
        return requestSystem;
    }

    public void setRequestSystem(String requestSystem) {
        this.requestSystem = requestSystem;
    }

    public String getRequestUser() {
        return requestUser;
    }

    public void setRequestUser(String requestUser) {
        this.requestUser = requestUser;
    }

    public LocalDateTime getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(LocalDateTime requestTime) {
        this.requestTime = requestTime;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getCheckSign() {
        return checkSign;
    }

    public void setCheckSign(String checkSign) {
        this.checkSign = checkSign;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getRequestIp() {
        return requestIp;
    }

    public void setRequestIp(String requestIp) {
        this.requestIp = requestIp;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("GenericRequest{");
        sb.append("attachment='").append(attachment).append('\'');
        sb.append(", checkSign='").append(checkSign).append('\'');
        sb.append(", funCode='").append(funCode).append('\'');
        sb.append(", requestIp='").append(requestIp).append('\'');
        sb.append(", requestSystem='").append(requestSystem).append('\'');
        sb.append(", cashTime=").append(requestTime);
        sb.append(", requestUser='").append(requestUser).append('\'');
        sb.append(", version='").append(version).append('\'');
        sb.append("}");
        return sb.toString();
    }
}
