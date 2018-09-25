package com.bluemine.domain.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;



import com.bluemine.common.QualityGroupResponse;
import com.bluemine.common.QualityItemResponse;
import com.bluemine.common.QualityRowResponse;
import com.bluemine.common.RuleResponse;
import com.bluemine.common.TagResponse;
import com.bluemine.domain.entity.QualityGroupEntity;
import com.bluemine.domain.entity.QualityItemEntity;
import com.bluemine.domain.entity.QualityRowEntity;
import com.bluemine.domain.entity.RuleEntity;
import com.bluemine.domain.entity.TagEntity;

import net.sf.json.JSONArray;

/**
 * Created by hechao on 2018/6/29.
 */
public abstract class EntityUtils {


    public static Map<Long, TagResponse> mergeToMap(List<TagEntity> tags, List<RuleEntity> rules) {
        Map<Long, TagResponse> map = new LinkedHashMap<>();
        TagResponse tagResponse;
        for (TagEntity tag : tags) {
            tagResponse = toResponse(tag);
            map.put(tagResponse.getId(), tagResponse);
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
            temp.put(response.getId(), response);
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

    public static List<QualityRowResponse> toAddItem(List<QualityRowEntity> qres, List<QualityItemEntity> items) {
        ArrayList<QualityRowResponse> responses = new ArrayList<QualityRowResponse>();
        HashMap<Long, QualityRowResponse> temp = new HashMap<Long, QualityRowResponse>();

        QualityRowResponse response;
        if(qres!=null){
	        for (QualityRowEntity qre : qres) {
	            response = toResponse(qre);
	            temp.put(response.getId(), response);
	            responses.add(response);
	        }
        }
        if (items != null) {
            for (QualityItemEntity item : items) {
                response = temp.get(item.getRowId());
                if (response != null) {
                    response.addItems(toResponse(item));
                }
            }
        }

        return responses;
    }
    
    public static List<QualityGroupResponse> toAddRow(List<QualityGroupEntity> qres, List<QualityRowEntity> items) {
        ArrayList<QualityGroupResponse> responses = new ArrayList<QualityGroupResponse>();
        HashMap<Long, QualityGroupResponse> temp = new HashMap<Long, QualityGroupResponse>();

        QualityGroupResponse response;
        if(qres!=null){
	        for (QualityGroupEntity qre : qres) {
	            response = toResponse(qre);
	            temp.put(response.getId(), response);
	            responses.add(response);
	        }
        }
        if (items != null) {
            for (QualityRowEntity item : items) {
                response = temp.get(item.getGroupId());
                if (response != null) {
                    response.addRows(toResponse(item));
                }
            }
        }

        return responses;
    }
    
    public static TagResponse toResponse(TagEntity tag) {
        TagResponse response = new TagResponse();
        response.setActivated(tag.getActivated());
        response.setChannelId(tag.getChannelId());
        response.setParentId(tag.getParentId());
        response.setCustomizable(tag.getCustomizable());
        response.setTagNo(tag.getTagNo());
        response.setId(tag.getTagId());
        response.setText(tag.getTagText());
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

    public static QualityGroupResponse toResponse(QualityGroupEntity qua) {
    	QualityGroupResponse response = new QualityGroupResponse();
        response.setActivated(qua.getActivated());
        response.setId(qua.getGroupId());
        response.setChannelId(qua.getChannelId());
        response.setName(qua.getGroupName());
        response.setText(qua.getDescText());
        return response;
    }

    public static QualityRowResponse toResponse(QualityRowEntity qua) {
    	QualityRowResponse response = new QualityRowResponse();
        response.setActivated(qua.getActivated());
        response.setId(qua.getRowId());
        response.setGroupId(qua.getGroupId());
        response.setChannelId(qua.getChannelId());
        response.setName(qua.getRowName());
        response.setRowType(qua.getRowType());
        response.setText(qua.getDescText());
        response.setWeight(qua.getWeight());
        response.setPoint(qua.getPoint());
        return response;
    }
    
    public static QualityItemResponse toResponse(QualityItemEntity qua) {
    	QualityItemResponse response = new QualityItemResponse();
        response.setActivated(qua.getActivated());
        response.setId(qua.getItemId());
        response.setRowId(qua.getRowId());
        response.setChannelId(qua.getChannelId());
        response.setText(qua.getDescText());
        response.setLogicrelation(qua!=null?qua.getLogicrelation():0);
        response.setLogicif(qua!=null?qua.getLogicif():0);      
        response.setLogicsort(qua!=null?qua.getLogicsort():0);
        response.setLogicunit(qua!=null?qua.getLogicunit():0);
        response.setLogicvalue(qua!=null?qua.getLogicvalue():"");
        return response;
    }
    
	public static List<QualityGroupResponse> toResponse(List<QualityGroupEntity> qua) {
		ArrayList<QualityGroupResponse> responses = new ArrayList<QualityGroupResponse>();
		 	for (QualityGroupEntity quas : qua) {
	             responses.add(toResponse(quas));           
	        }
	    return responses;
	}

	public static List<QualityRowResponse> toRowResponse(List<QualityRowEntity> qua) {
		ArrayList<QualityRowResponse> responses = new ArrayList<QualityRowResponse>();
		 	for (QualityRowEntity quas : qua) {
	             responses.add(toResponse(quas));           
	        }
	    return responses;
	}
	
	public static List<QualityItemResponse> toItemResponse(List<QualityItemEntity> qua) {
		ArrayList<QualityItemResponse> responses = new ArrayList<QualityItemResponse>();
		 	for (QualityItemEntity quas : qua) {
	             responses.add(toResponse(quas));           
	        }
	    return responses;
	}
	
	/**
     * json 转 List<T>
     */
    public static <T> List<T> jsonToList(String jsonString, Class<T> clazz) {
    	@SuppressWarnings("rawtypes")
		List list = JSONArray.toList(JSONArray.fromObject(jsonString),clazz);
        return list;
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
//            response.setId(Long.valueOf(String.valueOf(tagCells[2])));
//            response.setText(String.valueOf(tagCells[3]));
//            response.setCallNum(Long.valueOf(String.valueOf(tagCells[4])));
//
//            for (TagEntity tg : listTag) {
//                if (Long.valueOf(String.valueOf(tagCells[2])).equals(tg.getId())) {
//                    response.setText(tg.getText());
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
//            response.setId(Long.valueOf(String.valueOf(tagCells[1])));
//            response.setText(String.valueOf(tagCells[2]));
//            response.setCallNum(Long.valueOf(String.valueOf(tagCells[3])));
//
//            if (String.valueOf(tagCells[1]).equals("0")) {
//                response.setText("其他");
//            } else {
//                for (TagEntity tg : listTag) {
//                    if (Long.valueOf(String.valueOf(tagCells[1])).equals(tg.getId())) {
//                        response.setText(tg.getText());
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
//                tagIds.add(tag.getId());
//            } else {
//                if (tagId.equals(tag.getParentId())) {
//                    tagIds.add(tag.getId());
//                    for (TagEntity cTag : allTags) {
//                        if (tag.getId().equals(cTag.getParentId())) {
//                            tagIds.add(cTag.getId());
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
//                tagIds.add(tag.getId());
//            }
//        }
//        return tagIds;
//    }
//
//    //按日期获取tagIds(标签多选后作废)
//    public static List<Long> getTagCircle(List<Long> tagIds, Long tagId, List<TagEntity> allTags) {
//        for (TagEntity tag : allTags) {
//            if (tagId == 0) {
//                if (tag.getParentId() != 0) tagIds.add(tag.getId());
//            } else {
//                if (tagId.equals(tag.getParentId())) {
//                    tagIds.add(tag.getId());
//                    getTagCircle(tagIds, tag.getId(), allTags);
//                }
//            }
//        }
//        return tagIds;
//    }

}
