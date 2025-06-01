-- 📌 Tag Table
CREATE TABLE tag (
                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                     name VARCHAR(255) NOT NULL
);

-- 📌 Restaurant Table
CREATE TABLE restaurant (
                            id BIGINT AUTO_INCREMENT PRIMARY KEY,
                            title VARCHAR(255) NOT NULL,
                            menu VARCHAR(255),
                            image_url VARCHAR(1000),
                            category VARCHAR(100),
                            address VARCHAR(500),
                            status CHAR(1) DEFAULT 'A'
);

-- 📌 RestaurantTag Table (Many-to-Many Relation)
CREATE TABLE restaurant_tag (
                                id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                restaurant_id BIGINT NOT NULL,
                                tag_id BIGINT NOT NULL,
                                FOREIGN KEY (restaurant_id) REFERENCES restaurant(id) ON DELETE CASCADE,
                                FOREIGN KEY (tag_id) REFERENCES tag(id) ON DELETE CASCADE
);
