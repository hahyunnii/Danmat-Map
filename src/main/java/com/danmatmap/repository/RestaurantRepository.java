package com.danmatmap.repository;

import com.danmatmap.entity.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {

    // 상태값으로 활성 식당 조회
    List<Restaurant> findByStatus(String status);
}
