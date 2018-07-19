package com.bluemine.batch.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.batch.test.TestCollider;
import com.bluemine.common.RuleResponse;
import com.bluemine.common.TagResponse;
import com.bluemine.context.SessionContext;
import com.bluemine.domain.Call;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.SeatEntity;
import com.bluemine.domain.entity.TabCollectEntity;
import com.bluemine.domain.entity.TabCollectId;
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

    public Collection<TabCollectEntity> collect(Call call, SessionContext context) {

        ChannelEntity channel = call.getChannel();
        AssertUtils.notNull(channel, ExceptionMessageEnum.NULL_EXCEPTION);

        Long channelId = channel.getChannelId();
        String channelNo = channel.getChannelNo();

        String callNo = call.getCallNo();
        AssertUtils.notNull(callNo, ExceptionMessageEnum.NULL_EXCEPTION);

        LocalDate callDate = call.getCallDate();
        AssertUtils.notNull(callDate, ExceptionMessageEnum.NULL_EXCEPTION);

        Set<TabCollectEntity> collects = new HashSet<>();
        Map<Long, TagResponse> tagMap = tabService.findAllWithRule(channelId);
        Collection<TagResponse> values = tagMap.values();

        int frequency;
        Stack<TabCollectEntity> venation;
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

    private static Stack<TabCollectEntity> vein(TagResponse tag, Map<Long, TagResponse> tags, Call call
            , SessionContext context) {
        if (!tag.getActivatedFlag()) {
            return null;
        }
        Map<Long, TabCollectEntity> venation = new LinkedHashMap<>();
        long tagId = tag.getTagId();
        TabCollectEntity tabCollect = createTabCollect(tag, call, context);
        venation.put(tagId, tabCollect);
        Long parentId = tag.getParentId();
        TabCollectEntity parentCollect;
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

        Stack<TabCollectEntity> stack = new Stack();
        stack.addAll(venation.values());
        return stack;
    }

    private static List<TabCollectEntity> collect(TagResponse tag, Stack<TabCollectEntity> venation, RuleResponse rule, int frequency) {
        TabCollectEntity tabCollect;
        List<TabCollectEntity> collects = new LinkedList<>();
        while (!venation.empty()) {
            tabCollect = venation.pop();
            TabCollectId id = tabCollect.getId();
            id.ruleId(rule.getRuleId());
            if (id.getTagId().compareTo(tag.getTagId()) == 0) {
                tabCollect.frequency(frequency);
            } else {
                tabCollect.subTotal(tabCollect.getSubTotal() + 1)
                        .subFrequency(tabCollect.getSubFrequency() + frequency);
            }
            collects.add(tabCollect);
        }
        return collects;
    }


    private static TabCollectEntity createTabCollect(TagResponse tag, Call call, SessionContext context) {
        SeatEntity seat = call.getSeat();
        ChannelEntity channel = call.getChannel();
        String callNo = call.getCallNo();
        TabCollectId id = new TabCollectId()
                .callNo(callNo)
                .tagId(tag.getTagId())
                .ruleId(0L);
        TabCollectEntity entity = new TabCollectEntity()
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
