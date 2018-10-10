package com.bluemine.repository;

import com.bluemine.domain.entity.CallSyncTriggerEntity;
import com.bluemine.domain.entity.CallSyncTriggerId;
import com.bluemine.struct.CallTriggerStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by hechao on 2018/9/25.
 */
@Repository
public interface CallSyncTriggerRepository extends JpaRepository<CallSyncTriggerEntity, CallSyncTriggerId> {
//    @Modifying
//    @Transactional
//    @Query("UPDATE CallSyncTriggerEntity  trigger SET trigger.statusCode=:changed, trigger.descText=:descText WHERE trigger.id.channelId=:channelId AND trigger.id.callDate=:callDate AND trigger.statusCode=:status")
//    int updateStatus(@Param("channelId") Long channelId, @Param("callDate") LocalDate callDate, @Param("status") TriggerStatus status,  @Param("statusCode") TriggerStatus changed, @Param("descText") String descText);
//
//    @Modifying
//    @Transactional
//    @Query("UPDATE CallSyncTriggerEntity  trigger SET trigger.statusCode=:changed, trigger.descText=:descText WHERE trigger.id.channelId=:channelId AND trigger.id.callDate=:callDate")
//    int updateStatus(@Param("channelId") Long channelId, @Param("callDate") LocalDate callDate, @Param("statusCode") TriggerStatus changed, @Param("descText") String descText);

    Page<CallSyncTriggerEntity> findAllByStatusCode(CallTriggerStatus status, Pageable pageable);
}
