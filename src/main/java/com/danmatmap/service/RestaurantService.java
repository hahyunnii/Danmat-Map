package com.danmatmap.service;

import com.danmatmap.dto.RestaurantResponseDto;
import com.danmatmap.entity.Restaurant;
import com.danmatmap.entity.RestaurantTag;
import com.danmatmap.entity.Tag;
import com.danmatmap.mapper.RestaurantMapper;
import com.danmatmap.repository.RestaurantRepository;
import com.danmatmap.repository.RestaurantTagRepository;
import com.danmatmap.repository.TagRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class RestaurantService {

    private final RestaurantRepository restaurantRepository;
    private final TagRepository tagRepository;
    private final RestaurantTagRepository restaurantTagRepository;
    private final RestaurantMapper restaurantMapper;

    // ✅ 전체 식당 목록 (status = A)
    public List<RestaurantResponseDto> getAllRestaurants() {
        return restaurantRepository.findByStatus("A").stream()
                .map(restaurantMapper::toDto)
                .toList();
    }

    // ✅ 특정 태그로 연결된 식당 목록 조회
    public List<RestaurantResponseDto> getRestaurantsByTag(String tagName) {
        List<RestaurantTag> tagged = restaurantTagRepository.findByTag_Name(tagName);

        return tagged.stream()
                .map(RestaurantTag::getRestaurant)
                .filter(r -> "A".equals(r.getStatus()))
                .distinct()
                .map(restaurantMapper::toDto)
                .toList();
    }

    // ✅ 특정 ID로 식당 상세 조회
    public RestaurantResponseDto getRestaurantById(Long id) {
        Restaurant restaurant = restaurantRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("식당을 찾을 수 없습니다."));
        return restaurantMapper.toDto(restaurant);
    }

    // ✅ 식당에 태그 추가
    public void addTagToRestaurant(Long restaurantId, String tagName) {
        Restaurant restaurant = restaurantRepository.findById(restaurantId)
                .orElseThrow(() -> new RuntimeException("식당을 찾을 수 없습니다."));

        Tag tag = tagRepository.findByName(tagName)
                .orElseGet(() -> tagRepository.save(new Tag(tagName)));

        RestaurantTag rt = RestaurantTag.builder()
                .restaurant(restaurant)
                .tag(tag)
                .build();

        restaurantTagRepository.save(rt);
    }
}
