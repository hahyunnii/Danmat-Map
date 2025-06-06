-- Tag 데이터 삽입
-- INSERT INTO tag (name) VALUES
--                            ('한식'),
--                            ('일식'),
--                            ('양식'),
--                            ('기타'),
--                            ('도시락'),
--                            ('요거트 아이스크림'),
--                            ('빵'),
--                            ('치킨'),
--                            ('스테이크'),
--                            ('파스타타'),
--                            ('카공하기 좋은'),
--                            ('팀플하기 좋은'),
--                            ('단체모임하기 좋은'),
--                            ('가성비 좋은'),
--                            ('혼밥하기 좋은'),
--                            ('주류도 판매하는'),
--                            ('토요일 영업하는'),
--                            ('일요일 영업하는'),
--                            ('이른 아침 식사 가능'),
--                            ('늦은 저녁 식사 가능'),
--                            ('단체 식사 가능');

-- Restaurant-Tag 연결 (예시)
-- INSERT INTO restaurant_tag (restaurant_id, tag_id) VALUES
--                                                        (1, 3), (1, 17), (1, 18), (1, 14), (1, 15), (1, 21), -- 호식당
--                                                        (2, 1), (2, 18), (2, 14), (2, 15),                   -- 한솥도시락
--                                                        (3, 6), (3, 11),                                      -- 요거트아이스크림의정석
--                                                        (4, 4), (4, 17), (4, 18), (4, 19), (4, 20),           -- 파리바게트
--                                                        (5, 3), (5, 17), (5, 18), (5, 21), (5, 16),           -- 피펜
--                                                        (6, 4), (6, 17), (6, 18), (6, 20), (6, 14), (6, 16),  -- 꼬꼬마루
--                                                        (7, 3), (7, 17), (7, 18), (7, 20), (7, 21), (7, 16),  -- 스테이크드새우
--                                                        (8, 3), (8, 17), (8, 18), (8, 20), (8, 15),           -- 미소야
--                                                        (9, 11), (9, 12), (9, 13);                            -- 이디야커피


-- Tag 데이터 삽입 (UI 기준 카테고리/필터 완전 반영)
INSERT INTO tag (name) VALUES
                           -- 🍽 음식 종류
                           ('한식'),
                           ('중식'),
                           ('일식'),
                           ('양식'),
                           ('아시안'),
                           ('기타'),

                           -- 🍴 음식점 필터
                           ('혼밥하기 좋은'),
                           ('단체 식사 가능'),
                           ('단체 포장/예약 가능'),
                           ('가성비 좋은'),
                           ('주류도 판매하는'),
                           ('토요일 영업하는'),
                           ('일요일 영업하는'),
                           ('이른 아침 식사 가능'),
                           ('늦은 저녁 식사 가능'),

                           -- ☕ 카페 필터
                           ('카공하기 좋은'),
                           ('팀플하기 좋은'),
                           ('가성비 좋은'),
                           ('단체 모임하기 좋은'),

                           -- 🍺 주점 필터
                           ('안주가 맛있는');


