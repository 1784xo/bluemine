package com.bluemine.domain.util;

import com.bluemine.common.*;
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
        response.setTagNo(tag.getTagNo());
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


//    public static List<TagCollectResponse> toDateCollect(List<TagCollectEntity> tags, List<TagEntity> listTag) {
//
//        List<TagCollectResponse> responses = new ArrayList<>();
//        for (Object tag : tags) {
//            TagCollectResponse response = new TagCollectResponse();
//
//            Object[] tagCells = (Object[]) tag;
//            response.setCallDate(String.valueOf(tagCells[0]));
//            response.setFrequency(Integer.valueOf(String.valueOf(tagCells[1])));
//            response.setTagId(Long.valueOf(String.valueOf(tagCells[2])));
//            response.setTagText(String.valueOf(tagCells[3]));
//            response.setCallNum(Long.valueOf(String.valueOf(tagCells[4])));
//
//            for (TagEntity tg : listTag) {
//                if (Long.valueOf(String.valueOf(tagCells[2])).equals(tg.getTagId())) {
//                    response.setTagText(tg.getTagText());
//                    break;
//                }
//            }
//
//            responses.add(response);
//        }
//        return responses;
//    }
//
//    public static List<TagCollectResponse> toTagCollect(List<TagCollectEntity> tags, List<TagEntity> listTag) {
//
//        List<TagCollectResponse> responses = new ArrayList<>();
//        for (Object tag : tags) {
//            TagCollectResponse response = new TagCollectResponse();
//
//            Object[] tagCells = (Object[]) tag;
//            response.setCallDate(String.valueOf(tagCells[0]));
//            response.setFrequency(Integer.valueOf(String.valueOf(tagCells[1])));
//            response.setCallNum(Long.valueOf(String.valueOf(tagCells[2])));
//
//            responses.add(response);
//        }
//        return responses;
//    }
//
//    public static List<TagCollectResponse> toSubTagCollect(List<TagCollectEntity> tags, List<TagEntity> listTag) {
//
//        List<TagCollectResponse> responses = new ArrayList<>();
//        for (Object tag : tags) {
//            TagCollectResponse response = new TagCollectResponse();
//
//            Object[] tagCells = (Object[]) tag;
//            response.setFrequency(Integer.valueOf(String.valueOf(tagCells[0])));
//            response.setTagId(Long.valueOf(String.valueOf(tagCells[1])));
//            response.setTagText(String.valueOf(tagCells[2]));
//            response.setCallNum(Long.valueOf(String.valueOf(tagCells[3])));
//
//            if (String.valueOf(tagCells[1]).equals("0")) {
//                response.setTagText("其他");
//            } else {
//                for (TagEntity tg : listTag) {
//                    if (Long.valueOf(String.valueOf(tagCells[1])).equals(tg.getTagId())) {
//                        response.setTagText(tg.getTagText());
//                        break;
//                    }
//                }
//            }
//
//            responses.add(response);
//        }
//        return responses;
//    }
//
//    //获取子标签tagIds
//    public static List<Long> getTagIdsByParentIdbak(Long tagId, List<TagEntity> allTags) {
//        List<Long> tagIds = new ArrayList<>();
//        for (TagEntity tag : allTags) {
//            if (tagId == 0) {
//                //if (tag.getParentId() != 0) tagIds.add(tag.getTagIds());
//                tagIds.add(tag.getTagId());
//            } else {
//                if (tagId.equals(tag.getParentId())) {
//                    tagIds.add(tag.getTagId());
//                    for (TagEntity cTag : allTags) {
//                        if (tag.getTagId().equals(cTag.getParentId())) {
//                            tagIds.add(cTag.getTagId());
//                        }
//                    }
//                }
//            }
//        }
//        return tagIds;
//    }
//
//    //获取子标签tagIds
//    public static List<Long> getTagIdsByParentId(Long tagId, List<TagEntity> allTags) {
//        List<Long> tagIds = new ArrayList<>();
//        for (TagEntity tag : allTags) {
//            if (tagId.equals(tag.getParentId())) {
//                tagIds.add(tag.getTagId());
//            }
//        }
//        return tagIds;
//    }
//
//    //按日期获取tagIds(标签多选后作废)
//    public static List<Long> getTagCircle(List<Long> tagIds, Long tagId, List<TagEntity> allTags) {
//        for (TagEntity tag : allTags) {
//            if (tagId == 0) {
//                if (tag.getParentId() != 0) tagIds.add(tag.getTagId());
//            } else {
//                if (tagId.equals(tag.getParentId())) {
//                    tagIds.add(tag.getTagId());
//                    getTagCircle(tagIds, tag.getTagId(), allTags);
//                }
//            }
//        }
//        return tagIds;
//    }

}
