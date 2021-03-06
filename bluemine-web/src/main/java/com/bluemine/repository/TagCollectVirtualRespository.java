package com.bluemine.repository;

import com.bluemine.domain.entity.TagCollectVirtualEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

/**
 * Created by hechao on 2018/8/10.
 */
@Repository
public interface TagCollectVirtualRespository extends JpaRepository<TagCollectVirtualEntity, Long> {

    /**
     * 得到所有标签数据汇总
     *
     * @param channelId
     * @param start
     * @param end
     * @return
     */
    @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
            ", 0 AS TAG_ID " +
            ", 0 AS PARENT_ID " +
            ", NULL AS TAG_TEXT " +
            ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
            ", SUM(FREQUENCY) AS FREQUENCY " +
            ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
            ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
            ", CALL_DATE AS CALL_DATE " +
            ", CALL_YEAR AS  CALL_YEAR " +
            ", CALL_MONTH AS CALL_MONTH " +
            ", CALL_DAY AS CALL_DAY " +
            ", CALL_WEEK AS CALL_WEEK " +
            "FROM tag_collect WHERE " +
            "CHANNEL_ID = ?1 " +
            "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
            "GROUP BY CALL_DATE " +
            "ORDER BY CALL_DATE ASC ", nativeQuery = true)
    List<TagCollectVirtualEntity> findAll(long channelId, LocalDate start, LocalDate end);

    /**
     * 得到所有标签数据汇总
     *
     * @param channelId 渠道ID
     * @param start     起始日期
     * @param end       结束日期
     * @param roleType  角色类型
     * @return
     */
    @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
            ", 0 AS TAG_ID " +
            ", 0 AS PARENT_ID " +
            ", NULL AS TAG_TEXT " +
            ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
            ", SUM(FREQUENCY) AS FREQUENCY " +
            ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
            ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
            ", CALL_DATE AS CALL_DATE " +
            ", CALL_YEAR AS  CALL_YEAR " +
            ", CALL_MONTH AS CALL_MONTH " +
            ", CALL_DAY AS CALL_DAY " +
            ", CALL_WEEK AS CALL_WEEK " +
            "FROM tag_collect WHERE " +
            "CHANNEL_ID = ?1 " +
            "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
            "AND ROLE_TYPE = ?4 " +
            "GROUP BY CALL_DATE " +
            "ORDER BY CALL_DATE ASC ", nativeQuery = true)
    List<TagCollectVirtualEntity> findAll(long channelId, LocalDate start, LocalDate end, String roleType);

    /**
     * 得到所有标签数据汇总
     *
     * @param channelId 渠道ID
     * @param callType  会话类型
     * @param start     起始日期
     * @param end       结束日期
     * @return
     */
    @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
            ", 0 AS TAG_ID " +
            ", 0 AS PARENT_ID " +
            ", NULL AS TAG_TEXT " +
            ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
            ", SUM(FREQUENCY) AS FREQUENCY " +
            ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
            ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
            ", CALL_DATE AS CALL_DATE " +
            ", CALL_YEAR AS  CALL_YEAR " +
            ", CALL_MONTH AS CALL_MONTH " +
            ", CALL_DAY AS CALL_DAY " +
            ", CALL_WEEK AS CALL_WEEK " +
            "FROM tag_collect WHERE " +
            "CHANNEL_ID = ?1 " +
            "AND CALL_DATE >= ?3 AND CALL_DATE<=?4 " +
            "AND CALL_TYPE = ?2 " +
            "GROUP BY CALL_DATE " +
            "ORDER BY CALL_DATE ASC ", nativeQuery = true)
    List<TagCollectVirtualEntity> findAll(long channelId, String callType, LocalDate start, LocalDate end);

    /**
     * 得到所有标签数据汇总
     *
     * @param channelId 渠道ID
     * @param callType  会话类型
     * @param start     起始日期
     * @param end       结束日期
     * @param roleType  角色类型
     * @return
     */
    @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
            ", 0 AS TAG_ID " +
            ", 0 AS PARENT_ID " +
            ", NULL AS TAG_TEXT " +
            ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
            ", SUM(FREQUENCY) AS FREQUENCY " +
            ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
            ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
            ", CALL_DATE AS CALL_DATE " +
            ", CALL_YEAR AS  CALL_YEAR " +
            ", CALL_MONTH AS CALL_MONTH " +
            ", CALL_DAY AS CALL_DAY " +
            ", CALL_WEEK AS CALL_WEEK " +
            "FROM tag_collect WHERE " +
            "CHANNEL_ID = ?1 " +
            "AND CALL_DATE >= ?3 AND CALL_DATE<=?4 " +
            "AND CALL_TYPE = ?2 " +
            "AND ROLE_TYPE =  ?5" +
            "GROUP BY CALL_DATE " +
            "ORDER BY CALL_DATE ASC ", nativeQuery = true)
    List<TagCollectVirtualEntity> findAll(long channelId, String callType, LocalDate start, LocalDate end, String roleType);

    /**
     * 得到指定标签数据汇总
     *
     * @param channelId 渠道ID
     * @param tagIds    标签ID
     * @param start     起始日期
     * @param end       结束日期
     * @return
     */
    @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
            ", 0 AS TAG_ID " +
            ", 0 AS PARENT_ID " +
            ", NULL AS TAG_TEXT " +
            ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
            ", SUM(FREQUENCY) AS FREQUENCY " +
            ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
            ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
            ", CALL_DATE AS CALL_DATE " +
            ", CALL_YEAR AS  CALL_YEAR " +
            ", CALL_MONTH AS CALL_MONTH " +
            ", CALL_DAY AS CALL_DAY " +
            ", CALL_WEEK AS CALL_WEEK " +
            "FROM tag_collect WHERE " +
            "CHANNEL_ID = ?1 " +
            "AND TAG_ID IN ?2 " +
            "AND CALL_DATE >= ?3 AND CALL_DATE<=?4 " +
            "GROUP BY CALL_DATE " +
            "ORDER BY CALL_DATE ASC ",   nativeQuery = true)
    List<TagCollectVirtualEntity> findAllInTagId(long channelId, Long[] tagIds, LocalDate start, LocalDate end);

    /**
     * 得到指定标签数据汇总
     *
     * @param channelId 渠道ID
     * @param tagId    标签ID
     * @param start     起始日期
     * @param end       结束日期
     * @return
     */
    @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
            ", 0 AS TAG_ID " +
            ", 0 AS PARENT_ID " +
            ", NULL AS TAG_TEXT " +
            ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
            ", SUM(FREQUENCY) AS FREQUENCY " +
            ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
            ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
            ", CALL_DATE AS CALL_DATE " +
            ", CALL_YEAR AS  CALL_YEAR " +
            ", CALL_MONTH AS CALL_MONTH " +
            ", CALL_DAY AS CALL_DAY " +
            ", CALL_WEEK AS CALL_WEEK " +
            "FROM tag_collect WHERE " +
            "CHANNEL_ID = ?1 " +
            "AND TAG_ID=?2 " +
            "AND CALL_DATE >= ?3 AND CALL_DATE<=?4 " +
            "GROUP BY CALL_DATE " +
            "ORDER BY CALL_DATE ASC ", nativeQuery = true)
    List<TagCollectVirtualEntity> findOne(long channelId, long tagId, LocalDate start, LocalDate end);


    /**
     * 得到子标签数据汇总TOP
     *
     * @param channelId 渠道ID
     * @param parentId  父级tagId
     * @param start     起始日期
     * @param end       结束日期
     * @param sort      排序
     * @return
     */
    @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
            ", TAG_ID AS TAG_ID " +
            ", PARENT_ID AS PARENT_ID " +
            ", TAG_TEXT AS TAG_TEXT " +
            ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
            ", SUM(FREQUENCY) AS FREQUENCY " +
            ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
            ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
            ", CALL_DATE AS CALL_DATE " +
            ", CALL_YEAR AS  CALL_YEAR " +
            ", CALL_MONTH AS CALL_MONTH " +
            ", CALL_DAY AS CALL_DAY " +
            ", CALL_WEEK AS CALL_WEEK " +
            "FROM tag_collect WHERE " +
            "CHANNEL_ID = ?1 " +
            "AND PARENT_ID=?2 " +
            "AND CALL_DATE >= ?3 AND CALL_DATE<=?4 " +
            "GROUP BY TAG_ID ORDER BY ?#{#sort}", nativeQuery = true)
    List<TagCollectVirtualEntity> findAll(long channelId, long parentId, LocalDate start, LocalDate end, Sort sort);

        /**
         * 按日期:日(全部)
         *
         * @param channelId
         * @param start
         * @param end
         * @return
         */
        @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
                ", TAG_ID AS TAG_ID " +
                ", PARENT_ID AS PARENT_ID " +
                ", TAG_TEXT AS TAG_TEXT " +
                ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
                ", SUM(FREQUENCY) AS FREQUENCY " +
                ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
                ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
                ", CALL_DATE AS CALL_DATE " +
                ", CALL_YEAR AS  CALL_YEAR " +
                ", CALL_MONTH AS CALL_MONTH " +
                ", CALL_DAY AS CALL_DAY " +
                ", CALL_WEEK AS CALL_WEEK " +
                "FROM tag_collect WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
                "GROUP BY CALL_DATE, TAG_ID ORDER BY ?#{#pageable}"
                , countQuery="SELECT COUNT(TAG_ID) " +
                "FROM tag_collect, (SELECT 1=1 ORDER BY ?#{#pageable}) NUL WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 " +
                "AND CALL_DATE<=?3 " +
                "GROUP BY CALL_DATE, TAG_ID"
                , nativeQuery = true)
        Page<TagCollectVirtualEntity> findAllByDay(long channelId, LocalDate start, LocalDate end, Pageable pageable);

        /**
         * 按日期:周(全部)
         *
         * @param channelId
         * @param start
         * @param end
         * @return
         */
        @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
                ", TAG_ID AS TAG_ID " +
                ", PARENT_ID AS PARENT_ID " +
                ", TAG_TEXT AS TAG_TEXT " +
                ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
                ", SUM(FREQUENCY) AS FREQUENCY " +
                ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
                ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
                ", CALL_DATE AS CALL_DATE " +
                ", CALL_YEAR AS  CALL_YEAR " +
                ", CALL_MONTH AS CALL_MONTH " +
                ", CALL_DAY AS CALL_DAY " +
                ", CALL_WEEK AS CALL_WEEK " +
                "FROM tag_collect WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
                "GROUP BY CALL_WEEK, TAG_ID ORDER BY ?#{#pageable}"
                , countQuery="SELECT COUNT(TAG_ID) " +
                "FROM tag_collect, (SELECT 1=1 ORDER BY ?#{#pageable}) NUL WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 " +
                "AND CALL_DATE<=?3 " +
                "GROUP BY CALL_WEEK, TAG_ID"
                , nativeQuery = true)
        Page<TagCollectVirtualEntity> findAllByWeek(long channelId, LocalDate start, LocalDate end, Pageable pageable);

        /**
         * 按日期:月(全部)
         *
         * @param channelId
         * @param start
         * @param end
         * @return
         */
        @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
                ", TAG_ID AS TAG_ID " +
                ", PARENT_ID AS PARENT_ID " +
                ", TAG_TEXT AS TAG_TEXT " +
                ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
                ", SUM(FREQUENCY) AS FREQUENCY " +
                ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
                ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
                ", CALL_DATE AS CALL_DATE " +
                ", CALL_YEAR AS  CALL_YEAR " +
                ", CALL_MONTH AS CALL_MONTH " +
                ", CALL_DAY AS CALL_DAY " +
                ", CALL_WEEK AS CALL_WEEK " +
                "FROM tag_collect WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
                "GROUP BY CALL_YEAR + CALL_MONTH, TAG_ID ORDER BY ?#{#pageable}"
                , countQuery="SELECT COUNT(TAG_ID) " +
                "FROM tag_collect, (SELECT 1=1 ORDER BY ?#{#pageable}) NUL WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 " +
                "AND CALL_DATE<=?3 " +
                "GROUP BY CALL_YEAR + CALL_MONTH, TAG_ID"
                , nativeQuery = true)
        Page<TagCollectVirtualEntity> findAllByMonth(long channelId, LocalDate start, LocalDate end, Pageable pageable);


        /**
         * 按日期:日(标签)
         *
         * @param channelId
         * @param start
         * @param end
         * @return
         */
        @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
                ", TAG_ID AS TAG_ID " +
                ", PARENT_ID AS PARENT_ID " +
                ", TAG_TEXT AS TAG_TEXT " +
                ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
                ", SUM(FREQUENCY) AS FREQUENCY " +
                ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
                ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
                ", CALL_DATE AS CALL_DATE " +
                ", CALL_YEAR AS  CALL_YEAR " +
                ", CALL_MONTH AS CALL_MONTH " +
                ", CALL_DAY AS CALL_DAY " +
                ", CALL_WEEK AS CALL_WEEK " +
                "FROM tag_collect WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
                "AND TAG_ID in (?4) " +
                "GROUP BY CALL_DATE, TAG_ID ORDER BY ?#{#pageable}"
                , countQuery="SELECT COUNT(TAG_ID) " +
                "FROM tag_collect, (SELECT 1=1 ORDER BY ?#{#pageable}) NUL WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 " +
                "AND CALL_DATE<=?3 " +
                "AND TAG_ID in (?4) " +
                "GROUP BY CALL_DATE, TAG_ID"
                , nativeQuery = true)
        Page<TagCollectVirtualEntity> findAllByDayInTagId(long channelId, LocalDate start, LocalDate end, Long[] tagIds, Pageable pageable);

        /**
         * 按日期:周(标签)
         *
         * @param channelId
         * @param start
         * @param end
         * @return
         */
        @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
                ", TAG_ID AS TAG_ID " +
                ", PARENT_ID AS PARENT_ID " +
                ", TAG_TEXT AS TAG_TEXT " +
                ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
                ", SUM(FREQUENCY) AS FREQUENCY " +
                ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
                ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
                ", CALL_DATE AS CALL_DATE " +
                ", CALL_YEAR AS  CALL_YEAR " +
                ", CALL_MONTH AS CALL_MONTH " +
                ", CALL_DAY AS CALL_DAY " +
                ", CALL_WEEK AS CALL_WEEK " +
                "FROM tag_collect WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
                "AND TAG_ID in (?4) " +
                "GROUP BY CALL_WEEK, TAG_ID ORDER BY ?#{#pageable}"
                , countQuery="SELECT COUNT(TAG_ID) " +
                "FROM tag_collect, (SELECT 1=1 ORDER BY ?#{#pageable}) NUL WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 " +
                "AND CALL_DATE<=?3 " +
                "AND TAG_ID in (?4) " +
                "GROUP BY CALL_WEEK, TAG_ID"
                , nativeQuery = true)
        Page<TagCollectVirtualEntity> findAllByWeekInTagId(long channelId, LocalDate start, LocalDate end, Long[] tagIds, Pageable pageable);

        /**
         * 按日期:月(标签)
         *
         * @param channelId
         * @param start
         * @param end
         * @return
         */
        @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
                ", TAG_ID AS TAG_ID " +
                ", PARENT_ID AS PARENT_ID " +
                ", TAG_TEXT AS TAG_TEXT " +
                ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
                ", SUM(FREQUENCY) AS FREQUENCY " +
                ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
                ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
                ", CALL_DATE AS CALL_DATE " +
                ", CALL_YEAR AS  CALL_YEAR " +
                ", CALL_MONTH AS CALL_MONTH " +
                ", CALL_DAY AS CALL_DAY " +
                ", CALL_WEEK AS CALL_WEEK " +
                "FROM tag_collect WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
                "AND TAG_ID in (?4) " +
                "GROUP BY CALL_YEAR + CALL_MONTH, TAG_ID ORDER BY ?#{#pageable}"
                , countQuery="SELECT COUNT(TAG_ID) " +
                "FROM tag_collect, (SELECT 1=1 ORDER BY ?#{#pageable}) NUL WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 " +
                "AND CALL_DATE<=?3 " +
                "AND TAG_ID in (?4) " +
                "GROUP BY CALL_YEAR + CALL_MONTH, TAG_ID"
                , nativeQuery = true)
        Page<TagCollectVirtualEntity> findAllByMonthInTagId(long channelId, LocalDate start, LocalDate end, Long[] tagIds, Pageable pageable);

        /**
         * 按日期:标签下钻(日)
         *
         * @param channelId
         * @param start
         * @param end
         * @return
         */
        @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
                ", TAG_ID AS TAG_ID " +
                ", PARENT_ID AS PARENT_ID " +
                ", TAG_TEXT AS TAG_TEXT " +
                ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
                ", SUM(FREQUENCY) AS FREQUENCY " +
                ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
                ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
                ", CALL_DATE AS CALL_DATE " +
                ", CALL_YEAR AS  CALL_YEAR " +
                ", CALL_MONTH AS CALL_MONTH " +
                ", CALL_DAY AS CALL_DAY " +
                ", CALL_WEEK AS CALL_WEEK " +
                "FROM tag_collect WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
                "AND PARENT_ID = ?4 " +
                "GROUP BY CALL_DATE, TAG_ID ORDER BY ?#{#pageable}"
                , countQuery="SELECT COUNT(TAG_ID) " +
                "FROM tag_collect, (SELECT 1=1 ORDER BY ?#{#pageable}) NUL WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 " +
                "AND CALL_DATE<=?3 " +
                "AND PARENT_ID = ?4 " +
                "GROUP BY CALL_DATE, TAG_ID"
                , nativeQuery = true)
        Page<TagCollectVirtualEntity> findSubByDayAndParentId(long channelId, LocalDate start, LocalDate end, Long parentId, Pageable pageable);

        /**
         * 按日期:标签下钻(日)
         *
         * @param channelId
         * @param start
         * @param end
         * @return
         */
        @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
                ", TAG_ID AS TAG_ID " +
                ", PARENT_ID AS PARENT_ID " +
                ", TAG_TEXT AS TAG_TEXT " +
                ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
                ", SUM(FREQUENCY) AS FREQUENCY " +
                ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
                ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
                ", CALL_DATE AS CALL_DATE " +
                ", CALL_YEAR AS  CALL_YEAR " +
                ", CALL_MONTH AS CALL_MONTH " +
                ", CALL_DAY AS CALL_DAY " +
                ", CALL_WEEK AS CALL_WEEK " +
                "FROM tag_collect WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
                "AND PARENT_ID = ?4 " +
                "GROUP BY CALL_WEEK, TAG_ID ORDER BY ?#{#pageable}"
                , countQuery="SELECT COUNT(TAG_ID) " +
                "FROM tag_collect, (SELECT 1=1 ORDER BY ?#{#pageable}) NUL WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 " +
                "AND CALL_DATE<=?3 " +
                "AND PARENT_ID = ?4 " +
                "GROUP BY CALL_WEEK, TAG_ID"
                , nativeQuery = true)
        Page<TagCollectVirtualEntity> findSubByWeekAndParentId(long channelId, LocalDate start, LocalDate end, Long parentId, Pageable pageable);

        /**
         * 按日期:标签下钻(日)
         *
         * @param channelId
         * @param start
         * @param end
         * @return
         */
        @Query(value = "SELECT COLLECT_ID AS COLLECT_ID " +
                ", TAG_ID AS TAG_ID " +
                ", PARENT_ID AS PARENT_ID " +
                ", TAG_TEXT AS TAG_TEXT " +
                ", SUM(SUB_FREQUENCY) AS SUB_FREQUENCY " +
                ", SUM(FREQUENCY) AS FREQUENCY " +
                ", SUM(TOTAL_FREQUENCY) AS TOTAL_FREQUENCY " +
                ", (COUNT(DISTINCT CALL_NO)) AS CALL_NUM " +
                ", CALL_DATE AS CALL_DATE " +
                ", CALL_YEAR AS  CALL_YEAR " +
                ", CALL_MONTH AS CALL_MONTH " +
                ", CALL_DAY AS CALL_DAY " +
                ", CALL_WEEK AS CALL_WEEK " +
                "FROM tag_collect WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 AND CALL_DATE<=?3 " +
                "AND PARENT_ID = ?4 " +
                "GROUP BY CALL_YEAR+CALL_MONTH,TAG_ID ORDER BY ?#{#pageable}"
                , countQuery="SELECT COUNT(TAG_ID) " +
                "FROM tag_collect, (SELECT 1=1 ORDER BY ?#{#pageable}) NUL WHERE " +
                "CHANNEL_ID = ?1 " +
                "AND CALL_DATE >= ?2 " +
                "AND CALL_DATE<=?3 " +
                "AND PARENT_ID = ?4 " +
                "GROUP BY CALL_YEAR+CALL_MONTH,TAG_ID"
                , nativeQuery = true)
        Page<TagCollectVirtualEntity> findSubByMonthAndParentId(long channelId, LocalDate start, LocalDate end, Long parentId, Pageable pageable);
}