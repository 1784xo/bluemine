package com.bluemine.repository;

import com.bluemine.domain.entity.TagEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hechao on 2018/6/28.
 */
@Repository
public interface TagRepository extends JpaRepository<TagEntity, Long> {

    List<TagEntity> findAllByChannelId(long channelId);

    List<TagEntity> findAllByChannelIdAndParentId(long channelId, long parentId);

    TagEntity findOneByChannelIdAndTagId(long channelId, long tagId);
}
