# 🍭 Danmatmap (단맛지도)

**Danmatmap**은 단국대학교 주변 맛집 정보를 제공하는 웹 서비스입니다.  
단순 위치 제공이 아닌, 사용자 니즈 기반 **카테고리-태그 분류**,  
**랜덤 추천**, **검색어 자동완성**, **다국어 번역** 등의 기능을 제공합니다.

---

## 📂 GitHub 레포지토리

| 파트 | 링크 |
|------|------|
| 프론트엔드 | [https://github.com/naheekwon/teamproject1](https://github.com/naheekwon/teamproject1) |
| 백엔드 | [https://github.com/hahyunnii/DanMat-Map-backend2](https://github.com/hahyunnii/DanMat-Map-backend2) |


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

| 이름 | 전공 | 역할 | GitHub |
|------|------|------|--------|
| 이하현 | 소프트웨어학과 | DB 설계 및 관리, 백엔드 개발, 프론트엔드 개발, 자료조사 | [@hahyunnii](https://github.com/hahyunnii) |
| 권나희 | 산업보안학과 | 프론트엔드 개발, UI 구성, 자료조사 | [@naheekwon](https://github.com/naheekwon) |
| 조수빈 | 컴퓨터공학과 | 프론트엔드 개발, 자료조사 | [@kimchi-cream](https://github.com/kimchi-cream) |

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

### 🍽️ Restaurant API

| Method | URI | Description |
|--------|-----|-------------|
| `GET` | `/restaurants` | 모든 식당 정보를 조회합니다. |
| `GET` | `/restaurants/{id}` | 특정 ID의 식당 상세 정보를 조회합니다. |
| `GET` | `/restaurants/by-tag?tagName=string` | 특정 태그가 포함된 식당 목록을 조회합니다. |
| `POST` | `/restaurants/{restaurantId}/translate` | 해당 식당의 다국어 번역을 생성합니다. |
| `POST` | `/restaurants/{restaurantId}/tags` | 해당 식당에 새로운 태그를 추가합니다. |

### 🖼️ Image API

| Method | URI | Description |
|--------|-----|-------------|
| `POST` | `/api/images/upload` | 이미지 파일을 S3 버킷에 업로드 |
| `DELETE` | `/api/images/delete` | S3 버킷에서 이미지 삭제 |

### 🌍 Translation API

| Method | URI | Description |
|--------|-----|-------------|
| `POST` | `/api/translation/translate` | 자유 입력값 번역 요청 |
| `POST` | `/api/translation/refresh-all` | 전체 번역 정보 갱신 |

---

## 🗂️ ERD (Entity Relationship Diagram)

> 주요 테이블: Restaurant, Tag, Restaurant_Tag (다대다 관계)

![image](https://github.com/user-attachments/assets/c45d4e91-837e-47e1-9e35-2130f2b7ced7)


---

## 🏁 프로젝트 결과

> 주요 기능 GIF 및 이미지

---

### 📌 카테고리 기반 필터링  
카테고리 메뉴에서 원하는 항목을 선택해 태그를 지정합니다.
https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/1_category.gif

<a href="https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/1_category.gif" target="_blank">
  <img src="https://github.com/user-attachments/assets/3c167544-3a47-4ed5-81d4-37d687f8c253" width="600"/>
</a>

---

### 📌 랜덤 추천  
버튼 클릭 시 무작위로 가게 하나를 추천해줍니다.
https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/2_ramdom.gif

<a href="https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/2_ramdom.gif" target="_blank">
  <img src="https://github.com/user-attachments/assets/469aec23-bfd5-4fbb-b5aa-e83ede90a57c" width="600"/>
</a>

---

### 📌 식당 및 태그를 검색  
카테고리 태그를 직접 선택하거나 자동완성 기능을 통해 식당을 검색할 수 있습니다.
https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/3_tagsearch.gif

**자동완성 (AutoComplete.js)**

<a href="https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/3_tagsearch.gif" target="_blank">
  <img src="https://github.com/user-attachments/assets/ea639c17-14ff-4c0d-b8bc-7193f28fff8a" width="600"/>
</a>

**태그 선택 (Tagify)**

<a href="https://github.com/user-attachments/assets/6f6f6b93-7fe8-4494-8a84-77847a146cdd" target="_blank">
  <img src="https://github.com/user-attachments/assets/6f6f6b93-7fe8-4494-8a84-77847a146cdd" width="600"/>
</a>

**태그**

<a href="https://github.com/user-attachments/assets/189cc4e6-9a39-4eaa-a490-2ea89d00b380" target="_blank">
  <img src="https://github.com/user-attachments/assets/189cc4e6-9a39-4eaa-a490-2ea89d00b380" width="600"/>
</a>



---

### 📌 다국어 번역  
LibreTranslate API를 통해 한국어를 영어, 일본어, 중국어로 자동 번역합니다.
https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/4_translation.gif

**영어 번역 결과**

<a href="https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/4_translation.gif" target="_blank">
  <img src="https://github.com/user-attachments/assets/4bc535e5-5b13-4bdb-8679-45b3b3620299" width="600"/>
</a>

**일어 번역 결과**

<a href="https://github.com/user-attachments/assets/2d8e81df-afc2-477d-bbea-c79820818c33" target="_blank">
  <img src="https://github.com/user-attachments/assets/2d8e81df-afc2-477d-bbea-c79820818c33" width="600"/>
</a>

**중국어 번역 결과**

<a href="https://github.com/user-attachments/assets/03cf2b25-d88c-4016-bd88-2e15b47e3ab0" target="_blank">
  <img src="https://github.com/user-attachments/assets/03cf2b25-d88c-4016-bd88-2e15b47e3ab0" width="600"/>
</a>

---

### 📌 이메일 연동  
이메일 아이콘 클릭 시 기본 메일 앱이 열리며, 관리자에게 문의 가능합니다. (mailto)
https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/5_mailto.gif

<a href="https://danmatmap.s3.ap-southeast-2.amazonaws.com/gif/5_mailto.gif" target="_blank">
  <img src="https://github.com/user-attachments/assets/a4cc765d-2f5d-4e59-abdd-a36d088beaf9" width="600"/>
</a>




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
