package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.ServerConstants;
import com.bluemine.common.TagResponse;
import com.bluemine.context.SessionContext;
import com.bluemine.domain.entity.CallSyncTriggerEntity;
import com.bluemine.domain.entity.CallSyncTriggerId;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.TagCollectEntity;
import com.bluemine.job.CallItem;
import com.bluemine.job.tag.TagCollectJobConfiguration;
import com.bluemine.repository.CallSyncTriggerRepository;
import com.bluemine.struct.CallTriggerStatus;
import com.bluemine.util.AssertUtils;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.cache.Cache;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;

/**
 * Created by hechao on 2018/10/8.
 */
@Service
public class TagCollectService extends BaseService {

    @Inject
    private TabService tabService;

    public void collect(CallItem callItem, SessionContext context) {
        ChannelEntity channel = callItem.getChannel();
        long channelId = channel.getChannelId();

        Set<TagCollectEntity> collects = new HashSet<>();
        Map<Long, TagResponse> tagMap = tabService.findAllWithRule(channelId);
        Collection<TagResponse> values = tagMap.values();
    }
}
