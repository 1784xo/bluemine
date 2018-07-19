package com.bluemine.repository;

import com.bluemine.domain.entity.ChannelEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by hechao on 2018/6/28.
 */
@Repository
public interface ChannelRepository extends JpaRepository<ChannelEntity, Long> {
    ChannelEntity findOneByChannelNo(String channelNo);
}