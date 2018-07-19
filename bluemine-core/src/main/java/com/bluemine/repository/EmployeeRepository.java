package com.bluemine.repository;

import com.bluemine.domain.entity.EmployeeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by hechao on 2018/6/28.
 */
@Repository
public interface EmployeeRepository extends JpaRepository<EmployeeEntity, Long> {
}
