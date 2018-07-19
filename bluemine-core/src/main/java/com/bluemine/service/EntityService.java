package com.bluemine.service;

import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.CodeProfileEntity;
import com.bluemine.domain.entity.CodeProfileId;
import com.bluemine.domain.entity.TagControlEntity;
import com.bluemine.repository.CodeProfileRepository;
import com.bluemine.repository.TagControlRepository;
import com.bluemine.repository.proxy.RepositoryProxy;
import com.bluemine.struct.CodeEnum;
import org.aspectj.apache.bcel.classfile.Code;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

/**
 * Created by hechao on 2018/6/28.
 */
@Service
public class EntityService {
    @Inject
    private TagControlRepository tagControlRepository;

    @Inject
    private CodeProfileRepository codeProfileRepository;


    public TagControlEntity findTagControlWithCache(long channelId, RepositoryProxy repositoryProxy) {
        return tagControlRepository.findOne(channelId);
    }

    public CodeProfileEntity findCodeProfileWithCache(long channelId, CodeEnum codeType, String codeValue, RepositoryProxy repositoryProxy){
        CodeProfileId id = new CodeProfileId()
                .channelId(channelId)
                .codeType(codeType.name())
                .codeValue(codeValue);
        return codeProfileRepository.findOne(id);
    }
}
