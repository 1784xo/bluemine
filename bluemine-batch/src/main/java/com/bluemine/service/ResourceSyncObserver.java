package com.bluemine.service;

import com.bluemine.struct.CallTriggerStatus;

import java.io.File;
import java.time.LocalDate;

/**
 * Created by hechao on 2018/10/8.
 */
public interface ResourceSyncObserver {
    void completed(Long channelId, LocalDate callDate, String localPath, String fileName);
}
