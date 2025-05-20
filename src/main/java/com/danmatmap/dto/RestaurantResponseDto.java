package com.danmatmap.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
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
