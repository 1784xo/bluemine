package com.bluemine.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.bluemine.domain.entity.DeptEntity;

/**
 * Created by yxghero2
 */
@Repository
public interface DeptRepository extends JpaRepository<DeptEntity, Long> {

    static final Sort ORDER_DEPT_NO_ASC = new Sort(new Sort.Order(Sort.Direction.ASC, "deptNo"));

    @Query("SELECT dept FROM DeptEntity dept WHERE dept.channelId=:channelId ORDER BY dept.deptNo ASC")
    List<DeptEntity> findAll(@Param("channelId") long channelId);

    @Query("SELECT dept FROM DeptEntity dept WHERE dept.channelId=:channelId AND dept.activated=:activated")
    List<DeptEntity> findAll(@Param("channelId") long channelId, @Param("activated") boolean activated, Sort sort);

    @Query("SELECT dept FROM DeptEntity dept WHERE dept.channelId=:channelId AND dept.parentId=:parentId ORDER BY dept.deptNo ASC")
    List<DeptEntity> findAllSub(@Param("channelId") long channelId, @Param("parentId") long parentId);

    DeptEntity findOneByChannelIdAndDeptId(long channelId, long deptId);
}
