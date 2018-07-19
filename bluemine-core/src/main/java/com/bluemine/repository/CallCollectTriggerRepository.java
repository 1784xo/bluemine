package com.bluemine.repository;

import com.bluemine.domain.entity.CallCollectTriggerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by hechao on 2018/7/19.
 */
@Repository
public interface CallCollectTriggerRepository  extends JpaRepository<CallCollectTriggerEntity, Long> {
}
