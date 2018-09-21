package com.bluemine.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.bluemine.domain.entity.QualityRowEntity;

/**
 * Created by yxghero2
 */
@Repository
public interface QualityRowRepository extends JpaRepository<QualityRowEntity, Long>,JpaSpecificationExecutor<QualityRowEntity> {

    @Query("SELECT qua FROM QualityRowEntity qua WHERE qua.channelId=:channelId ")
    List<QualityRowEntity> findAll(@Param("channelId") long channelId);
    
    @Query("SELECT qua FROM QualityRowEntity qua WHERE qua.channelId=:channelId and qua.activated=:activated")
    List<QualityRowEntity> findAll(@Param("channelId") long channelId,@Param("activated") boolean activated);
    
    QualityRowEntity findOneByChannelIdAndRowId(long channelId, long rowId);
    
}
