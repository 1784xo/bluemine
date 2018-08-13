package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.ServerConstants;
import com.bluemine.common.RestfulRequest;
import com.bluemine.common.TagCollectRequest;
import com.bluemine.common.TagCollectResponse;
import com.bluemine.domain.entity.TagCollectVirtualEntity;
import com.bluemine.domain.util.WebEntityUtils;
import com.bluemine.repository.TagCollectVirtualRespository;
import com.bluemine.repository.TagRepository;
import com.bluemine.struct.IndexTypeEnum;
import com.bluemine.util.AssertUtils;
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

    public List<TagCollectResponse> find(RestfulRequest<TagCollectRequest> request) {

        TagCollectRequest data = request.getData();
        Long channelId = data.getChannelId();
        AssertUtils.notNull(channelId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long tagId = (data.getTagIds() == null ? ServerConstants.ROOT_TAG_ID : data.getTagIds());
        LocalDate form = data.getDaterangeForm();
        AssertUtils.notNull(form, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate to = data.getDaterangeTo();
        AssertUtils.notNull(to, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        String callType = data.getCallType();
        String roleType = data.getRoleType();

        List<TagCollectVirtualEntity> collect = null;
        if (tagId == 0) {
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
            collect = tagCollectVirtualRespository.findAll(channelId, tagId, form, to);
        }

        List<TagCollectResponse> responses = new LinkedList<>();
        for (TagCollectVirtualEntity entity : collect) {
            responses.add(WebEntityUtils.toResponse(entity));
        }

        return responses;
    }

    public List<TagCollectResponse> findSubTop(RestfulRequest<TagCollectRequest> request) {
        TagCollectRequest data = request.getData();
        Long channelId = data.getChannelId();
        AssertUtils.notNull(channelId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long tagId = (data.getTagIds() == null ? ServerConstants.ROOT_TAG_ID : data.getTagIds());
        LocalDate form = data.getDaterangeForm();
        AssertUtils.notNull(form, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate to = data.getDaterangeTo();
        AssertUtils.notNull(to, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Integer size = data.getSize();
        AssertUtils.notNull(size, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        IndexTypeEnum indexType = data.getIndexType();

        String callType = data.getCallType();
        String roleType = data.getRoleType();

        List<TagCollectVirtualEntity> collect = tagCollectVirtualRespository.findAll(channelId, tagId, form, to, indexType);

        List<TagCollectResponse> responses = new LinkedList<>();
        for (TagCollectVirtualEntity entity : collect) {
            responses.add(WebEntityUtils.toResponse(entity));
        }
        return responses;
    }
}
