package com.danmatmap.repository;

import com.danmatmap.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TagRepository extends JpaRepository<Tag, Long> {

    // 태그 이름으로 조회 (중복 방지를 위해 Optional 사용)
    Optional<Tag> findByName(String name);
}
