package com.danmatmap.controller;

import com.danmatmap.dto.RestaurantResponseDto;
import com.danmatmap.dto.RestaurantTagRequestDto;
import com.danmatmap.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/restaurants")
public class RestaurantController {

    private final RestaurantService restaurantService;

    // ✅ 전체 식당 목록 조회
    @GetMapping
    public ResponseEntity<List<RestaurantResponseDto>> getAllRestaurants() {
        List<RestaurantResponseDto> restaurants = restaurantService.getAllRestaurants();
        return ResponseEntity.ok(restaurants);
    }

    // ✅ 특정 태그로 식당 목록 조회
    @GetMapping("/by-tag")
    public ResponseEntity<List<RestaurantResponseDto>> getRestaurantsByTag(@RequestParam String tagName) {
        List<RestaurantResponseDto> result = restaurantService.getRestaurantsByTag(tagName);
        return ResponseEntity.ok(result);
    }

    // ✅ 식당 상세 조회
    @GetMapping("/{id}")
    public ResponseEntity<RestaurantResponseDto> getRestaurantById(@PathVariable Long id) {
        return ResponseEntity.ok(restaurantService.getRestaurantById(id));
    }

    // ✅ 식당에 태그 추가
    @PostMapping("/{restaurantId}/tags")
    public ResponseEntity<Void> addTagToRestaurant(@PathVariable Long restaurantId,
                                                   @RequestBody RestaurantTagRequestDto dto) {
        restaurantService.addTagToRestaurant(restaurantId, dto.getTagName());
        return ResponseEntity.ok().build();
    }

    // ⏳ (TODO) 식당 정보 수정, 태그 삭제, 식당 삭제 등의 기능이 필요한 경우 이후에 추가 가능
}
