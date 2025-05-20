package com.danmatmap.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "restaurants")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Restaurant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;        // 가게 이름
    private String menu;         // 대표 메뉴
    private String address;      // 도로명 주소
    private String latitude;     // 위도
    private String longitude;    // 경도

    @Column(name = "image_url")
    private String imageUrl;

    private String status;       // A: 활성 / D: 비활성

    @Builder.Default
    // ✅ 다대다 관계: 태그(카테고리 역할 포함)
    @OneToMany(mappedBy = "restaurant", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RestaurantTag> restaurantTags = new ArrayList<>();
}
