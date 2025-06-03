package com.danmatmap.repository;

import com.danmatmap.entity.RestaurantTag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RestaurantTagRepository extends JpaRepository<RestaurantTag, Long> {
    List<RestaurantTag> findByTag_Name(String tagName);
}

