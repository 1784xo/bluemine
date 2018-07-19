package com.bluemine.repository;

import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.RuleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hechao on 2018/6/28.
 */
@Repository
public interface RuleRepository extends JpaRepository<RuleEntity, Long> {

    @Modifying
    @Query(value = "DELETE FROM rule WHERE CHANNEL_ID=?1 AND RULE_ID=?2", nativeQuery = true)
    int delete(long channelId, long ruleId);

    List<RuleEntity> findAllByChannelId(long  channelId);
}
