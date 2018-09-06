package com.bluemine.repository;

import com.bluemine.domain.entity.CallBatchTriggerEntity;
import com.bluemine.domain.entity.CallBatchTriggerId;
import com.bluemine.struct.BatchTriggerStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Created by hechao on 2018/7/19.
 */
@Repository
public interface CallBatchTriggerRepository extends JpaRepository<CallBatchTriggerEntity, CallBatchTriggerId> {

    @Query("SELECT tig FROM CallBatchTriggerEntity tig WHERE tig.statusCode=:statusCode AND tig.triggerDate<=:triggerDate")
    Page<CallBatchTriggerEntity> findAll(@Param("statusCode") BatchTriggerStatus status, @Param("triggerDate") LocalDateTime triggerDate, Pageable pageable);

    /**
     * 更新trigger状态
     *
     * @param channelNo
     * @param callNo
     * @param callDate
     * @param seatNo
     * @param status
     * @param statusCode
     * @param descText
     * @return
     */
    @Modifying
    @Transactional
    @Query("UPDATE CallBatchTriggerEntity tig SET tig.statusCode=:statusCode, tig.descText=:descText WHERE" +
            " tig.id.channelId=:channelId AND tig.id.callNo=:callNo AND tig.id.callDate=:callDate AND tig.id.seatNo=:seatNo AND tig.statusCode=:status")
    int updateStatus(@Param("channelId") Long channelId, @Param("callNo") String callNo, @Param("callDate") LocalDate callDate, @Param("seatNo") String seatNo
            , @Param("status") BatchTriggerStatus status, @Param("statusCode") BatchTriggerStatus statusCode, @Param("descText") String descText);
}
