# 🍭 Danmatmap (단맛지도)

**Danmatmap**은 단국대학교 주변 맛집 정보를 제공하는 웹 서비스입니다.  
단순 위치 제공이 아닌, 사용자 니즈 기반 **카테고리-태그 분류**,  
**랜덤 추천**, **검색어 자동완성**, **다국어 번역** 등의 기능을 제공합니다.

---

## 👥 주요 사용자

- 학교 근처를 잘 모르는 **신입생 / 편입생 / 교환학생 / 유학생**  
- 무엇을 먹을지 매번 고민하는 모든 학생들

---

## ✨ 주요 기능

- 🍱 **카테고리 기반 필터링**: 카테고리에서 태그를 선택해 원하는 음식점 탐색
- 🎲 **랜덤 가게 추천 기능**: 선택장애 해소를 위한 무작위 가게 추천
- 🔍 **식당 및 태그 검색 기능**: 검색어 자동완성 및 태그 시각화
- 🌍 **다국어 번역 기능**: 사이트의 모든 정보를 한국어, 영어, 일본어, 중국어로 번역
- 📧 **이메일 서비스 연동**: 사이트 관리자에게 문의사항을 이메일로 전송

---

## 🧑‍💻 팀원 소개

| 이름   | 전공           | 역할                                                    |
|--------|----------------|---------------------------------------------------------|
| 이하현 | 소프트웨어학과 | DB 설계 및 관리, 백엔드 개발, 프론트엔드 개발, 자료조사 |
| 권나희 | 산업보안학과   | 프론트엔드 개발, UI 구성, 자료조사                    |
| 조수빈 | 컴퓨터공학과   | 프론트엔드 개발, 자료조사                             |

---

## 🧰 사용 기술 & 오픈소스

### 💻 개발 스택

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Spring Boot
- **Database**: MySQL
- **Infra**: AWS EC2, AWS S3

### 📦 오픈소스 라이브러리

| 이름 | 설명 |
|------|------|
| [Tagify](https://github.com/yairEO/tagify) | 태그 입력 및 필터링 기능 제공 |
| [AutoComplete.js](https://tarekraafat.github.io/autoComplete.js/) | 검색어 자동완성 기능 |
| [LibreTranslate](https://libretranslate.com/) | 번역 API |

### 🌐 외부 API

- **LibreTranslate API** – 텍스트 다국어 번역
- **Kakao Map API** – 지도 표시 및 마커 렌더링

### 🛠 기타 기능

- **mailto** – 브라우저 기본 이메일 클라이언트 연동 (문의 전송)

---

## 📡 전체 API 명세

### 🍽️ Restaurant API 상세 명세

| 기능 | Method | URI | 설명 | Request Body | Request Params | Response |
|------|--------|-----|------|---------------|----------------|----------|
| 식당 전체 조회 | `GET` | `/restaurants` | 모든 식당 정보를 조회합니다. | - | - | `200 OK`: 식당 목록<br>`400 Bad Request` |
| 식당 단건 조회 | `GET` | `/restaurants/{id}` | ID로 식당 하나를 조회합니다. | - | `id` (Path: Long) | `200 OK`: 식당 정보<br>`400 Bad Request` |
| 태그 기반 조회 | `GET` | `/restaurants/by-tag` | 특정 태그가 포함된 식당 목록을 조회합니다. | - | `tagName` (Query: String) | `200 OK`: 식당 목록<br>`400 Bad Request` |
| 식당 번역 생성 | `POST` | `/restaurants/{restaurantId}/translate` | 해당 식당의 다국어 번역을 생성합니다. | - | `restaurantId` (Path: Long) | `200 OK`<br>`400 Bad Request` |
| 식당 태그 추가 | `POST` | `/restaurants/{restaurantId}/tags` | 해당 식당에 새로운 태그를 추가합니다. | `{ "tagName": "string" }` (JSON) | `restaurantId` (Path: Long) | `200 OK`<br>`400 Bad Request` |

---

### 🖼️ Image API

| Method | URI | Description |
|--------|-----|-------------|
| `POST` | `/api/images/upload` | 이미지 파일을 S3 버킷에 업로드 |
| `DELETE` | `/api/images/delete` | S3 버킷에서 이미지 삭제 |

---

### 🌍 Translation API

| Method | URI | Description |
|--------|-----|-------------|
| `POST` | `/api/translation/translate` | 자유 입력값 번역 요청 |
| `POST` | `/api/translation/refresh-all` | 전체 번역 정보 갱신 |

---

## 🗂️ ERD (Entity Relationship Diagram)

> 주요 테이블: Restaurant, Tag, Restaurant_Tag (다대다 관계)

![ERD 예시](https://your-image-url-here.com)

---

## 🏁 프로젝트 결과

> 주요 기능을 이미지로 구성하세요! (아래는 예시 이미지 URL입니다)

### 📌 랜덤 추천

![랜덤 추천](https://your-image-url.com/random-recommendation.png)

---

### 📌 태그 기반 필터링

![태그 필터](https://your-image-url.com/tag-filter.png)

---

### 📌 자동완성 검색

![검색 자동완성](https://your-image-url.com/autocomplete.png)

---

### 📌 다국어 번역

![다국어 번역](https://your-image-url.com/translation.png)

---

### 📌 이메일 연동

![메일 연동](https://your-image-url.com/email.png)

---

## 🏗️ 시스템 아키텍처

```plaintext
[ 사용자 브라우저 ]
       ↓
[ Frontend (HTML/CSS/JS) ]
   ├─ UI 인터페이스
   ├─ 지도 렌더링 (Kakao Maps)
   ├─ 태그 필터링 UI (Tagify)
   ├─ 태그 자동완성 (AutoComplete.js)
   ├─ 관리자에게 메일 전송 (mailto)
   ↓ REST API 호출
[ Backend (Spring Boot) ]
   ├─ API Controller
   ├─ Service (비즈니스 로직)
   ├─ Repository (JPA/Hibernate)
   ├─ AWS S3 업로드 연동
   ├─ 번역 요청 처리 (LibreTranslate API)
   ↔ MySQL (DB 저장)
