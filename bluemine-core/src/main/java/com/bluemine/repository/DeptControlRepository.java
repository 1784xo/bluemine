package com.bluemine.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bluemine.domain.entity.DeptControlEntity;

/**
 * Created by yxghero2
 */
@Repository
public interface DeptControlRepository extends JpaRepository<DeptControlEntity, Long> {
}
