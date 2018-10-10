package com.bluemine.job;

import com.bluemine.domain.entity.ChannelEntity;
import org.springframework.batch.item.file.mapping.FieldSetMapper;
import org.springframework.batch.item.file.transform.FieldSet;
import org.springframework.validation.BindException;

import java.util.Date;
import java.util.Map;

/**
 * Created by hechao on 2018/10/8.
 */
public class CallFieldSetMapper implements FieldSetMapper<CallItem>{

    private ChannelEntity channel;

    private Date callDate;

    public CallFieldSetMapper(ChannelEntity channel, Date callDate) {
        this.channel = channel;
        this.callDate = callDate;
    }

    public ChannelEntity getChannel() {
        return channel;
    }

    public void setChannel(ChannelEntity channel) {
        this.channel = channel;
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
        callItem.setChannel(channel);
        callItem.setCallDate(callDate);
        callItem.setCallNo(fieldSet.readString(0));
        callItem.setSeatNo(fieldSet.readString(1));
        return callItem;
    }
}
