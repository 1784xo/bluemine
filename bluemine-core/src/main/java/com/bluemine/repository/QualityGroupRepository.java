package com.bluemine.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.bluemine.domain.entity.QualityGroupEntity;

/**
 * Created by yxghero2
 */
@Repository
public interface QualityGroupRepository extends JpaRepository<QualityGroupEntity, Long> {

    @Query("SELECT qua FROM QualityGroupEntity qua WHERE qua.channelId=:channelId ")
    List<QualityGroupEntity> findAll(@Param("channelId") long channelId);
    
    @Query("SELECT qua FROM QualityGroupEntity qua WHERE qua.channelId=:channelId and qua.activated=:activated")
    List<QualityGroupEntity> findAll(@Param("channelId") long channelId,@Param("activated") boolean activated);
    
    QualityGroupEntity findOneByChannelIdAndGroupId(long channelId, long groupId);
}
