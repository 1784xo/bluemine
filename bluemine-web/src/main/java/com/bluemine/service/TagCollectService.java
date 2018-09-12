package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.*;
import com.bluemine.context.RequestContext;
import com.bluemine.context.ServerApplicationContext;
import com.bluemine.domain.entity.TagCollectVirtualEntity;
import com.bluemine.domain.entity.Tagresult;
import com.bluemine.domain.util.WebEntityUtils;
import com.bluemine.repository.TagCollectVirtualRespository;
import com.bluemine.repository.TagRepository;
import com.bluemine.util.AssertUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.inject.Inject;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

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

        AssertUtils.isTrue(data.daterangeSize() == 2, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long channelId = data.getChannelId();
        AssertUtils.notNull(channelId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long[] tagIds = data.getTagIds();
        AssertUtils.notNull(tagIds, ExceptionMessageEnum.ILLEGAL_ARGUMENT);
        AssertUtils.isTrue(tagIds.length == 1, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long tagId = tagIds[0];
        AssertUtils.notNull(tagId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate startDate = data.getStartDate();
        AssertUtils.notNull(startDate, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate endDate = data.getEndDate();
        AssertUtils.notNull(endDate, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        String callType = data.getCallType();
        String roleType = data.getRoleType();

        List<TagCollectVirtualEntity> collect = null;
        if (tagId.compareTo(0L) == 0) {
            if (callType == null) {
                if (roleType == null) {
                    collect = tagCollectVirtualRespository.findAll(channelId, startDate, endDate);
                } else {
                    collect = tagCollectVirtualRespository.findAll(channelId, startDate, endDate, roleType);
                }
            } else {
                if (roleType == null) {
                    collect = tagCollectVirtualRespository.findAll(channelId, callType, startDate, endDate);
                } else {
                    collect = tagCollectVirtualRespository.findAll(channelId, callType, startDate, endDate, roleType);
                }
            }
        } else {
            collect = tagCollectVirtualRespository.findOne(channelId, tagId, startDate, endDate);
        }

        List<TagCollectResponse> responses = new LinkedList<>();
        for (TagCollectVirtualEntity entity : collect) {
            responses.add(WebEntityUtils.toResponse(entity));
        }

        return responses;
    }

    public List<TagCollectResponse> findSubTop(HttpRestfulPageRequest<TagCollectRequest, TagCollectSort> request) {
        TagCollectRequest data = request.getData();

        Locale locale = RequestContextUtils.getLocale(request.getHttpRequest());
        AssertUtils.notNull(locale, ExceptionMessageEnum.SYSINTR_EXCEPTION);

        AssertUtils.isTrue(data.daterangeSize() == 2, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long channelId = data.getChannelId();
        AssertUtils.notNull(channelId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long[] tagIds = data.getTagIds();
        AssertUtils.notNull(tagIds, ExceptionMessageEnum.ILLEGAL_ARGUMENT);
        AssertUtils.isTrue(tagIds.length == 1, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long tagId = tagIds[0];
        AssertUtils.notNull(tagId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate startDate = data.getStartDate();
        AssertUtils.notNull(startDate, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate endDate = data.getEndDate();
        AssertUtils.notNull(endDate, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        int i = 1;
        Integer limit = data.getLimit();

        PageRequest pageRequest = request.getPageRequest();

        String callType = data.getCallType();
        String roleType = data.getRoleType();
        RequestContext<TagCollectRequest> context = request.getContext();
        ServerApplicationContext applicationContext = context.getParent();

        List<TagCollectVirtualEntity> collect = tagCollectVirtualRespository.findAll(channelId, tagId, startDate, endDate, pageRequest.getSort());
        List<TagCollectResponse> responses = new LinkedList<>();
        TagCollectVirtualEntity other = new TagCollectVirtualEntity();
        other.setFrequency(0);
        other.setSubFrequency(0);
        other.setTotleFrequency(0);
        other.setCallNum(0);
        other.setTagText(applicationContext.getMessage("tag.collect.other.total", locale));

        for (TagCollectVirtualEntity entity : collect) {
            if (i < limit) {
                responses.add(WebEntityUtils.toResponse(entity));
            } else {
                other.setCallDate(entity.getCallDate());
                other.setCallDay(entity.getCallDay());
                other.setCallYear(entity.getCallYear());
                other.setCallMonth(entity.getCallMonth());
                other.setCallWeek(entity.getCallWeek());
                other.setTotleFrequency(other.getTotleFrequency() + entity.getTotleFrequency());
                other.setSubFrequency(other.getSubFrequency() + entity.getSubFrequency());
                other.setFrequency(other.getFrequency() + entity.getFrequency());
                other.setCallNum(other.getCallNum() + entity.getCallNum());
                other.setParentId(entity.getParentId());
                other.setTagId(entity.getTagId());
            }
            i++;
        }
        if (other.getTotleFrequency() + other.getCallNum() > 0) {
            responses.add(WebEntityUtils.toResponse(other));
        }
        return responses;
    }

    public Page<TagCollectResponse> findAll(RestfulPageRequest<TagCollectRequest, TagCollectSort> request) {

        TagCollectRequest data = request.getData();
        AssertUtils.isTrue(data.daterangeSize() == 2, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate startDate = data.getStartDate();
        AssertUtils.notNull(startDate, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate endDate = data.getEndDate();
        AssertUtils.notNull(endDate, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long channelId = data.getChannelId();
        AssertUtils.notNull(channelId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        String dateType = data.getDateType();
        AssertUtils.notNull(dateType, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long[] tagIds = data.getTagIds();
        AssertUtils.isTrue(tagIds != null, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        //分页
        PageRequest pageable = request.getPageRequest();

        Page<TagCollectVirtualEntity> page = null;
        if (tagIds.length == 0) {
            if (dateType.equals("day")) {
                page = tagCollectVirtualRespository.findAllByDay(channelId, startDate, endDate, pageable);
            }
            if (dateType.equals("week")) {
                page = tagCollectVirtualRespository.findAllByWeek(channelId, startDate, endDate, pageable);
            }
            if (dateType.equals("month")) {
                page = tagCollectVirtualRespository.findAllByMonth(channelId, startDate, endDate, pageable);
            }
        } else {
            if (dateType.equals("day")) {
                page = tagCollectVirtualRespository.findAllByDayInTagId(channelId, startDate, endDate, tagIds, pageable);
            }
            if (dateType.equals("week")) {
                page = tagCollectVirtualRespository.findAllByWeekInTagId(channelId, startDate, endDate, tagIds, pageable);
            }
            if (dateType.equals("month")) {
                page = tagCollectVirtualRespository.findAllByMonthInTagId(channelId, startDate, endDate, tagIds, pageable);
            }
        }

        List<TagCollectVirtualEntity> content = page.getContent();
        List<TagCollectResponse> responses = new LinkedList<>();
        for (TagCollectVirtualEntity entity : content) {
            responses.add(WebEntityUtils.toResponse(entity));
        }

        return new PageImpl<TagCollectResponse>(responses, pageable, page.getTotalElements());
    }

    public Page<TagCollectResponse> findSub(RestfulPageRequest<TagCollectRequest, TagCollectSort> request) {

        TagCollectRequest data = request.getData();
        AssertUtils.isTrue(data.daterangeSize() == 2, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate startDate = data.getStartDate();
        AssertUtils.notNull(startDate, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        LocalDate endDate = data.getEndDate();
        AssertUtils.notNull(endDate, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long channelId = data.getChannelId();
        AssertUtils.notNull(channelId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        String dateType = data.getDateType();
        AssertUtils.notNull(dateType, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long parentId = data.getParentId();
        AssertUtils.notNull(parentId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        //分页
        PageRequest pageable = request.getPageRequest();

        Page<TagCollectVirtualEntity> page = null;
        if (dateType.equals("day")) {
            page = tagCollectVirtualRespository.findSubByDayAndParentId(channelId, startDate, endDate, parentId, pageable);
        }
        if (dateType.equals("week")) {
            page = tagCollectVirtualRespository.findSubByWeekAndParentId(channelId, startDate, endDate, parentId, pageable);
        }
        if (dateType.equals("month")) {
            page = tagCollectVirtualRespository.findSubByMonthAndParentId(channelId, startDate, endDate, parentId, pageable);
        }

        List<TagCollectVirtualEntity> content = page.getContent();
        List<TagCollectResponse> responses = new LinkedList<>();
        for (TagCollectVirtualEntity entity : content) {
            responses.add(WebEntityUtils.toResponse(entity));
        }

        return new PageImpl<TagCollectResponse>(responses, pageable, page.getTotalElements());
    }

}
