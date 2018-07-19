package com.bluemine.batch.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.batch.test.TestCollider;
import com.bluemine.common.RuleResponse;
import com.bluemine.common.TagResponse;
import com.bluemine.context.SessionContext;
import com.bluemine.domain.Call;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.SeatEntity;
import com.bluemine.domain.entity.TagCollectEntity;
import com.bluemine.domain.entity.TagCollectId;
import com.bluemine.service.TabService;
import com.bluemine.util.AssertUtils;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.time.LocalDate;
import java.util.*;

/**
 * Created by hechao on 2018/7/3.
 */
@Service
public class CallCollectService {

    @Inject
    private TabService tabService;

    public Collection<TagCollectEntity> collect(Call call, SessionContext context) {

        ChannelEntity channel = call.getChannel();
        AssertUtils.notNull(channel, ExceptionMessageEnum.NULL_EXCEPTION);

        Long channelId = channel.getChannelId();
        String channelNo = channel.getChannelNo();

        String callNo = call.getCallNo();
        AssertUtils.notNull(callNo, ExceptionMessageEnum.NULL_EXCEPTION);

        LocalDate callDate = call.getCallDate();
        AssertUtils.notNull(callDate, ExceptionMessageEnum.NULL_EXCEPTION);

        Set<TagCollectEntity> collects = new HashSet<>();
        Map<Long, TagResponse> tagMap = tabService.findAllWithRule(channelId);
        Collection<TagResponse> values = tagMap.values();

        int frequency;
        Stack<TagCollectEntity> venation;
        List<RuleResponse> rules;
        List<String> messages;
        for (TagResponse tag : values) {
            venation = vein(tag, tagMap, call, context);
            if ((venation != null) && (venation.size() > 0)) {
                rules = tag.getRules();
                for (RuleResponse rule : rules) {
                    messages = TestCollider.collide(channelNo, callNo, rule.getCallType(), rule.getRoleType(), rule.getRuleExps());
                    frequency = messages.size();
                    if (frequency > 0) {
                        collects.addAll(collect(tag, venation, rule, frequency));
                        continue;
                    }
                }
            }
        }
        return collects;
    }

    private static Stack<TagCollectEntity> vein(TagResponse tag, Map<Long, TagResponse> tags, Call call
            , SessionContext context) {
        if (!tag.getActivatedFlag()) {
            return null;
        }
        Map<Long, TagCollectEntity> venation = new LinkedHashMap<>();
        long tagId = tag.getTagId();
        TagCollectEntity tagCollect = createTabCollect(tag, call, context);
        venation.put(tagId, tagCollect);
        Long parentId = tag.getParentId();
        TagCollectEntity parentCollect;
        TagResponse parentTag;
        while ((parentId != null) && (parentId.compareTo(0L) > 0)) {
            parentTag = tags.get(parentId);
            if ((parentTag == null) || (!parentTag.getActivatedFlag())) {
                venation.clear();
                return null;
            }
            parentCollect = createTabCollect(parentTag, call, context);
            venation.put(parentId, parentCollect);
            parentId = parentTag.getParentId();
        }

        Stack<TagCollectEntity> stack = new Stack();
        stack.addAll(venation.values());
        return stack;
    }

    private static List<TagCollectEntity> collect(TagResponse tag, Stack<TagCollectEntity> venation, RuleResponse rule, int frequency) {
        TagCollectEntity tagCollect;
        List<TagCollectEntity> collects = new LinkedList<>();
        while (!venation.empty()) {
            tagCollect = venation.pop();
            TagCollectId id = tagCollect.getId();
            id.ruleId(rule.getRuleId());
            if (id.getTagId().compareTo(tag.getTagId()) == 0) {
                tagCollect.frequency(frequency);
            } else {
                tagCollect.subTotal(tagCollect.getSubTotal() + 1)
                        .subFrequency(tagCollect.getSubFrequency() + frequency);
            }
            collects.add(tagCollect);
        }
        return collects;
    }

    private static TagCollectEntity createTabCollect(TagResponse tag, Call call, SessionContext context) {
        SeatEntity seat = call.getSeat();
        ChannelEntity channel = call.getChannel();
        String callNo = call.getCallNo();
        TagCollectId id = new TagCollectId()
                .callNo(callNo)
                .tagId(tag.getTagId())
                .ruleId(0L);
        TagCollectEntity entity = new TagCollectEntity()
                .id(id)
                .channelId(channel.getChannelId())
                .callDate(call.getCallDate())
                .seatId(seat.getSeatId())
                .frequency(0)
                .subFrequency(0)
                .subTotal(0);
        entity.setPartitionKey(channel.getPartitionKey());
        return entity;
    }

}
