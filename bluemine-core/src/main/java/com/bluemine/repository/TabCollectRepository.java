package com.bluemine.repository;

import com.bluemine.domain.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import org.springframework.data.domain.Pageable;
import java.time.LocalDate;
import java.util.List;

/**
 * Created by hechao on 2018/7/11.
 */
@Repository
public interface TabCollectRepository extends JpaRepository<TagCollectEntity, TagCollectId> {

    /*********************************标签分析按日期*********************************/
    //按日期标签(日)
    @Query("select tag.callDate,sum(tag.frequency+tag.subFrequency) as frequency,tag.id.tagId,'AAA' as tagText,count(tag.id.callNo) as callNum from TagCollectEntity as tag where tag.id.channelId=:channelId and tag.callDate in (:callDate) and tag.id.tagId in (:tagIds) group by tag.id.tagId order by ?#{#pageable}")
    List<TagCollectEntity> findByDateAndTagId(@Param("channelId") long channelId, @Param("callDate") LocalDate callDate, Pageable pageable, @Param("tagIds") List<Long> tagIds);

    //按日期标签(周月)
    @Query("select tag.callDate,sum(tag.frequency+tag.subFrequency) as frequency,tag.id.tagId,'AAA' as tagText,count(tag.id.callNo) as callNum from TagCollectEntity as tag where tag.id.channelId=:channelId and tag.callDate between :start and :ends and tag.id.tagId in (:tagIds) group by tag.id.tagId order by ?#{#pageable}")
    List<TagCollectEntity> findByDateAndTagIdIsBetween(@Param("channelId") long channelId, @Param("start") LocalDate start, @Param("ends") LocalDate ends, Pageable pageable, @Param("tagIds") List<Long> tagIds);

    /*********************************标签分析*********************************/
    //标签分析(30天走势)(所有标签)所有
    @Query("select tag.callDate,sum(tag.frequency+tag.subFrequency) as frequency,count(tag.id.callNo) as callNum from TagCollectEntity as tag where tag.id.channelId=:channelId and tag.id.tagId in (:tagIds) and tag.callDate between :start and :ends group by tag.callDate")
    List<TagCollectEntity> findByTagsAllIsBetween(@Param("channelId") long channelId, @Param("tagIds") List<Long> tagIds, @Param("start") LocalDate start, @Param("ends") LocalDate ends);

    //标签分析(30天走势)(所有标签)
    @Query("select tag.callDate,sum(tag.frequency+tag.subFrequency) as frequency,count(tag.id.callNo) as callNum from TagCollectEntity as tag where tag.id.channelId=:channelId and tag.id.tagId=:tagId and tag.callDate between :start and :ends group by tag.callDate")
    List<TagCollectEntity> findByTagsIsBetween(@Param("channelId") long channelId, @Param("tagId") Long tagId, @Param("start") LocalDate start, @Param("ends") LocalDate ends);


    //标签分析(30天走势)
    //@Query("select tag.callDate,sum(tag.frequency+tag.subFrequency) as frequency,tag.id.tagId,'AAA' as tagText,count(tag.id.callNo) as callNum from TagCollectEntity as tag where tag.channelId=:channelId and tag.id.tagId in (:tagIds) and tag.callDate between :start and :ends group by tag.callDate")
    //List<TagCollectEntity> findByTagsIsBetweenAnfTagId(@Param("channelId") long channelId, @Param("tagIds") List<Long> tagIds, @Param("start") LocalDate start, @Param("ends") LocalDate ends);

    /*********************************子标签分布*********************************/
    //标签分析(子标签分布top10)
    @Query("select sum(tag.frequency+tag.subFrequency) as frequency,tag.id.tagId,'AAA' as tagText,count(tag.id.callNo) as callNum from TagCollectEntity as tag where tag.id.channelId=:channelId and tag.id.tagId in (:tagIds) and tag.callDate between :start and :ends group by tag.id.tagId order by sum(tag.frequency+tag.subFrequency) desc")
    List<TagCollectEntity> findBySubFTags(@Param("channelId") long channelId, @Param("tagIds") List<Long> tagIds, @Param("start") LocalDate start, @Param("ends") LocalDate ends);

    @Query("select sum(tag.frequency+tag.subFrequency) as frequency,tag.id.tagId,'AAA' as tagText,count(tag.id.callNo) as callNum from TagCollectEntity as tag where tag.id.channelId=:channelId and tag.id.tagId in (:tagIds) and tag.callDate between :start and :ends group by tag.id.tagId order by callNum desc")
    List<TagCollectEntity> findBySubCTags(@Param("channelId") long channelId, @Param("tagIds") List<Long> tagIds, @Param("start") LocalDate start, @Param("ends") LocalDate ends);

}
