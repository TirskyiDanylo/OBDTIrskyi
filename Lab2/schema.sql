-- =============================================
-- 1. СТВОРЕННЯ ТАБЛИЦЬ (DDL)
-- =============================================

-- 1.1. Таблиця користувачів
-- Зберігає нікнейми, пошти та дати реєстрації гравців [cite: 126, 181]
CREATE TABLE users (
    user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE CHECK (length(nickname) > 0),
    email VARCHAR(100) NOT NULL UNIQUE CHECK (length(email) > 0),
    password VARCHAR(255) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 1.2. Таблиця тегів
-- Категорії для класифікації ігрового контенту [cite: 129, 197]
CREATE TABLE tags (
    tag_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tag_name VARCHAR(50) NOT NULL UNIQUE CHECK (length(tag_name) > 0)
);

-- 1.3. Таблиця публікацій
-- Статті, огляди та новини від користувачів [cite: 127, 185]
CREATE TABLE posts (
    post_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(200) NOT NULL CHECK (length(title) > 0),
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Зовнішній ключ на автора [cite: 134, 187]
    CONSTRAINT fk_post_author 
        FOREIGN KEY (user_id) 
        REFERENCES users(user_id) 
        ON DELETE CASCADE
);

-- 1.4. Таблиця коментарів
-- Обговорення під публікаціями [cite: 128, 191]
CREATE TABLE comments (
    comment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    comment_text TEXT NOT NULL CHECK (length(trim(comment_text)) > 0),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Видалення поста видаляє всі коментарі 
    CONSTRAINT fk_comment_post
        FOREIGN KEY (post_id) 
        REFERENCES posts(post_id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_comment_author
        FOREIGN KEY (user_id) 
        REFERENCES users(user_id) 
        ON DELETE CASCADE
);

-- 1.5. Таблиця зв'язку Пост-Тег
-- Реалізація зв'язку "Багато до багатьох" [cite: 159, 208, 209]
CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    
    PRIMARY KEY (post_id, tag_id),
    
    CONSTRAINT fk_pt_post
        FOREIGN KEY (post_id) 
        REFERENCES posts(post_id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_pt_tag
        FOREIGN KEY (tag_id) 
        REFERENCES tags(tag_id) 
        ON DELETE CASCADE
);

-- =============================================
-- 2. НАПОВНЕННЯ ДАНИМИ (DML / INSERT)
-- =============================================

-- 2.1. Додаємо користувачів [cite: 181, 211]
INSERT INTO users (nickname, email, password) VALUES 
('Tirsky_D', 'tirsky@kpi.ua', 'pass1'),
('Ferenchuk_Z', 'ferenchuk@kpi.ua', 'pass2'),
('Gamer1', 'g1@ukr.net', 'pass3');

-- 2.2. Додаємо теги [cite: 197, 199]
INSERT INTO tags (tag_name) VALUES ('RPG'), ('Cyberpunk'), ('Update'), ('Reviews');

-- 2.3. Додаємо публікації [cite: 185, 203]
INSERT INTO posts (user_id, title, content) VALUES 
(1, 'Cyberpunk 2077 Update', 'The new patch fixes major bugs...'),
(2, 'The Witcher 4 Saga', 'CD Projekt Red confirmed the new game development.'),
(1, 'Best Indie Games 2026', 'A list of hidden gems this year.');

-- 2.4. Додаємо коментарі [cite: 191, 205]
INSERT INTO comments (post_id, user_id, comment_text) VALUES 
(1, 2, 'Finally! Performance is much better now.'),
(2, 1, 'Hope they bring back Geralt.');

-- 2.5. Прив'язуємо теги до постів [cite: 200, 208]
INSERT INTO post_tags (post_id, tag_id) VALUES (1, 2), (1, 3), (2, 1);
