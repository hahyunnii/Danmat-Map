package com.danmatmap.dto;

import com.danmatmap.entity.Restaurant;
import lombok.Builder;
import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@Builder
public class RestaurantResponseDto {
    private Long id;
    private String title;
    private String menu;
    private String address;
    private String latitude;
    private String longitude;
    private String imageUrl;
    private String status;
    private String category;
    private List<String> tags;  // restaurantTags에서 tag name만 추출

    // 번역 필드 추가
    private String titleEn;     // 영어 제목
    private String titleJa;     // 일본어 제목
    private String titleZh;     // 중국어 제목
    private String menuEn;      // 영어 메뉴
    private String menuJa;      // 일본어 메뉴
    private String menuZh;      // 중국어 메뉴

    public static RestaurantResponseDto fromEntity(Restaurant restaurant) {
        return RestaurantResponseDto.builder()
                .id(restaurant.getId())
                .title(restaurant.getTitle())
                .menu(restaurant.getMenu())
                .address(restaurant.getAddress())
                .latitude(restaurant.getLatitude())
                .longitude(restaurant.getLongitude())
                .imageUrl(restaurant.getImageUrl())
                .status(restaurant.getStatus())
                .category(restaurant.getCategory())
                .tags(
                        restaurant.getRestaurantTags().stream()
                                .map(rt -> rt.getTag().getName())
                                .collect(Collectors.toList())
                )
                // 번역 필드 추가
                .titleEn(restaurant.getTitleEn())
                .titleJa(restaurant.getTitleJa())
                .titleZh(restaurant.getTitleZh())
                .menuEn(restaurant.getMenuEn())
                .menuJa(restaurant.getMenuJa())
                .menuZh(restaurant.getMenuZh())
                .build();
    }
}
