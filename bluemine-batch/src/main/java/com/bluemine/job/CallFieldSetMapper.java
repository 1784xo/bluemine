package com.bluemine.job;

import org.springframework.batch.item.file.mapping.FieldSetMapper;
import org.springframework.batch.item.file.transform.FieldSet;
import org.springframework.validation.BindException;

import java.util.Date;

/**
 * Created by hechao on 2018/10/8.
 */
public class CallFieldSetMapper implements FieldSetMapper<CallItem>{

    private long channelId;

    private Date callDate;

    public CallFieldSetMapper(long channelId, Date callDate) {
        this.channelId = channelId;
        this.callDate = callDate;
    }

    public long getChannelId() {
        return channelId;
    }

    public void setChannelId(long channelId) {
        this.channelId = channelId;
    }

    public Date getCallDate() {
        return callDate;
    }

    public void setCallDate(Date callDate) {
        this.callDate = callDate;
    }

    @Override
    public CallItem mapFieldSet(FieldSet fieldSet) throws BindException {
        CallItem callItem = new CallItem();
        callItem.setChannelId(channelId);
        callItem.setCallDate(callDate);
        callItem.setCallNo(fieldSet.readString(0));
        callItem.setSeatNo(fieldSet.readString(1));
        return callItem;
    }
}
