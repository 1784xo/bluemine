package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.HttpRestfulRequest;
import com.bluemine.common.RuleRequest;
import com.bluemine.common.RuleResponse;
import com.bluemine.context.RequestContext;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.CodeProfileEntity;
import com.bluemine.domain.entity.RuleEntity;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.repository.ChannelRepository;
import com.bluemine.repository.RuleRepository;
import com.bluemine.repository.proxy.RepositoryProxy;
import com.bluemine.struct.CodeEnum;
import com.bluemine.util.AssertUtils;
import com.bluemine.util.IdWorker;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by hechao on 2018/6/29.
 */
@Service
public class RuleService {

    @Inject
    private EntityService entityService;

    @Inject
    private ChannelRepository channelRepository;

    @Inject
    private RuleRepository ruleRepository;

    public List<RuleEntity> findAll(Long channelId) {
        List<RuleEntity> rules = ruleRepository.findAllByChannelId(channelId);
        return rules;
    }

    @Transactional(rollbackOn = Exception.class)
    public RuleResponse create(HttpRestfulRequest<RuleRequest> request) {
        RuleRequest data = request.getData();
        RequestContext<RuleRequest> context = request.getContext();
        IdWorker idWorker = context.getIdWorker();
        RepositoryProxy repository = context.getRepository();

        Long channelId = data.getChannelId();
        Long tagId = data.getTagId();
        String callType = data.getCallType();
        String roleType = data.getRoleType();
        Integer priorityNo = data.getPriorityNo();
        String ruleExps = data.getRuleExps();

        ChannelEntity channelEntity = channelRepository.findOne(data.getChannelId());
        AssertUtils.notNull(channelEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        CodeProfileEntity callTypeProfile = entityService.findCodeProfileWithCache(channelId, CodeEnum.CALT, callType, repository);
        AssertUtils.notNull(callTypeProfile, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        CodeProfileEntity roleTypeProfile = entityService.findCodeProfileWithCache(channelId, CodeEnum.ROLE, roleType, repository);
        AssertUtils.notNull(roleTypeProfile, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        RuleEntity ruleEntity = new RuleEntity()
                .ruleId(idWorker.nextId())
                .tagId(tagId)
                .channelId(channelId)
                .callType(callType)
                .roleType(roleType)
                .priorityNo(priorityNo)
                .ruleExps(ruleExps);

        ruleEntity.partitionKey(channelEntity.getPartitionKey());

        repository.commit(ruleEntity);

        RuleResponse response = EntityUtils.toResponse(ruleEntity);

        return response;
    }

    @Transactional(rollbackOn = Exception.class)
    public int delete(HttpRestfulRequest<RuleRequest> request) {
        RuleRequest data = request.getData();
        Long channelId = data.getChannelId();
        Long ruleId = data.getRuleId();
        return ruleRepository.delete(channelId, ruleId);
    }

    @Transactional(rollbackOn = Exception.class)
    public RuleResponse update(HttpRestfulRequest<RuleRequest> request) {
        RuleRequest data = request.getData();
        Long ruleId = data.getRuleId();
        Long channelId = data.getChannelId();
        RuleEntity ruleEntity = ruleRepository.findOne(ruleId);
        AssertUtils.notNull(ruleEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT);
        AssertUtils.isTrue(ruleEntity.getChannelId().compareTo(channelId) == 0, ExceptionMessageEnum.DB_UNAUTHORIZED_UNMATCH);

        String callType = data.getCallType();
        String roleType = data.getRoleType();
        String ruleExps = data.getRuleExps();
        ruleEntity.setCallType(callType);
        ruleEntity.setRoleType(roleType);
        ruleEntity.setRuleExps(ruleExps);
        ruleRepository.save(ruleEntity);
        RuleResponse response = EntityUtils.toResponse(ruleEntity);
        return response;
    }
}
