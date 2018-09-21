package com.bluemine.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.bluemine.domain.entity.QualityItemEntity;
import com.bluemine.domain.entity.QualityRowEntity;

/**
 * Created by yxghero2
 */
@Repository
public interface QualityItemRepository extends JpaRepository<QualityItemEntity, Long> {

    @Query("SELECT qua FROM QualityItemEntity qua WHERE qua.channelId=:channelId ")
    List<QualityItemEntity> findAll(@Param("channelId") long channelId);
    
    @Query("SELECT qua FROM QualityItemEntity qua WHERE qua.channelId=:channelId and qua.activated=:activated")
    List<QualityItemEntity> findAll(@Param("channelId") long channelId,@Param("activated") boolean activated);
    
    @Modifying
    @Query(value = "DELETE FROM quality_item WHERE CHANNEL_ID=?1 AND ITEM_ID=?2", nativeQuery = true)
    int delete(long channelId, long itemId);
    
    List<QualityItemEntity> findAllByChannelIdAndRowId(long channelId, long rowId);
    
}
