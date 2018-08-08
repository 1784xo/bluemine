package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.*;
import com.bluemine.domain.entity.TagCollectEntity;
import com.bluemine.domain.entity.TagEntity;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.repository.TabCollectRepository;
import com.bluemine.repository.TagRepository;
import com.bluemine.util.AssertUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.transaction.Transactional;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjuster;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hechao on 2018/6/28.
 */
@Service
public class TabCollectService {

    public static final Integer TOPMAX = 1;

    @Inject
    private TagRepository tagRepository;

    @Inject
    private TabCollectRepository tagCollectRepository;

    @Transactional(rollbackOn = Exception.class)
    public List<TagCollectResponse> findByDate(RestfulRequest<TagCollectRequest> request) {

        TagCollectRequest data = request.getData();
        Long channelId = data.getChannelId();
        Long tagId = (data.getTagIds() == null ? 0 : data.getTagIds());

        List<TagEntity> allTags = tagRepository.findAll(channelId);
        List<Long> tagIds = new ArrayList<>();
        tagIds = EntityUtils.getTagCircle(tagIds, tagId, allTags);

        String sType = (data.getsType() == null ? "day" : data.getsType());
        String dateStr = data.getDateStr();
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate callDate = null, start = null, end = null;
        switch (sType) {
            case "day":
                callDate = LocalDate.parse(dateStr, df);
                break;
            case "week":
                LocalDate inputDate = LocalDate.parse(dateStr);
                TemporalAdjuster FIRST_OF_WEEK = TemporalAdjusters.ofDateAdjuster(localDate -> localDate.minusDays(localDate.getDayOfWeek().getValue() - DayOfWeek.MONDAY.getValue()));
                start = inputDate.with(FIRST_OF_WEEK);
                TemporalAdjuster LAST_OF_WEEK = TemporalAdjusters.ofDateAdjuster(localDate -> localDate.plusDays(DayOfWeek.SUNDAY.getValue() - localDate.getDayOfWeek().getValue()));
                end = inputDate.with(LAST_OF_WEEK);
                break;
            case "month":
                start = LocalDate.parse(dateStr + "-01", df);
                end = start.with(TemporalAdjusters.lastDayOfMonth());
                break;
        }

        //Sort sort = new Sort(Sort.Direction.DESC, "id.tagId");
        Pageable pageable = new PageRequest(data.getPage(), data.getSize());

        List<TagCollectEntity> listCollect = new ArrayList<>();

        if (tagIds.size() > 0) {
            if (sType.equals("day")) {
                listCollect = tagCollectRepository.findByDateAndTagId(channelId, callDate, pageable, tagIds);
            } else {
                listCollect = tagCollectRepository.findByDateAndTagIdIsBetween(channelId, start, end, pageable, tagIds);
            }
        }

        AssertUtils.notNull(allTags, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        List<TagCollectResponse> response = EntityUtils.toDateCollect(listCollect, allTags);
        return response;
    }

    @Transactional(rollbackOn = Exception.class)
    public List<ParentTagCollectResponse> findByTag(RestfulRequest<TagCollectRequest> request) {

        TagCollectRequest data = request.getData();
        Long channelId = data.getChannelId();
        Long tagId = (data.getTagIds() == null ? 0 : data.getTagIds());
        LocalDate form = data.getDaterangeForm();
        LocalDate to = data.getDaterangeTo();

        List<TagEntity> allTags = tagRepository.findAll(channelId);
        List<TagCollectEntity> listCollect = null;
        if (tagId == 0) {
            listCollect = tagCollectRepository.findAll(channelId, form, to);
        } else {
            listCollect = tagCollectRepository.findOne(channelId, tagId, form, to);
        }
        AssertUtils.notNull(allTags, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        List<ParentTagCollectResponse> response = EntityUtils.toParentTagCollect(listCollect, allTags);
        return response;
    }

    @Transactional(rollbackOn = Exception.class)
    public List<SubTagCollectResponse> findBySubTag(RestfulRequest<TagCollectRequest> request) {

        TagCollectRequest data = request.getData();
        Long channelId = data.getChannelId();
        Long tagId = (data.getTagIds() == null ? 0 : data.getTagIds());
        LocalDate end = data.getCallDate();
        LocalDate start = end.plusDays(-29);
        Integer size = data.getSize();
        String subType = data.getSubType();

        List<TagEntity> allTags = tagRepository.findAll(channelId);
        List<Long> tagIds = EntityUtils.getTagIdsByParentId(tagId, allTags);
        if (tagIds.size() == 0) {
            return null;
        }
        List<TagCollectEntity> listCollect;
        if (subType.equals("F")) {
            listCollect = tagCollectRepository.findBySubFTags(channelId, tagIds, start, end);
        } else {
            listCollect = tagCollectRepository.findBySubCTags(channelId, tagIds, start, end);
        }

        //AssertUtils.notNull(allTags, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        List<SubTagCollectResponse> response = EntityUtils.toSubTagCollect(listCollect, allTags);
        List<SubTagCollectResponse> temp = new ArrayList<>();
        temp.addAll(response);
        List<SubTagCollectResponse> responseOther = new ArrayList<>();
        size = 10;
        if (response.size() > size) {
            int n = 0;
            Integer otherNum = 0;
            for (SubTagCollectResponse tag : temp) {
                if (n + 1 > size) {
                    if (subType.equals("F")) {
                        otherNum += tag.getFrequency();
                    } else {
                        otherNum += tag.getCallNum();
                    }
                    response.remove(n);
                    n--;
                }
                n++;
            }

            SubTagCollectResponse subTagCollectResponse = new SubTagCollectResponse();
            subTagCollectResponse.setTagId(0L);
            subTagCollectResponse.setTagText("其他");
            if (subType.equals("F")) {
                subTagCollectResponse.setFrequency(otherNum);
            } else {
                subTagCollectResponse.setCallNum(otherNum);
            }
            responseOther.add(subTagCollectResponse);

            response.addAll(responseOther);
        }

        return response;
    }

}
