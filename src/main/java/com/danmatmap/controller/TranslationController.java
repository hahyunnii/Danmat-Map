package com.danmatmap.controller;

import com.danmatmap.service.DataInitializationService;
import com.danmatmap.service.TranslationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/translation")
public class TranslationController {

    private final TranslationService translationService;
    private final DataInitializationService dataInitializationService;

    /**
     * 텍스트를 영어, 일본어, 중국어로 번역합니다.
     */
    @PostMapping("/translate")
    public ResponseEntity<Map<String, String>> translateText(@RequestBody Map<String, String> request) {
        String text = request.get("text");
        if (text == null || text.isEmpty()) {
            return ResponseEntity.badRequest().build();
        }

        Map<String, String> result = new HashMap<>();
        result.put("original", text);
        result.put("english", translationService.translateToEnglish(text));
        result.put("japanese", translationService.translateToJapanese(text));
        result.put("chinese", translationService.translateToChinese(text));

        return ResponseEntity.ok(result);
    }

    /**
     * 모든 식당의 번역 데이터를 수동으로 갱신합니다.
     */
    @PostMapping("/refresh-all")
    public ResponseEntity<Map<String, String>> refreshAllTranslations() {
        Map<String, String> response = new HashMap<>();
        try {
            dataInitializationService.translateAllRestaurants();
            response.put("status", "success");
            response.put("message", "모든 식당 번역 작업을 시작했습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "번역 작업 시작 중 오류 발생: " + e.getMessage());
            return ResponseEntity.internalServerError().body(response);
        }
    }
}