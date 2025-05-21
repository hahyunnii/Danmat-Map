package com.danmatmap.dto;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RestaurantResponseDto {
    private Long id;
    private String title;
    private String menu;
    private String address;
    private String latitude;
    private String longitude;
    private String imageUrl;
    private List<String> tags;
}
