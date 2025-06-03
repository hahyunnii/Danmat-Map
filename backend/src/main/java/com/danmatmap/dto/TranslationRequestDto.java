package com.danmatmap.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TranslationRequestDto {
    private String q;           // 번역할 텍스트
    private String source;      // 원본 언어 (auto, ko, en 등)
    private String target;      // 대상 언어 (ko, en, ja, zh 등)
    private String format;      // 텍스트 형식 (text, html)
    private int alternatives;   // 대체 번역 수
    private String api_key;     // API 키
}