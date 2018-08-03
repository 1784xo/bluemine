package com.bluemine.domain.util;

import com.bluemine.common.RuleResponse;
import com.bluemine.common.TagResponse;
import com.bluemine.domain.entity.RuleEntity;
import com.bluemine.domain.entity.TagEntity;

import java.util.*;

/**
 * Created by hechao on 2018/6/29.
 */
public abstract class EntityUtils {


    public static Map<Long, TagResponse> toTagMap(List<TagEntity> tags, List<RuleEntity> rules) {
        Map<Long, TagResponse> map = new LinkedHashMap<>();
        TagResponse tagResponse;
        for (TagEntity tag : tags) {
            tagResponse = toResponse(tag);
            map.put(tagResponse.getTagId(), tagResponse);
        }

        for (RuleEntity rule : rules) {
            tagResponse = map.get(rule.getTagId());
            if (tagResponse != null) {
                tagResponse.addRule(toResponse(rule));
            }
        }

        return map;
    }

    public static List<TagResponse> toTagTree(List<TagEntity> tags, List<RuleEntity> rules) {
        HashMap<Long, TagResponse> temp = new HashMap<Long, TagResponse>();
        ArrayList<TagResponse> responses = new ArrayList<TagResponse>();

        TagResponse parent;
        TagResponse response;

        for (TagEntity tag : tags) {
            response = toResponse(tag);
            temp.put(response.getTagId(), response);
            if (response.getParentId() == 0) {
                responses.add(response);
            } else {
                parent = temp.get(response.getParentId());
                if (parent != null) {
                    parent.addChildren(response);
                }
            }
        }

        if (rules != null) {
            for (RuleEntity rule : rules) {
                response = temp.get(rule.getTagId());
                if (response != null) {
                    response.addRule(toResponse(rule));
                }
            }
        }

        return responses;
    }

    public static List<TagResponse> toTagTree(List<TagEntity> tags) {
        return toTagTree(tags, null);
    }

    public static TagResponse toResponse(TagEntity tag) {
        TagResponse response = new TagResponse();
        response.setActivated(tag.getActivated());
        response.setChannelId(tag.getChannelId());
        response.setParentId(tag.getParentId());
        response.setCustomizable(tag.getCustomizable());
        response.setTagCode(tag.getTagNo());
        response.setTagId(tag.getTagId());
        response.setTagText(tag.getTagText());
        return response;
    }

    public static RuleResponse toResponse(RuleEntity rule) {
        RuleResponse response = new RuleResponse();
        response.setRuleId(rule.getRuleId());
        response.setTagId(rule.getTagId());
        response.setChannelId(rule.getChannelId());
        response.setCallType(rule.getCallType());
        response.setPriorityNo(rule.getPriorityNo());
        response.setRoleType(rule.getRoleType());
        response.setRuleExps(rule.getRuleExps());
        return response;
    }
}
