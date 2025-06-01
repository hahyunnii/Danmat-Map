package com.danmatmap.service;

import com.danmatmap.entity.Restaurant;
import com.danmatmap.repository.RestaurantRepository;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Service
@RequiredArgsConstructor
@Slf4j
public class DataInitializationService {

    private final RestaurantRepository restaurantRepository;
    private final TranslationService translationService;

    @Value("${translation.enabled:true}")
    private boolean translationEnabled;

    @Value("${translation.batch-size:3}")
    private int batchSize = 3;

    /**
     * 애플리케이션 시작 시 데이터베이스의 식당 정보를 번역합니다.
     */
    @PostConstruct
    public void initializeTranslations() {
        if (!translationEnabled) {
            log.info("번역 기능이 비활성화되어 있습니다. 초기화를 건너뜁니다.");
            return;
        }

        log.info("데이터베이스 번역 초기화 시작");
        try {
            translateAllRestaurants();
            log.info("데이터베이스 번역 초기화 완료");
        } catch (Exception e) {
            log.error("데이터베이스 번역 초기화 중 오류 발생: {}", e.getMessage(), e);
        }
    }

    /**
     * 모든 식당 정보를 번역합니다.
     */
    @Transactional
    public void translateAllRestaurants() {
        List<Restaurant> restaurants = restaurantRepository.findAll();
        log.info("번역할 식당 {} 개를 찾았습니다.", restaurants.size());

        // 번역 완료된 식당 수 카운터
        AtomicInteger translatedCount = new AtomicInteger(0);

        // 번역 실패한 식당 수 카운터
        AtomicInteger failedCount = new AtomicInteger(0);

        // 처리된 식당 수 카운터 (로깅용)
        AtomicInteger processedCount = new AtomicInteger(0);

        // 배치 단위로 처리하여 API 제한 피하기
        for (int i = 0; i < restaurants.size(); i += batchSize) {
            int endIndex = Math.min(i + batchSize, restaurants.size());
            List<Restaurant> batch = restaurants.subList(i, endIndex);

            log.info("식당 배치 처리 중: {}/{} (배치 크기: {})",
                    processedCount.get(), restaurants.size(), batch.size());

            for (Restaurant restaurant : batch) {
                try {
                    // 번역이 아직 되지 않은 식당만 번역 (이미 번역된 경우 스킵)
                    if (shouldTranslate(restaurant)) {
                        translateRestaurant(restaurant);
                        translatedCount.incrementAndGet();
                    } else {
                        log.debug("식당 '{}' 이미 번역되어 있어 건너뜁니다.", restaurant.getTitle());
                    }
                } catch (Exception e) {
                    failedCount.incrementAndGet();
                    log.error("식당 번역 처리 중 오류: {}, 오류: {}", restaurant.getTitle(), e.getMessage());
                } finally {
                    processedCount.incrementAndGet();
                }
            }

            // 배치 간 지연 추가 (API 제한 방지)
            try {
                if (i + batchSize < restaurants.size()) {
                    log.info("배치 처리 후 잠시 대기 중...");
                    Thread.sleep(2000); // 2초 대기
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                log.warn("배치 처리 중 인터럽트 발생");
            }
        }

        // 변경사항 저장
        try {
            restaurantRepository.saveAll(restaurants);
            log.info("총 식당 수: {}, 번역 완료: {}, 번역 실패: {}",
                    restaurants.size(), translatedCount.get(), failedCount.get());
        } catch (Exception e) {
            log.error("번역된 식당 데이터 저장 중 오류 발생: {}", e.getMessage(), e);
        }
    }

    /**
     * 번역이 필요한지 확인합니다.
     */
    private boolean shouldTranslate(Restaurant restaurant) {
        // 제목이나 메뉴 중 하나라도 번역이 없으면 번역 필요
        return restaurant.getTitleEn() == null || restaurant.getTitleEn().isEmpty() ||
                restaurant.getTitleJa() == null || restaurant.getTitleJa().isEmpty() ||
                restaurant.getTitleZh() == null || restaurant.getTitleZh().isEmpty() ||
                (restaurant.getMenu() != null && !restaurant.getMenu().isEmpty() && (
                        restaurant.getMenuEn() == null || restaurant.getMenuEn().isEmpty() ||
                                restaurant.getMenuJa() == null || restaurant.getMenuJa().isEmpty() ||
                                restaurant.getMenuZh() == null || restaurant.getMenuZh().isEmpty()
                ));
    }

    /**
     * 식당 정보를 영어, 일본어, 중국어로 번역합니다.
     */
    private void translateRestaurant(Restaurant restaurant) {
        log.info("식당 번역 시작: {}", restaurant.getTitle());

        try {
            // 제목 번역
            if (restaurant.getTitleEn() == null || restaurant.getTitleEn().isEmpty()) {
                restaurant.setTitleEn(translationService.translateToEnglish(restaurant.getTitle()));
            }

            if (restaurant.getTitleJa() == null || restaurant.getTitleJa().isEmpty()) {
                restaurant.setTitleJa(translationService.translateToJapanese(restaurant.getTitle()));
            }

            if (restaurant.getTitleZh() == null || restaurant.getTitleZh().isEmpty()) {
                restaurant.setTitleZh(translationService.translateToChinese(restaurant.getTitle()));
            }

            // 메뉴 번역 (메뉴가 있는 경우에만)
            if (restaurant.getMenu() != null && !restaurant.getMenu().isEmpty()) {
                if (restaurant.getMenuEn() == null || restaurant.getMenuEn().isEmpty()) {
                    restaurant.setMenuEn(translationService.translateToEnglish(restaurant.getMenu()));
                }

                if (restaurant.getMenuJa() == null || restaurant.getMenuJa().isEmpty()) {
                    restaurant.setMenuJa(translationService.translateToJapanese(restaurant.getMenu()));
                }

                if (restaurant.getMenuZh() == null || restaurant.getMenuZh().isEmpty()) {
                    restaurant.setMenuZh(translationService.translateToChinese(restaurant.getMenu()));
                }
            }

            log.info("식당 번역 완료: {}", restaurant.getTitle());
        } catch (Exception e) {
            log.error("식당 번역 중 오류 발생: {}, 오류: {}", restaurant.getTitle(), e.getMessage());
            throw e; // 상위 메서드에서 처리하도록 예외 전파
        }
    }
}