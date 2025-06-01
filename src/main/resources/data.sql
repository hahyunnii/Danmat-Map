-- Tag 데이터 삽입
INSERT INTO tag (name) VALUES
                           ('한식'),
                           ('일식'),
                           ('양식'),
                           ('기타'),
                           ('도시락'),
                           ('요거트 아이스크림'),
                           ('빵'),
                           ('치킨'),
                           ('스테이크'),
                           ('파스타타'),
                           ('카공하기 좋은'),
                           ('팀플하기 좋은'),
                           ('단체모임하기 좋은'),
                           ('가성비 좋은'),
                           ('혼밥하기 좋은'),
                           ('주류도 판매하는'),
                           ('토요일 영업하는'),
                           ('일요일 영업하는'),
                           ('이른 아침 식사 가능'),
                           ('늦은 저녁 식사 가능'),
                           ('단체 식사 가능');

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
                                                                               ('이디야커피', '', 'https://danmatmap.s3.ap-southeast-2.amazonaws.com/%EB%8B%A8%EB%A7%9B%EC%A7%80%EB%8F%84+%EA%B0%84%ED%8C%90/09_%EC%9D%B4%EB%94%94%EC%95%BC%EC%BB%A4%ED%94%BC.jpeg', '카페', '경기 용인시 수지구 죽전로144번길 7-5 단대로데오타워 1층 108호', 'A');


-- Restaurant-Tag 연결 (예시)
INSERT INTO restaurant_tag (restaurant_id, tag_id) VALUES
                                                       (1, 3), (1, 17), (1, 18), (1, 14), (1, 15), (1, 21), -- 호식당
                                                       (2, 1), (2, 18), (2, 14), (2, 15),                   -- 한솥도시락
                                                       (3, 6), (3, 11),                                      -- 요거트아이스크림의정석
                                                       (4, 4), (4, 17), (4, 18), (4, 19), (4, 20),           -- 파리바게트
                                                       (5, 3), (5, 17), (5, 18), (5, 21), (5, 16),           -- 피펜
                                                       (6, 4), (6, 17), (6, 18), (6, 20), (6, 14), (6, 16),  -- 꼬꼬마루
                                                       (7, 3), (7, 17), (7, 18), (7, 20), (7, 21), (7, 16),  -- 스테이크드새우
                                                       (8, 3), (8, 17), (8, 18), (8, 20), (8, 15),           -- 미소야
                                                       (9, 11), (9, 12), (9, 13);                            -- 이디야커피
