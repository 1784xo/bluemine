package com.bluemine.domain.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

/**
 * Created by hechao on 2018/7/2.
 */
@Embeddable
public class CallCollectTriggerId implements Serializable {

    private static final long serialVersionUID = -7370721452158251795L;

    @Column(name = "CALL_ORDER_NO", nullable = false, length = 64)
    private String callOrderNo;

    @Column(name = "TRIGGER_DATE", nullable = false)
    private int triggerDate;

    public String getCallOrderNo() {
        return callOrderNo;
    }

    public void setCallOrderNo(String callOrderNo) {
        this.callOrderNo = callOrderNo;
    }

    public int getTriggerDate() {
        return triggerDate;
    }

    public void setTriggerDate(int triggerDate) {
        this.triggerDate = triggerDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CallCollectTriggerId that = (CallCollectTriggerId) o;
        return triggerDate == that.triggerDate &&
                Objects.equals(callOrderNo, that.callOrderNo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(callOrderNo, triggerDate);
    }

    public CallCollectTriggerId callOrderNo(String callOrderNo) {
        this.callOrderNo = callOrderNo;
        return this;
    }

    public CallCollectTriggerId triggerDate(int triggerDate) {
        this.triggerDate = triggerDate;
        return this;
    }
}
