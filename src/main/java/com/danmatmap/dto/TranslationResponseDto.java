package com.danmatmap.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TranslationResponseDto {
    // API 응답 필드와 일치하도록 설정
    @JsonProperty("translatedText")
    private String translatedText;

    private List<Alternative> alternatives;

    public void setTranslatedText(String translatedText) {
        this.translatedText = translatedText;
    }

    public String getTranslatedText() {
        return this.translatedText;
    }

    @Data
    public static class Alternative {
        private String text;
        private double confidence;
    }
}