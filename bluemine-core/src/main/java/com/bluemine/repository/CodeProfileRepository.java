package com.bluemine.repository;

import com.bluemine.domain.entity.CodeProfileEntity;
import com.bluemine.domain.entity.CodeProfileId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by hechao on 2018/6/28.
 */
@Repository
public interface CodeProfileRepository extends JpaRepository<CodeProfileEntity, CodeProfileId> {
}
