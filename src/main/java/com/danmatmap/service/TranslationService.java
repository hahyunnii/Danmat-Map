package com.danmatmap.service;

import com.danmatmap.dto.TranslationRequestDto;
import com.danmatmap.dto.TranslationResponseDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import java.time.Duration;
import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
@Slf4j
public class TranslationService {

    private final WebClient webClient;

    @Value("${libretranslate.api.key}")
    private String apiKey = "cfbc813f-c4e3-4582-b95a-15d9ac3bb478"; // 기본값 설정

    @Value("${libretranslate.api.url:https://libretranslate.com/translate}")
    private String apiUrl = "https://libretranslate.com/translate"; // 기본값 설정

    // 요청 타임아웃 (5초)
    private static final Duration REQUEST_TIMEOUT = Duration.ofSeconds(5);

    // 요청 간 지연 시간 (밀리초)
    @Value("${translation.delay:1000}")
    private long requestDelayMs = 1000;

    // 최대 재시도 횟수
    @Value("${translation.max-retries:3}")
    private int maxRetries = 3;

    // 백오프 시간 증가 비율
    private static final int BACKOFF_MULTIPLIER = 2;

    /**
     * 텍스트를 지정된 언어로 번역합니다.
     *
     * @param text 번역할 텍스트
     * @param sourceLanguage 원본 언어 코드 (auto, ko, en 등)
     * @param targetLanguage 대상 언어 코드 (en, ja, zh 등)
     * @return 번역된 텍스트
     */
    public String translate(String text, String sourceLanguage, String targetLanguage) {
        if (text == null || text.isBlank()) {
            return "";
        }

        log.info("번역 요청: {} -> {}, 텍스트: '{}'", sourceLanguage, targetLanguage, text);

        // 재시도 횟수 초기화
        int retries = 0;
        long delayMs = requestDelayMs;

        while (retries <= maxRetries) {
            try {
                // 첫 번째 시도가 아니면 지연 시간 적용
                if (retries > 0) {
                    log.info("번역 재시도 #{}: {} -> {}, 텍스트: '{}', 지연: {}ms",
                            retries, sourceLanguage, targetLanguage, text, delayMs);
                    Thread.sleep(delayMs);
                    // 백오프 전략: 다음 재시도 시 지연 시간 증가
                    delayMs *= BACKOFF_MULTIPLIER;
                }

                TranslationRequestDto requestDto = TranslationRequestDto.builder()
                        .q(text)
                        .source(sourceLanguage)
                        .target(targetLanguage)
                        .format("text")
                        .alternatives(0)
                        .api_key(apiKey)
                        .build();

                // WebClient 요청에 타임아웃 적용
                TranslationResponseDto response = webClient.post()
                        .uri(apiUrl)
                        .bodyValue(requestDto)
                        .retrieve()
                        .bodyToMono(TranslationResponseDto.class)
                        .timeout(REQUEST_TIMEOUT)
                        .doOnError(WebClientResponseException.class, e -> {
                            if (e.getStatusCode() == HttpStatus.TOO_MANY_REQUESTS ||
                                    e.getStatusCode() == HttpStatus.FORBIDDEN) {
                                log.warn("API 요청 제한 (상태 코드: {}): {}", e.getStatusCode(), e.getResponseBodyAsString());
                            } else {
                                log.error("API 응답 오류 (상태 코드: {}): {}", e.getStatusCode(), e.getResponseBodyAsString());
                            }
                        })
                        .doOnError(Exception.class, e -> {
                            log.error("번역 중 오류 발생: {}", e.getMessage());
                        })
                        .onErrorReturn(ex -> {
                            // 403, 429 오류는 재시도 대상으로 표시
                            if (ex instanceof WebClientResponseException) {
                                WebClientResponseException wcre = (WebClientResponseException) ex;
                                return wcre.getStatusCode() == HttpStatus.TOO_MANY_REQUESTS ||
                                        wcre.getStatusCode() == HttpStatus.FORBIDDEN;
                            }
                            log.error("번역 실패, 원본 텍스트 반환: {}", ex.getMessage());
                            return false;
                        }, createEmptyResponse(text))
                        .block(REQUEST_TIMEOUT);

                if (response != null && response.getTranslatedText() != null &&
                        !response.getTranslatedText().equals(text)) {
                    log.info("번역 완료: '{}' -> '{}'", text, response.getTranslatedText());

                    // 성공 후 다음 요청 전에 짧은 지연 적용 (API 제한 방지)
                    try {
                        Thread.sleep(requestDelayMs);
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }

                    return response.getTranslatedText();
                } else if (retries < maxRetries) {
                    log.warn("번역 결과가 원본과 동일하거나 없습니다. 재시도 중...");
                    retries++;
                    continue;
                } else {
                    log.warn("최대 재시도 횟수에 도달했습니다. 원본 텍스트 반환");
                    return text;
                }
            } catch (WebClientResponseException e) {
                if ((e.getStatusCode() == HttpStatus.TOO_MANY_REQUESTS ||
                        e.getStatusCode() == HttpStatus.FORBIDDEN) &&
                        retries < maxRetries) {
                    log.warn("요청 제한 오류, 재시도 #{}: {}", retries + 1, e.getMessage());
                    retries++;
                    continue;
                }
                log.error("번역 중 웹 클라이언트 예외 발생: {}", e.getMessage());
                return text;
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                log.error("번역 지연 중 인터럽트: {}", e.getMessage());
                return text;
            } catch (Exception e) {
                log.error("번역 중 예외 발생: {}", e.getMessage());
                return text;
            }
        }

        return text; // 모든 재시도 실패 시 원본 반환
    }

    /**
     * 빈 응답 객체 생성 (오류 시 사용)
     */
    private TranslationResponseDto createEmptyResponse(String originalText) {
        TranslationResponseDto response = new TranslationResponseDto();
        response.setTranslatedText(originalText);
        return response;
    }

    /**
     * 영어로 번역합니다.
     */
    public String translateToEnglish(String text) {
        return translate(text, "ko", "en");
    }

    /**
     * 일본어로 번역합니다.
     */
    public String translateToJapanese(String text) {
        return translate(text, "ko", "ja");
    }

    /**
     * 중국어로 번역합니다.
     */
    public String translateToChinese(String text) {
        return translate(text, "ko", "zh");
    }
}