////package com.danmatmap.mapper;
////
////import com.danmatmap.dto.RestaurantResponseDto;
////import com.danmatmap.entity.Restaurant;
////import org.mapstruct.Mapper;
////import org.mapstruct.Mapping;
////import org.mapstruct.Mappings;
////
////import java.util.stream.Collectors;
////
////@Mapper(componentModel = "spring")
////public interface RestaurantMapper {
////
////    // Restaurant -> RestaurantResponseDto
////    @Mappings({
////            @Mapping(source = "id", target = "id"),
////            @Mapping(source = "title", target = "title"),
////            @Mapping(source = "menu", target = "menu"),
////            @Mapping(source = "address", target = "address"),
////            @Mapping(source = "latitude", target = "latitude"),
////            @Mapping(source = "longitude", target = "longitude"),
////            @Mapping(source = "imageUrl", target = "imageUrl"),
////            @Mapping(target = "tags", expression = "java(restaurant.getRestaurantTags().stream().map(rt -> rt.getTag().getName()).collect(Collectors.toList()))")
////    })
////    RestaurantResponseDto toDto(Restaurant restaurant);
////
////    // 역매핑 (등록용)
////    @Mappings({
////            @Mapping(source = "title", target = "title"),
////            @Mapping(source = "menu", target = "menu"),
////            @Mapping(source = "address", target = "address"),
////            @Mapping(source = "latitude", target = "latitude"),
////            @Mapping(source = "longitude", target = "longitude"),
////            @Mapping(source = "imageUrl", target = "imageUrl"),
////            @Mapping(target = "status", ignore = true),
////            @Mapping(target = "restaurantTags", ignore = true)
////    })
////    Restaurant toEntity(RestaurantResponseDto dto);
////}
//
//
//package com.danmatmap.mapper;
//
//import com.danmatmap.dto.RestaurantResponseDto;
//import com.danmatmap.entity.Restaurant;
//import org.mapstruct.Mapper;
//import org.mapstruct.Mapping;
//import org.mapstruct.Mappings;
//
//@Mapper(componentModel = "spring")
//public interface RestaurantMapper {
//
//    // Restaurant → RestaurantResponseDto
////    @Mapping(target = "tags", expression = "java(restaurant.getRestaurantTags().stream().map(rt -> rt.getTag().getName()).toList())")
//    RestaurantResponseDto toDto(Restaurant restaurant);
//
//    // RestaurantResponseDto → Restaurant (역방향 매핑)
//    // 수동 매핑할 필요 없다면 생략 가능
//    Restaurant toEntity(RestaurantResponseDto dto);
//}
