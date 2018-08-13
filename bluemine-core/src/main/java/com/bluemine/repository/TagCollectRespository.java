package com.bluemine.repository;

import com.bluemine.domain.entity.TagCollectEntity;
import com.bluemine.domain.entity.TagControlEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

/**
 * Created by hechao on 2018/6/28.
 */
@Repository
public interface TagCollectRespository extends JpaRepository<TagCollectEntity, Long> {

}