-- Restaurant 데이터 삽입
INSERT INTO restaurant (title, menu, image_url, category, address, status) VALUES
                                                                               ('호식당', '덮밥', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/01_%ED%98%B8%EC%8B%9D%EB%8B%B9.jpeg', '음식점', '경기 용인시 수지구 죽전로 136 월드프라자 1층 106호', 'A'),
                                                                               ('한솥도시락', '도시락', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/02_%ED%95%9C%EC%86%A5%EB%8F%84%EC%8B%9C%EB%9D%BD.jpeg', '음식점', '경기 용인시 수지구 죽전로 140 남전빌딩 1층 103호', 'A'),
                                                                               ('요거트아이스크림의정석', '요거트 아이스크림', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/03_%EC%9A%94%EA%B1%B0%ED%8A%B8%EC%95%84%EC%9D%B4%EC%8A%A4%ED%81%AC%EB%A6%BC%EC%9D%98%EC%A0%95%EC%84%9D.jpeg', '카페', '경기 용인시 수지구 죽전로 150 109호', 'A'),
                                                                               ('파리바게트', '빵', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/04_%ED%8C%8C%EB%A6%AC%EB%B0%94%EA%B2%8C%ED%8A%B8.png', '음식점', '경기 용인시 수지구 죽전로 150 단대프라자3 111,112호', 'A'),
                                                                               ('피펜', '파스타타', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/05_%ED%94%BC%ED%8E%9C.jpeg', '음식점', '경기 용인시 수지구 죽전로 150-1 단대프라자 4층 401~402호', 'A'),
                                                                               ('꼬꼬마루', '치킨', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/06_%EA%BC%AC%EA%BC%AC%EB%A7%88%EB%A3%A8.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 4-13', 'A'),
                                                                               ('스테이크드새우', '스테이크, 파스타', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/07_%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC%EB%93%9C%EC%83%88%EC%9A%B0.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 4-5', 'A'),
                                                                               ('미소야', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/07_%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC%EB%93%9C%EC%83%88%EC%9A%B0.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 4-5 1층', 'A'),
                                                                               ('이디야커피', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/09_%EC%9D%B4%EB%94%94%EC%95%BC%EC%BB%A4%ED%94%BC.jpeg', '카페', '경기 용인시 수지구 죽전로144번길 7-5 단대로데오타워 1층 108호', 'A'),
                                                                               ('태국식당팟퐁', '탕면, 팟퐁커리', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../10_팟퐁.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 7-5 단대로데오타워 1층 110호', 'A'),

                                                                               ('매취랑', '감자탕', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../11_매취랑.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 7-5 1층', 'A'),
                                                                               ('이모네산골', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../12_이모네산골.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 8-16', 'A'),
                                                                               ('단대포차', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../13_단대포차.jpeg', '주점', '경기 용인시 수지구 죽전로144번길 8-14', 'A'),
                                                                               ('소소네', '연탄불고기, 비빔우동', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../14_소소네.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 8-10 1층', 'A'),
                                                                               ('1357쭈꾸미&삼겹살', '쭈꾸미, 삼겹살', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../15_1357쭈꾸미.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 8-2 1층', 'A'),
                                                                               ('홍콩반점0410', '짜장면, 짬뽕', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../16_홍콩반점0410.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 7-5 로데오타워 1층 106호', 'A'),
                                                                               ('빨강파이프', '분식', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../17_빨강파이프.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 7-5 죽전로데오타워 102-1호', 'A'),
                                                                               ('역전우동0410', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../18_역전우동0410.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 7-5 101호', 'A'),
                                                                               ('스윗모먼트', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../19_스윗모먼트.jpeg', '카페', '경기 용인시 수지구 죽전로144번길 8-7 1층', 'A'),
                                                                               ('박가네명가순두부', '두부', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/.../20_순두부.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 8 1층', 'A'),

                                                                                ('양궈푸마라탕', '마라탕', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/21_%EC%96%91%EA%B6%88%ED%91%B8%EB%A7%88%EB%9D%BC%ED%83%95.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 7-8 1층 101호', 'A'),
                                                                                ('청년수산', '회', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/22_%EC%B2%AD%EB%85%84%EC%88%98%EC%82%B0.jpeg', '기타', '경기 용인시 수지구 죽전로144번길 7-10 1층', 'A'),
                                                                                ('천향마라탕', '마라탕', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/23_%EC%B2%9C%ED%96%A5%EB%A7%88%EB%9D%BC%ED%83%95.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 7-14 1층', 'A'),
                                                                                ('중독성떡볶이', '분식', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/24_%EC%A4%91%EB%8F%85%EC%84%B1%EB%96%A1%EB%B3%B6%EC%9D%B4.jpeg', '기타', '경기 용인시 수지구 죽전동 1450', 'A'),
                                                                                ('작은어촌', '회', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/25_%EC%9E%91%EC%9D%80%EC%96%B4%EC%B4%8C.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 12-14', 'A'),
                                                                               ('동아리2029', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/26_%EB%8F%99%EC%95%84%EB%A6%AC2029.jpg', '주점', '경기 용인시 수지구 죽전로144번길 12-12 1층', 'A'),
                                                                               ('일미돈가스', '돈까스', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/27_%EC%9D%BC%EB%AF%B8%EB%8F%88%EA%B9%8C%EC%8A%A4.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 12-8', 'A'),
                                                                               ('혜자', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/28_%ED%98%9C%EC%9E%90.jpeg', '주점', '경기 용인시 수지구 죽전로144번길 12-6', 'A'),
                                                                               ('곰포차', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/29_%EA%B3%B0%ED%8F%AC%EC%B0%A8.jpeg', '주점', '경기 용인시 수지구 죽전로144번길 10 1층', 'A'),
                                                                               ('도쿠', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/30_%EB%8F%84%EC%BF%A0.jpeg', '주점', '경기 용인시 수지구 죽전로144번길 11-7 1층', 'A'),

                                                                               ('옹고집', '쌈밥, 돼지 두루치기', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/31_옹고집.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 11-9 1층', 'A'),
                                                                               ('단대골목', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/32_단대골목.jpeg', '주점', '경기 용인시 수지구 죽전로144번길 12-11 1층', 'A'),
                                                                               ('퍼스트네팔 레스토랑', '인도음식', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/33_퍼스트네팔 레스토랑.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 12-7 1층', 'A'),
                                                                               ('맘스터치', '치킨버거', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/34_맘스터치.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 12-1 1층', 'A'),
                                                                               ('고씨네', '카레돈까스', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/35_고씨네.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 16-8 1층', 'A'),
                                                                               ('낭만단대', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/36_낭만단대.jpeg', '주점', '경기 용인시 수지구 죽전로144번길 14', 'A'),
                                                                               ('단국신화', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/37_단국신화.jpeg', '주점', '경기 용인시 수지구 죽전로144번길 15-3 1층', 'A'),
                                                                               ('고래심줄 생막걸리', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/38_고래심줄 생막걸리.jpeg', '주점', '경기 용인시 수지구 죽전로144번길 15-5', 'A'),
                                                                               ('신쭈꾸미', '쭈꾸미', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/39_%EC%8B%A0%EC%AD%88%EA%BE%B8%EB%AF%B8.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 15-7 1층', 'A'),
                                                                               ('크리에이티브커피', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/40_%ED%81%AC%EB%A6%AC%EC%97%90%EC%9D%B4%ED%8B%B0%EB%B8%8C%EC%BB%A4%ED%94%BC.jpeg', '카페', '경기 용인시 수지구 죽전로144번길 15-9 1층', 'A'),

                                                                               ('선영이네 김치짜글이', '김치짜글이, 고기튀김', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/41_%EC%84%A0%EC%98%81%EC%9D%B4%EB%84%A4%EA%B9%80%EC%B9%98%EC%A7%9C%EA%B8%80%EC%9D%B4.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 15-13 1층', 'A'),
                                                                               ('언니네주막', NULL, 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/42_%EC%96%B8%EB%8B%88%EB%84%A4%EC%A3%BC%EB%A7%89.jpeg', '주점', '경기 용인시 수지구 죽전로144번길 17 1층', 'A'),
                                                                               ('트리아농', NULL, 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/43_%ED%8A%B8%EB%A6%AC%EC%95%84%EB%86%8D.jpeg', '카페', '경기 용인시 수지구 죽전로144번길 15-4 1층', 'A'),
                                                                               ('아지트', NULL, 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/44_%EC%95%84%EC%A7%80%ED%8A%B8.jpeg', '카페', '경기 용인시 수지구 죽전로144번길 15-10 1층', 'A'),
                                                                               ('1319', NULL, 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/45_1319.jpeg', '카페', '경기 용인시 수지구 죽전로144번길 15-14 1층', 'A'),
                                                                               ('스타벅스', NULL, 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/46_%EC%8A%A4%ED%83%80%EB%B2%85%EC%8A%A4.jpeg', '카페', '경기 용인시 수지구 죽전로168번길 18', 'A'),
                                                                               ('오블리끄', '파스타', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/47_%EC%98%A4%EB%B8%94%EB%A6%AC%EB%81%84.png', '음식점', '경기 용인시 수지구 죽전로168번길 15-2 1층', 'A'),
                                                                               ('쿠치나디오네스또', '파스타', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/48_%EC%BF%A0%EC%B9%98%EB%82%98%EB%94%94%EC%98%A4%EB%84%A4%EC%8A%A4%EB%98%90.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 15-6 2층', 'A'),
                                                                               ('고수찜닭', '찜닭', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/49_%EA%B3%A0%EC%88%98%EC%B0%9C%EB%8B%AD.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 19 1층', 'A'),
                                                                               ('라잍', '아쌈밀크티', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/50_%EB%9D%BC%EC%9E%8D.jpeg', '카페', '경기 용인시 수지구 죽전로168번길 19-3 1층', 'A'),

                                                                               ('하이로왕마라탕', '마라탕', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/51_%ED%95%98%EC%9D%B4%EB%A1%9C%EC%99%95%EB%A7%88%EB%9D%BC%ED%83%95.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 19-10 1층', 'A'),
                                                                               ('다함', NULL, 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/52_%EB%8B%A4%ED%95%A8.jpeg', '카페', '경기 용인시 수지구 죽전로168번길 19-8', 'A'),
                                                                               ('내가찜한닭', '찜닭', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/53_%EB%82%B4%EA%B0%80%EC%B0%9C%ED%95%9C%EB%8B%AD.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 21 1층', 'A'),
                                                                               ('해피덮', '덮밥', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/54_%ED%95%B4%ED%94%BC%EB%8D%AE.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 19-2 1층', 'A'),
                                                                               ('포후에', '베트남쌀국수', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/55_%ED%8F%AC%ED%9B%84%EC%97%90.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 23 1층', 'A'),
                                                                               ('베이크슈', '빵', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/56_%EB%B2%A0%EC%9D%B4%ED%81%AC%EC%8A%88.jpeg', '카페', '경기 용인시 수지구 죽전로168번길 25 1층', 'A'),
                                                                               ('보통카페', NULL, 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/57_%EB%B3%B4%ED%86%B5%EC%B9%B4%ED%8E%98.jpeg', '카페', '경기 용인시 수지구 죽전로168번길 27 1층', 'A'),
                                                                               ('홍춘', '짬뽕', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/58_%ED%99%8D%EC%B6%98.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 29 1층', 'A'),
                                                                               ('카페168', NULL, 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/59_%EC%B9%B4%ED%8E%98168.jpeg', '카페', '경기 용인시 수지구 죽전로168번길 35 1층', 'A'),
                                                                               ('다린', '이탈리안', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/60_%EB%8B%A4%EB%A6%B0.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 39', 'A');

--                                                                                ('쫄면에빠진닭', '치킨', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/61_%EC%AB%84%EB%A9%B4%EC%97%90%EB%B9%A0%EC%A7%84%EB%8B%AD.jpeg', '음식점', '경기 용인시 수지구 죽전로 172 단국프라자 1층 104호', 'A'),
--                                                                                ('르헤브드베베', '마카롱', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/62_%EB%A5%B4%ED%97%A4%EB%B8%8C%EB%93%9C%EB%B2%A0%EB%B2%A0.jpeg', '카페', '경기 용인시 수지구 죽전로168번길 3-3', 'A'),
--                                                                                ('얌샘김밥', '분식', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/63_%EC%96%8C%EC%83%98%EA%B9%80%EB%B0%A5.jpeg', '음식점', '경기 용인시 수지구 죽전로 172 단국프라자 110호', 'A'),
--                                                                                ('굽네치킨', '치킨', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/64_%EA%B5%BD%EB%84%A4%EC%B9%98%ED%82%A8.jpeg', '음식점', '경기 용인시 수지구 죽전로 164 화이트존 1층 102호', 'A'),
--                                                                                ('예촌왕돌판구이', '돼지고기, 찌개', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/65_%EC%98%88%EC%B4%8C%EC%99%95%EB%8F%8C%ED%8C%90%EA%B5%AC%EC%9D%B4.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 7 2층', 'A'),
--                                                                                ('참바지락칼제비', '칼국수', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/66_%EC%B0%B8%EB%B0%94%EC%A7%80%EB%9D%BD%EC%B9%BC%EC%A0%9C%EB%B9%84.jpeg', '음식점', '경기 용인시 수지구 죽전로168번길 7 승은프라자 1층', 'A'),
--                                                                                ('신통치킨', '치킨', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/67_%EC%8B%A0%ED%86%B5%EC%B9%98%ED%82%A8.jpeg', '음식점', '경기 용인시 수지구 죽전로 136 월드프라자 101호', 'A'),
--                                                                                ('커피프리덤', '커피, 빙수, 아이스크림', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/68_%EC%BB%A4%ED%94%BC%ED%94%84%EB%A6%AC%EB%8D%A4.jpeg', '카페', '경기 용인시 수지구 죽전로 101호', 'A'),
--                                                                                ('꽃보다마카롱', '마카롱', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/69_%EA%BD%83%EB%B3%B4%EB%8B%A4%EB%A7%88%EC%B9%B4%EB%A1%B1.jpeg', '카페', '경기 용인시 수지구 죽전로 142 유니프라자 104호', 'A'),
--                                                                                ('투고박스', '베트남 국수', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/70_%ED%88%AC%EA%B3%A0%EB%B0%95%EC%8A%A4.jpeg', '음식점', '경기 용인시 수지구 죽전로 142 유니프라자 1층', 'A'),
--
--                                                                                ('타코하라', '타코야키', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/71_%ED%83%80%EC%BD%94%ED%95%98%EB%9D%BC.jpeg', '음식점', '경기 용인시 수지구 죽전로 146 1층 104호', 'A'),
--                                                                                ('이삭토스트', '토스트', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/72_%EC%9D%B4%EC%82%AD%ED%86%A0%EC%8A%A4%ED%8A%B8.jpeg', '음식점', '경기 용인시 수지구 죽전로 150 단대프라자3 105호', 'A'),
--                                                                                ('명랑핫도그', '핫도그', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/73_%EB%AA%85%EB%9F%89%ED%95%AB%EB%8F%84%EA%B7%B8.jpeg', '음식점', '경기 용인시 수지구 죽전로 150 단대프라자 3차 103호', 'A'),
--                                                                                ('백소정', '소바, 돈카츠', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/74_%EB%B0%B1%EC%86%8C%EC%A0%95.jpeg', '음식점', '경기 용인시 수지구 죽전로 150 단대프라자3 1층 101호', 'A'),
--                                                                                ('겐코쇼쿠도', '라멘, 동', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/75_%EA%B2%90%EC%BD%94%EC%87%BC%EC%BF%A0%EB%8F%84.jpeg', '음식점', '경기 용인시 수지구 죽전로 150-1 1층 105호', 'A'),
--                                                                                ('동북양꼬치', '양꼬치', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/76_%EB%8F%99%EB%B6%81%EC%96%91%EA%BC%AC%EC%B9%98.jpeg', '음식점', '경기 용인시 수지구 죽전로 150-1 단대프라자2 2층', 'A'),
--                                                                                ('컴포즈', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/77_%EC%BB%B4%ED%8F%AC%EC%A6%88.jpeg', '카페', '경기 용인시 수지구 죽전로 150-1 1층 102~103호', 'A'),
--                                                                                ('메가커피', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/78_%EB%A9%94%EA%B0%80%EC%BB%A4%ED%94%BC.jpeg', '카페', '경기 용인시 수지구 죽전로 150 단대프라자3 1층 107호', 'A'),
--                                                                                ('6월의 강', '파스타', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/79_6%EC%9B%94%EC%9D%98%EA%B0%95.jpeg', '음식점', '경기 용인시 수지구 죽전로 164', 'A'),
--                                                                                ('파스타하우스', '파스타타', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/80_%ED%8C%8C%EC%8A%A4%ED%83%80%ED%95%98%EC%9A%B0%EC%8A%A4.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 7-2 1층', 'A'),
--
--                                                                                ('스낵얌', '돈까스', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/81_%EC%8A%A4%EB%82%B5%EC%96%8C.jpeg', '음식점', '경기 용인시 수지구 죽전로144번길 7-6 1층', 'A'),
--                                                                                ('새날', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/82_%EC%83%88%EB%82%A0.jpeg', '카페', '경기 용인시 수지구 죽전로 152', 'A'),
--                                                                                ('아름다운커피', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/83_%EC%95%84%EB%A6%84%EB%8B%A4%EC%9A%B4%EC%BB%A4%ED%94%BC.jpeg', '카페', '경기 용인시 수지구 죽전로 152 단국대학교 죽전캠퍼스 상경관 2층', 'A'),
--                                                                                ('르호봇', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/84_%EB%A5%B4%ED%98%B8%EB%B4%87.jpeg', '카페', '경기 용인시 수지구 죽전로 152 대학원동 1층', 'A'),
--                                                                                ('카페더베어', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/85_%EC%B9%B4%ED%8E%98%EB%8D%94%EB%B2%A0%EC%96%B4.jpeg', '카페', '경기 용인시 수지구 죽전로 152', 'A');



INSERT INTO restaurant_tag (restaurant_id, tag_id) VALUES
                                                       (1, 3), (1, 12), (1, 13), (1, 10), (1, 7), (1, 8),          -- 호식당
                                                       (2, 1), (2, 13), (2, 10), (2, 7),                          -- 신전떡볶이
                                                       (3, 17),                                                  -- 이디야커피
                                                       (4, 6), (4, 12), (4, 13), (4, 14), (4, 15),                -- 샐러디
                                                       (5, 4), (5, 12), (5, 13), (5, 8), (5, 11),                 -- 홍대돈부리
                                                       (6, 6), (6, 12), (6, 13), (6, 15), (6, 10), (6, 11),       -- 분식애
                                                       (7, 4), (7, 12), (7, 13), (7, 15), (7, 8), (7, 11),        -- 더플레이스
                                                       (8, 3), (8, 12), (8, 13), (8, 15), (8, 7),                 -- 미소야
                                                       (9, 16), (9, 17), (9, 18),                                 -- 투썸플레이스
                                                       (10, 5), (10, 12), (10, 7),                         -- 태국식당팟퐁

                                                       (11, 1), (11, 12), (11, 13), (11, 14), (11, 15), (11, 7), (11, 8), (11, 11),  -- 매취랑
                                                       (12, 1), (12, 12), (12, 7),                         -- 이모네산골
                                                       (14, 1), (14, 12), (14, 15), (14, 7), (14, 8), (14, 11),  -- 소소네
                                                       (15, 1), (15, 12), (15, 13), (15, 15), (15, 8), (15, 11),  -- 1357쭈꾸미&삼겹살
                                                       (16, 2), (16, 12), (16, 13), (16, 15), (16, 10), (16, 7), (16, 8), (16, 11),  -- 홍콩반점0410
                                                       (17, 6), (17, 12), (17, 13), (17, 10), (17, 7), (17, 11),  -- 빨강파이프
                                                       (18, 3), (18, 12), (18, 13), (18, 15), (18, 10), (18, 7), (18, 8),  -- 역전우동0410
                                                       (19, 17), (19, 18),                                 -- 스윗모먼트
                                                       (20, 1), (20, 12), (20, 15), (20, 10), (20, 7), (20, 11),  -- 박가네명가순두부

                                                       (21, 2), (21, 12), (21, 13), (21, 15), (21, 7), (21, 8), (21, 11),   -- 양궈푸마라탕
                                                       (22, 6), (22, 12), (22, 15), (22, 8), (22, 11),                      -- 청년수산
                                                       (23, 2), (23, 12), (23, 13), (23, 15), (23, 10), (23, 7), (23, 8), (23, 11),  -- 천향마라탕
                                                       (24, 6), (24, 15), (24, 10), (24, 7),                                -- 중독성떡볶이
                                                       (25, 3), (25, 12), (25, 15), (25, 10), (25, 8), (25, 11),            -- 작은어촌
                                                       (27, 3), (27, 12), (27, 13), (27, 15), (27, 10), (27, 7),            -- 일미돈가스

                                                        -- 옹고집
                                                        (31, 1), (31, 12), (31, 10),
                                                        -- 퍼스트네팔 레스토랑
                                                        (33, 5), (33, 12), (33, 13), (33, 15), (33, 10), (33, 8), (33, 11),
                                                        -- 맘스터치
                                                        (34, 6), (34, 12), (34, 13), (34, 10), (34, 7), (34, 9),
                                                        -- 고씨네
                                                        (35, 3), (35, 12), (35, 10), (35, 7), (35, 8), (35, 11),
                                                        -- 신쭈꾸미
                                                        (39, 1), (39, 12), (39, 15), (39, 10), (39, 8), (39, 11),
                                                        -- 크리에이티브커피
                                                        (40, 17),

                                                        (41, 1), (41, 10), (41, 7), (41, 8), (41, 11), -- 선영이네 김치짜글이
                                                        (43, 17), (43, 18),                          -- 트리아농
                                                        (44, 16),                                    -- 아지트
                                                        (45, 16), (45, 17), (45, 18),                -- 1319
                                                        (46, 16), (46, 17), (46, 18),                         -- 스타벅스
                                                        (47, 3), (47, 13), (47, 14), (47, 11),                -- 오블리끄
                                                        (48, 3), (48, 13),                                   -- 쿠치나디오네스또
                                                        (49, 1), (49, 13), (49, 14), (49, 6), (49, 10), (49, 8), (49, 11), -- 고수찜닭
                                                        (50, 17), (50, 18),                                   -- 라잍

                                                       (51, 2), (51, 14), (51, 15), (51, 7), (51, 8), (51, 11),          -- 하이로왕마라탕
                                                       (52, 16),                                                        -- 다함
                                                       (53, 1), (53, 13), (53, 10), (53, 8), (53, 11),                   -- 내가찜한닭
                                                       (54, 1), (54, 12), (54, 10), (54, 7), (54, 8),                    -- 해피덮
                                                       (55, 4), (55, 12), (55, 13), (55, 7),                             -- 포후에
                                                       (56, 18),                                  -- 베이크슈: 단체 모임하기 좋은
                                                       (57, 16), (57, 17), (57, 18),              -- 보통카페: 카공, 팀플, 단체 모임
                                                       (58, 3), (58, 12), (58, 13), (58, 8), (58, 11), -- 홍춘: 중식, 토/일, 단체, 주류
                                                       (59, 16), (59, 17), (59, 18),              -- 카페168: 카공, 팀플, 단체 모임
                                                       (60, 5), (60, 12), (60, 8), (60, 11);       -- 다린: 양식, 토요일, 단체, 주류

--                                                        (61, 6), (61, 12), (61, 13), (61, 15), (61, 9),           -- 쫄면에빠진닭: 기타, 토요일, 일요일, 늦은 저녁, 단체 포장
--                                                        (62, 17), (62, 18),                                      -- 르헤브드베베: 팀플, 단체 모임
--                                                        (63, 6), (63, 12), (63, 13), (63, 10), (63, 7),           -- 얌샘김밥: 기타, 토요일, 일요일, 가성비, 혼밥
--                                                        (64, 6), (64, 12), (64, 13), (64, 15), (64, 8), (64, 9),  -- 굽네치킨: 기타, 토요일, 일요일, 늦은 저녁, 단체 식사, 단체 포장
--                                                        (65, 1), (65, 12), (65, 13), (65, 15), (65, 8), (65, 11), -- 예촌왕돌판구이: 한식, 토요일, 일요일, 늦은 저녁, 단체 식사, 주류
--                                                        (66, 1), (66, 12), (66, 15), (66, 10), (66, 8), (66, 11),         -- 참바지락칼제비
--                                                        (67, 1), (67, 12), (67, 15), (67, 10), (67, 8), (67, 9), (67, 11),-- 신통치킨
--                                                        (68, 16),                                                       -- 커피프리덤
--                                                        (69, 16),                                                       -- 꽃보다마카롱
--                                                        (70, 5), (70, 13), (70, 10), (70, 7), (70, 9),                  -- 투고박스
--
--                                                        (71, 3), (71, 12), (71, 13), (71, 9),                             -- 타코하라
--                                                        (72, 6), (72, 12), (72, 10), (72, 14), (72, 7), (72, 9),          -- 이삭토스트
--                                                        (73, 6), (73, 12), (73, 13), (73, 15), (73, 10), (73, 9),         -- 명랑핫도그
--                                                        (74, 3), (74, 12), (74, 7),                                       -- 백소정
--                                                        (75, 3), (75, 12), (75, 7), (75, 11),                             -- 겐코쇼쿠도
--                                                         (76, 2), (76, 12), (76, 8),                             -- 동북양꼬치
--                                                         (77, 16), (77, 17), (77, 18), (77, 10),                 -- 컴포즈
--                                                         (78, 16), (78, 17), (78, 18), (78, 10),                 -- 메가커피
--                                                         (79, 4), (79, 12), (79, 13), (79, 7), (79, 11),         -- 6월의 강
--                                                         (80, 4), (80, 13), (80, 10), (80, 7), (80, 11),         -- 파스타하우스
--
--                                                        (81, 3), (81, 12), (81, 13), (81, 10), (81, 7), (81, 8),         -- 스낵얌
--                                                        (82, 10),                                                       -- 새날
--                                                        (83, 10),                                                       -- 아름다운커피
--                                                        (84, 16), (84, 17), (84, 18), (84, 10),                         -- 르호봇
--                                                        (85, 16), (85, 17);                                             -- 카페더베어

