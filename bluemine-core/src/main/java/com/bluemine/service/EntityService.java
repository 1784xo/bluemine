package com.bluemine.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bluemine.domain.entity.CodeProfileEntity;
import com.bluemine.domain.entity.CodeProfileId;
import com.bluemine.domain.entity.DeptControlEntity;
import com.bluemine.domain.entity.TagControlEntity;
import com.bluemine.repository.CodeProfileRepository;
import com.bluemine.repository.DeptControlRepository;
import com.bluemine.repository.TagControlRepository;
import com.bluemine.repository.proxy.RepositoryProxy;
import com.bluemine.struct.CodeEnum;

/**
 * Created by hechao on 2018/6/28.
 */
@Service
public class EntityService {
    @Inject
    private TagControlRepository tagControlRepository;
    
    @Inject
    private DeptControlRepository deptControlRepository;

    @Inject
    private CodeProfileRepository codeProfileRepository;


    public TagControlEntity findTagControlWithCache(long channelId, RepositoryProxy repositoryProxy) {
        return tagControlRepository.findOne(channelId);
    }
    
    public DeptControlEntity findDeptControlWithCache(long channelId, RepositoryProxy repositoryProxy) {
        return deptControlRepository.findOne(channelId);
    }

    public CodeProfileEntity findCodeProfileWithCache(long channelId, CodeEnum codeType, String codeValue, RepositoryProxy repositoryProxy) {
        CodeProfileId id = new CodeProfileId()
                .channelId(channelId)
                .codeType(codeType.name())
                .codeValue(codeValue);
        return codeProfileRepository.findOne(id);
    }
}
