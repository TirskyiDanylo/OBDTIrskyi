DROP TABLE IF EXISTS post_tags;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS post_types;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE post_types (
    type_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE posts (
    post_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INTEGER NOT NULL,
    type_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_post_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_post_type FOREIGN KEY (type_id) REFERENCES post_types(type_id) ON DELETE RESTRICT
);

CREATE TABLE comments (
    comment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_comment_post FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    CONSTRAINT fk_comment_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE tags (
    tag_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tag_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (post_id, tag_id),
    CONSTRAINT fk_pt_post FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    CONSTRAINT fk_pt_tag FOREIGN KEY (tag_id) REFERENCES tags(tag_id) ON DELETE CASCADE
);

INSERT INTO post_types (type_name) VALUES 
('General'),
('Guide'),
('Review'),
('News');

INSERT INTO users (nickname, email, password) VALUES 
('ProGamer2024', 'pro@game.com', 'pass123'),
('ReviewMaster', 'rev@game.com', 'securePass'),
('NoobSlayer', 'slayer@game.com', 'qwerty');

INSERT INTO posts (user_id, type_id, title, content) VALUES 
(1, 2, 'How to beat the final boss', 'Use fire arrows and dodge left...'),
(2, 3, 'Elden Ring Review', 'This game is masterpiece but hard...'),
(1, 4, 'Patch 1.05 Released', 'Bug fixes and balance changes included.');

INSERT INTO tags (tag_name) VALUES 
('RPG'), ('Strategy'), ('Hardcore');

INSERT INTO post_tags (post_id, tag_id) VALUES 
(1, 1),
(1, 3),
(2, 1);

INSERT INTO comments (post_id, user_id, comment_text) VALUES 
(1, 3, 'Thanks for the guide!'),
(2, 1, 'Totally agree with you.');
