package com.bluemine.service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.CallSyncRequest;
import com.bluemine.common.RestfulRequest;
import com.bluemine.domain.entity.CallSyncTriggerEntity;
import com.bluemine.domain.entity.CallSyncTriggerId;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.ftp.FTPClientFactory;
import com.bluemine.repository.CallSyncTriggerRepository;
import com.bluemine.struct.CallTriggerStatus;
import com.bluemine.util.AssertUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Created by hechao on 2018/9/25.
 */
@Service
public class CallSyncService extends BaseService {

    private static final Logger log = LoggerFactory.getLogger(CallSyncService.class);

    @Inject
    private CallSyncTriggerRepository callSyncTriggerRepository;

    @Inject
    private FTPClientFactory callSyncFactory;

    public CallSyncTriggerEntity writeTrigger(RestfulRequest<? extends CallSyncRequest> request) {
        CallSyncRequest data = request.getData();
        LocalDateTime requestTime = request.getGeneric().getRequestTime();

        LocalDate callDate = data.getCallDate();
        AssertUtils.notNull(callDate, ExceptionMessageEnum.HTTP_REQUEST_EXCEPTION);

        String resourcePath = data.getResourcePath();
        AssertUtils.notNull(resourcePath, ExceptionMessageEnum.HTTP_REQUEST_EXCEPTION);

        String channelNo = data.getChannelNo();
        AssertUtils.notNull(channelNo, ExceptionMessageEnum.HTTP_REQUEST_EXCEPTION);

        ChannelEntity channel = findOneChannel(channelNo);
        AssertUtils.notNull(channel, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "channelNo", channelNo);
        CallSyncTriggerId triggerId = new CallSyncTriggerId()
                .channelId(channel.getChannelId())
                .callDate(callDate);

        CallSyncTriggerEntity entity = (CallSyncTriggerEntity) new CallSyncTriggerEntity()
                .id(triggerId)
                .statusCode(CallTriggerStatus.WAITING)
                .resourceFile(resourcePath)
                .executeCount(0)
                .requestTime(requestTime)
                .partitionKey(channel.getPartitionKey());

        entity.setDescText(data.toString());

        callSyncTriggerRepository.save(entity);

        return entity;
    }

    private CallSyncTriggerEntity change(CallSyncTriggerEntity entity, CallTriggerStatus changed) {
        CallTriggerStatus statusCode = entity.getStatusCode();
        if (CallTriggerStatus.SYNCHRONIZED.equals(changed)) {
            AssertUtils.isTrue(CallTriggerStatus.SYNCING.equals(statusCode), ExceptionMessageEnum.LOGIC_EXCEPTION);
        } else if (CallTriggerStatus.SYNCING.equals(changed)) {
            AssertUtils.isTrue(CallTriggerStatus.WAITING.equals(statusCode), ExceptionMessageEnum.LOGIC_EXCEPTION);
        }
        entity.setStatusCode(changed);
        return callSyncTriggerRepository.saveAndFlush(entity);
    }

    public void sync() {
        sync(null);
    }

    public void sync(ResourceSyncObserver observer) {
        String localPath = callSyncFactory.getLocalPath();

        int pageNumber = 0;
        PageRequest pageRequest = new PageRequest(pageNumber, 5);

        if (log.isDebugEnabled())
            log.debug("loading call sync data. number:{}, size:{}", pageRequest.getPageNumber(), pageRequest.getPageSize());

        Page<CallSyncTriggerEntity> page = callSyncTriggerRepository.findAllByStatusCode(CallTriggerStatus.WAITING, pageRequest);
        List<CallSyncTriggerEntity> content = page.getContent();
        for (CallSyncTriggerEntity triggerEntity : content) {
            try {
                if (log.isDebugEnabled())
                    log.debug("start call synchronize. channel:{}, date:{}", triggerEntity.getId().getChannelId(), triggerEntity.getId().getCallDate());

                triggerEntity = sync(triggerEntity, localPath);

                if (log.isDebugEnabled())
                    log.debug("call synchronization is complete. channel:{}, date:{}, resource:{}", triggerEntity.getId().getChannelId(), triggerEntity.getId().getCallDate(), triggerEntity.getResourceFile());

            } catch (Throwable e) {
                e.printStackTrace();
            } finally {
                if (observer != null) {
                    if (CallTriggerStatus.SYNCHRONIZED.equals(triggerEntity.getStatusCode())) {
                        observer.completed(triggerEntity.getId().getChannelId(), triggerEntity.getId().getCallDate(), localPath, triggerEntity.getResourceFile());
                    }
                }
            }
        }
    }

    public CallSyncTriggerEntity sync(CallSyncTriggerEntity trigger, String localPath) throws IOException {

        trigger.setExecuteCount(trigger.getExecuteCount() + 1);
        CallSyncTriggerEntity triggerEntity = change(trigger, CallTriggerStatus.SYNCING);

        int chr = -1;
        FTPClient client = null;
        InputStream inputStream = null;
        FileOutputStream fileOutputStream = null;
        try {
            String resourceFile = trigger.getResourceFile();
            File localFile = new File(localPath, resourceFile);
            client = callSyncFactory.getClient();
            inputStream = client.retrieveFileStream(resourceFile);
            fileOutputStream = new FileOutputStream(localFile);
            while ((chr = inputStream.read()) != -1) {
                fileOutputStream.write(chr);
            }
            fileOutputStream.flush();
            fileOutputStream.close();
            inputStream.close();
            client.disconnect();

            triggerEntity = change(triggerEntity, CallTriggerStatus.SYNCHRONIZED);
        } catch (Throwable e) {
            EntityUtils.describe(triggerEntity, e.getMessage());
            triggerEntity = change(triggerEntity, CallTriggerStatus.FAILED);
        } finally {
            if (fileOutputStream != null)
                fileOutputStream.close();
            if (inputStream != null)
                inputStream.close();
            if (client != null)
                client.disconnect();
        }

        return triggerEntity;
    }
}
