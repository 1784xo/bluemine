package com.bluemine.repository;

import com.bluemine.domain.entity.TabCollectEntity;
import com.bluemine.domain.entity.TabCollectId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by hechao on 2018/7/11.
 */
@Repository
public interface TabCollectRepository extends JpaRepository<TabCollectEntity, TabCollectId> {
}
