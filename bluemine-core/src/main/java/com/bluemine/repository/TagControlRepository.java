package com.bluemine.repository;

import com.bluemine.domain.entity.TagControlEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by hechao on 2018/8/10.
 */
@Repository
public interface TagControlRepository extends JpaRepository<TagControlEntity, Long> {
}
