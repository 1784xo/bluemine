package com.bluemine.repository;

import com.bluemine.domain.entity.EmployeeEntity;
import com.bluemine.domain.entity.QualityGroupEntity;
import com.bluemine.domain.entity.QualityRowEntity;
import com.bluemine.domain.entity.RuleEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by yxghero2
 */
@Repository

public interface EmployeeRepository extends JpaRepository<EmployeeEntity, Long>,JpaSpecificationExecutor<EmployeeEntity> {
	
    
    @Query("SELECT qua FROM EmployeeEntity qua WHERE qua.channelId=:channelId and qua.activated=:activated")
    List<EmployeeEntity> findAllByChannelIdAndActivated(@Param("channelId") long channelId,@Param("activated") boolean activated);
	
	List<EmployeeEntity> findAllByChannelId(long  channelId);
}
