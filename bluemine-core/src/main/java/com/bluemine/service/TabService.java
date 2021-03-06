package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.RestfulRequest;
import com.bluemine.common.TagRequest;
import com.bluemine.common.TagResponse;
import com.bluemine.context.RequestContext;
import com.bluemine.domain.entity.RuleEntity;
import com.bluemine.domain.entity.TagControlEntity;
import com.bluemine.domain.entity.TagEntity;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.repository.TagRepository;
import com.bluemine.repository.proxy.RepositoryProxy;
import com.bluemine.util.AssertUtils;
import com.bluemine.util.IdWorker;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.transaction.Transactional;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

/**
 * Created by hechao on 2018/6/28.
 */
@Service
public class TabService {
    @Inject
    private EntityService entityService;

    @Inject
    private TagRepository tagRepository;

    @Inject
    private RuleService ruleService;

    private static final Comparator TAG_DESC = new Comparator<TagEntity>() {
        @Override
        public int compare(TagEntity o1, TagEntity o2) {
            return o2.getTagNo().compareTo(o1.getTagNo());
        }
    };

    public Map<Long, TagResponse> findAllWithRule(long channelId) {
        List<TagEntity> tags = tagRepository.findAll(channelId);
        List<RuleEntity> rules = ruleService.findAll(channelId);

        Collections.sort(tags, TAG_DESC);

        return EntityUtils.mergeToMap(tags, rules);
    }

    public List<TagResponse> findTreeWithRule(long channelId) {
        List<TagEntity> tags;
        tags = tagRepository.findAll(channelId);
        List<RuleEntity> rules = ruleService.findAll(channelId);
        List<TagResponse> tagTree = EntityUtils.toTagTree(tags, rules);
        return tagTree;
    }

    public List<TagResponse> findTreeWithRule(RestfulRequest<TagRequest> request) {
        TagRequest data = request.getData();
        Long channelId = data.getChannelId();
        return findTreeWithRule(channelId);
    }

    public List<TagResponse> findAllSub(RestfulRequest<TagRequest> request) {
        TagRequest data = request.getData();
        Long channelId = data.getChannelId();
        Long parentId = data.getParentId();
        List<TagEntity> tags = tagRepository.findAllSub(channelId, parentId);
        List<TagResponse> responses = EntityUtils.toTagTree(tags);
        return responses;
    }

    @Transactional(rollbackOn = Exception.class)
    public TagResponse create(RestfulRequest<TagRequest> request) {
        TagRequest data = request.getData();

        String tagText = data.getTagText();
        Long parentId = data.getParentId();
        Long channelId = data.getChannelId();

        RequestContext<TagRequest> context = request.getContext();
        IdWorker idWorker = context.getIdWorker();
        RepositoryProxy repository = context.getRepository();

        TagControlEntity tagControl = entityService.findTagControlWithCache(channelId, repository);
        Integer tagNo = tagControl.getNextTagNo();

        tagControl.nextTagNo(tagNo + 1).markModified();

        TagEntity tagEntity = new TagEntity()
                .tagNo(tagNo)
                .tagId(idWorker.nextId())
                .tagText(tagText)
                .activated(true)
                .channelId(channelId)
                .parentId(parentId)
                .customizable(true);

        TagResponse response = EntityUtils.toResponse(tagEntity);

        repository.commit(tagEntity);
        return response;
    }

    @Transactional(rollbackOn = Exception.class)
    public TagResponse update(RestfulRequest<TagRequest> request) {
        TagRequest data = request.getData();
        Long tagId = data.getTagId();
        Long channelId = data.getChannelId();
        Long parentId = data.getParentId();
        Boolean activated = data.getActivated();
        String tagText = data.getTagText();

        TagEntity tagEntity = tagRepository.findOneByChannelIdAndTagId(channelId, tagId);
        AssertUtils.notNull(tagEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "tag", channelId+", "+tagId);

        if (tagText != null) {
            tagEntity.setTagText(tagText);
        }

        if (activated != null) {
            tagEntity.setActivated(activated);
        }

        if (parentId != null) {
            tagEntity.setParentId(parentId);
        }

        tagRepository.save(tagEntity);

        TagResponse response = EntityUtils.toResponse(tagEntity);
        return response;
    }


}
