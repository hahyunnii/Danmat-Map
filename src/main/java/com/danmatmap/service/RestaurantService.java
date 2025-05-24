// RestaurantService.java
package com.danmatmap.service;

import com.danmatmap.dto.RestaurantResponseDto;
import com.danmatmap.entity.Restaurant;
import com.danmatmap.entity.RestaurantTag;
import com.danmatmap.entity.Tag;
import com.danmatmap.repository.RestaurantRepository;
import com.danmatmap.repository.RestaurantTagRepository;
import com.danmatmap.repository.TagRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RestaurantService {

    private final RestaurantRepository restaurantRepository;
    private final TagRepository tagRepository;
    private final RestaurantTagRepository restaurantTagRepository;

    // 전체 식당 목록 조회
    @Transactional(readOnly = true)
    public List<RestaurantResponseDto> getAllRestaurants() {
        return restaurantRepository.findAll().stream()
                .map(RestaurantResponseDto::fromEntity)
                .collect(Collectors.toList());
    }

    // 태그 이름으로 식당 목록 조회
    @Transactional(readOnly = true)
    public List<RestaurantResponseDto> getRestaurantsByTag(String tagName) {
        List<RestaurantTag> tagRelations = restaurantTagRepository.findByTag_Name(tagName);
        return tagRelations.stream()
                .map(RestaurantTag::getRestaurant)
                .distinct() // 중복 제거
                .map(RestaurantResponseDto::fromEntity)
                .collect(Collectors.toList());
    }

    // 식당 상세 조회
    @Transactional(readOnly = true)
    public RestaurantResponseDto getRestaurantById(Long id) {
        Restaurant restaurant = restaurantRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("해당 ID의 식당이 존재하지 않습니다."));
        return RestaurantResponseDto.fromEntity(restaurant);
    }

    // 식당에 태그 추가
    @Transactional
    public void addTagToRestaurant(Long restaurantId, String tagName) {
        Restaurant restaurant = restaurantRepository.findById(restaurantId)
                .orElseThrow(() -> new NoSuchElementException("식당을 찾을 수 없습니다."));

        Tag tag = tagRepository.findByName(tagName)
                .orElseGet(() -> tagRepository.save(Tag.builder().name(tagName).build()));

        // 중복 추가 방지
        boolean alreadyExists = restaurant.getRestaurantTags().stream()
                .anyMatch(rt -> rt.getTag().getName().equals(tagName));
        if (alreadyExists) return;

        RestaurantTag restaurantTag = RestaurantTag.builder()
                .restaurant(restaurant)
                .tag(tag)
                .build();

        restaurant.getRestaurantTags().add(restaurantTag);
        restaurantTagRepository.save(restaurantTag);
    }
}
