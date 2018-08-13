package com.bluemine.repository;

import com.bluemine.domain.entity.TagEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hechao on 2018/6/28.
 */
@Repository
public interface TagRepository extends JpaRepository<TagEntity, Long> {

    @Query("SELECT tag FROM TagEntity tag WHERE tag.channelId=:channelId ORDER BY tag.tagNo ASC")
    List<TagEntity> findAll(@Param("channelId") long channelId);

    @Query("SELECT tag FROM TagEntity tag WHERE tag.channelId=:channelId AND tag.parentId=:parentId ORDER BY tag.tagNo ASC")
    List<TagEntity> findAllSub(@Param("channelId") long channelId, @Param("parentId") long parentId);

    TagEntity findOneByChannelIdAndTagId(long channelId, long tagId);
}
