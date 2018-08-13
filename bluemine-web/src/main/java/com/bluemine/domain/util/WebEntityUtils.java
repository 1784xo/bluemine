package com.bluemine.domain.util;

import com.bluemine.common.TagCollectResponse;
import com.bluemine.domain.entity.TagCollectVirtualEntity;

/**
 * Created by hechao on 2018/8/13.
 */
public abstract class WebEntityUtils extends EntityUtils{
    public static TagCollectResponse toResponse(TagCollectVirtualEntity entity){
        TagCollectResponse response = new TagCollectResponse();
        response.setCallDate(entity.getCallDate());
        response.setCallYear(entity.getCallYear());
        response.setCallMonth(entity.getCallMonth());
        response.setCallDay(entity.getCallDay());
        response.setCallWeek(entity.getCallWeek());
        response.setCallNum(entity.getCallNum());
        response.setFrequency(entity.getFrequency());
        response.setSubFrequency(entity.getSubFrequency());
        response.setTotalFrequency(entity.getTotleFrequency());
        response.setTagId(entity.getTagId());
        response.setTagText(entity.getTagText());
        return response;
    }
}
