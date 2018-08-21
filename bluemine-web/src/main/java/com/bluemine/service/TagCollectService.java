package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.*;
import com.bluemine.context.RequestContext;
import com.bluemine.context.ServerApplicationContext;
import com.bluemine.domain.entity.TagCollectVirtualEntity;
import com.bluemine.domain.util.WebEntityUtils;
import com.bluemine.repository.TagCollectVirtualRespository;
import com.bluemine.repository.TagRepository;
import com.bluemine.util.AssertUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by hechao on 2018/8/10.
 */
@Service
public class TagCollectService {

    @Inject
    private TagRepository tagRepository;

    @Inject
    private TagCollectVirtualRespository tagCollectVirtualRespository;

    public List<TagCollectResponse> findOne(RestfulRequest<TagCollectRequest> request) {

        TagCollectRequest data = request.getData();
        Long channelId = data.getChannelId();
        AssertUtils.notNull(channelId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long[] tagIds = data.getTagIds();
        AssertUtils.notNull(tagIds, ExceptionMessageEnum.ILLEGAL_ARGUMENT);
        AssertUtils.isTrue(tagIds.length == 1, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long tagId = tagIds[0];
        AssertUtils.notNull(tagId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate form = data.getDaterangeForm();
        AssertUtils.notNull(form, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate to = data.getDaterangeTo();
        AssertUtils.notNull(to, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        String callType = data.getCallType();
        String roleType = data.getRoleType();

        List<TagCollectVirtualEntity> collect = null;
        if (tagId.compareTo(0L) == 0) {
            if (callType == null) {
                if (roleType == null) {
                    collect = tagCollectVirtualRespository.findAll(channelId, form, to);
                } else {
                    collect = tagCollectVirtualRespository.findAll(channelId, form, to, roleType);
                }
            } else {
                if (roleType == null) {
                    collect = tagCollectVirtualRespository.findAll(channelId, callType, form, to);
                } else {
                    collect = tagCollectVirtualRespository.findAll(channelId, callType, form, to, roleType);
                }
            }
        } else {
            collect = tagCollectVirtualRespository.findOne(channelId, tagId, form, to);
        }

        List<TagCollectResponse> responses = new LinkedList<>();
        for (TagCollectVirtualEntity entity : collect) {
            responses.add(WebEntityUtils.toResponse(entity));
        }

        return responses;
    }

    public List<TagCollectResponse> findSubTop(RestfulPageRequest<TagCollectRequest, TagCollectSort> request) {
        TagCollectRequest data = request.getData();
        Long channelId = data.getChannelId();
        AssertUtils.notNull(channelId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long[] tagIds = data.getTagIds();
        AssertUtils.notNull(tagIds, ExceptionMessageEnum.ILLEGAL_ARGUMENT);
        AssertUtils.isTrue(tagIds.length == 1, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long tagId = tagIds[0];
        AssertUtils.notNull(tagId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate form = data.getDaterangeForm();
        AssertUtils.notNull(form, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate to = data.getDaterangeTo();
        AssertUtils.notNull(to, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        int i = 1;
        Integer limit = data.getLimit();

        PageRequest pageRequest = request.getPageRequest();

        String callType = data.getCallType();
        String roleType = data.getRoleType();
        RequestContext<TagCollectRequest> context = request.getContext();
        ServerApplicationContext applicationContext = context.getParent();

        List<TagCollectVirtualEntity> collect = tagCollectVirtualRespository.findAll(channelId, tagId, form, to, pageRequest.getSort());
        List<TagCollectResponse> responses = new LinkedList<>();
        TagCollectVirtualEntity other = new TagCollectVirtualEntity();
        other.setFrequency(0);
        other.setSubFrequency(0);
        other.setTotleFrequency(0);
        other.setCallNum(0);

        for (TagCollectVirtualEntity entity : collect) {
            if (i < limit) {
                responses.add(WebEntityUtils.toResponse(entity));
            }else{
                other.setCallDate(entity.getCallDate());
                other.setCallDay(entity.getCallDay());
                other.setCallYear(entity.getCallYear());
                other.setCallMonth(entity.getCallMonth());
                other.setCallWeek(entity.getCallWeek());
                other.setTotleFrequency(other.getTotleFrequency()+entity.getTotleFrequency());
                other.setSubFrequency(other.getSubFrequency()+entity.getSubFrequency());
                other.setFrequency(other.getFrequency()+entity.getFrequency());
                other.setCallNum(other.getCallNum()+entity.getCallNum());
                other.setParentId(entity.getParentId());
                other.setTagId(entity.getTagId());
                other.setTagText(applicationContext.getMessage("tag.collect.other.total"));
            }
            i++;
        }
        responses.add(WebEntityUtils.toResponse(other));
        return responses;
    }
}
