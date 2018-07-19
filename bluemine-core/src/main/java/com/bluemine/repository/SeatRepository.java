package com.bluemine.repository;

import com.bluemine.domain.entity.SeatEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by hechao on 2018/7/4.
 */
@Repository
public interface SeatRepository extends JpaRepository<SeatEntity, Long> {
    SeatEntity findOneByChannelIdAndSeatNo(long channeId, String seatNo);
}
