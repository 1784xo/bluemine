package com.bluemine.service;

import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.DescriptionEntity;
import com.bluemine.repository.ChannelRepository;
import org.apache.commons.lang3.StringUtils;

import javax.inject.Inject;

/**
 * Created by hechao on 2018/9/25.
 */
public class BaseService {

    @Inject
    private ChannelRepository channelRepository;

    public ChannelEntity findOneChannel(String channelNo){
        ChannelEntity channelEntity = channelRepository.findOneByChannelNo(channelNo);
        return channelEntity;
    }

    public ChannelEntity findOneChannel(long channelId){
        return channelRepository.findOne(channelId);
    }
}
