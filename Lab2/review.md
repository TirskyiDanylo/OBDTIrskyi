🎮 Gaming Social Network Database
Цей репозиторій містить архітектуру бази даних для ігрової соціальної платформи. Система дозволяє користувачам створювати публікації (огляди, новини), класифікувати їх за допомогою тегів та обговорювати контент у коментарях.

🏗️ Архітектура та ER-діаграма
Схема побудована на реляційній моделі з дотриманням нормальних форм. Вона включає зв'язки 1:N (User → Posts, Post → Comments) та M:N (Posts ↔ Tags).

> Примітка: На схемі відображені основні сутності та логічні зв'язки між ними.

📊 Опис структури даних
1. Основні таблиці

Таблиця	Опис	Ключові особливості
users	Профілі гравців	Унікальні нікнейми та email, автоматична дата реєстрації.
posts	Контент (статті/новини)	Прив'язка до автора, підтримка каскадного видалення.
comments	Обговорення	Зв'язок "автор-пост", валідація тексту на порожні значення.
tags	Категорії	Унікальні назви для фільтрації ігор (RPG, FPS тощо).
2. Технічні рішення

Складені ключі: У таблиці post_tags використано PRIMARY KEY (post_id, tag_id) для уникнення дублювання тегів у одному пості.

Цілісність даних: Використано обмеження CHECK для валідації довжини рядків та NOT NULL для обов'язкових полів.

Автоматизація: Поля reg_date та created_at заповнюються автоматично через DEFAULT CURRENT_TIMESTAMP.

💻 SQL Реалізація
SQL
-- Створення таблиць (DDL)
CREATE TABLE users (
    user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE CHECK (length(nickname) > 0),
    email VARCHAR(100) NOT NULL UNIQUE CHECK (length(email) > 0),
    password VARCHAR(255) NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tags (
    tag_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tag_name VARCHAR(50) NOT NULL UNIQUE CHECK (length(tag_name) > 0)
);

CREATE TABLE posts (
    post_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(200) NOT NULL CHECK (length(title) > 0),
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_post_author FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (post_id, tag_id),
    CONSTRAINT fk_pt_post FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    CONSTRAINT fk_pt_tag FOREIGN KEY (tag_id) REFERENCES tags(tag_id) ON DELETE CASCADE
);

-- Наповнення (DML)
INSERT INTO users (nickname, email, password) 
VALUES ('Tirsky_D', 'tirsky@kpi.ua', 'pass1'), ('Gamer1', 'g1@ukr.net', 'pass3');

INSERT INTO tags (tag_name) VALUES ('RPG'), ('Cyberpunk'), ('Update');

INSERT INTO posts (user_id, title, content) 
VALUES (1, 'Cyberpunk 2077 Update', 'The new patch fixes major bugs...');

INSERT INTO post_tags (post_id, tag_id) VALUES (1, 2), (1, 3);
🚀 Тестування та результати
Для перевірки роботи схеми було виконано складний запит з об'єднанням чотирьох таблиць (JOIN), щоб вивести публікації разом з їх авторами та відповідними категоріями.

Скріншот результату запиту:

Висновок: База даних успішно обробляє зв'язки "багато до багатьох", що дозволяє одному посту мати кілька тегів одночасно (як показано на прикладі Cyberpunk 2077 Update).

Хочете, щоб я додав розділ про те, як розгорнути цю базу через Docker або як підключити її до Node.js/Python проекту?
