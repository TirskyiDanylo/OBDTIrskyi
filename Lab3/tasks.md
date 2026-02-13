# Лабораторна робота №3: Маніпулювання даними SQL (OLTP)
**Виконав:** Тірський Данило, студент групи ІО-45 (ФІОТ)

---

# SELECT

## 1. Показати всіх користувачів
```sql
SELECT * FROM users;
2. Отримати тільки нікнейми та email користувачів
SQL
SELECT nickname, email FROM users;
3. Знайти користувачів з корпоративною поштою КПІ
SQL
SELECT nickname FROM users WHERE email LIKE '%@kpi.ua';
4. Отримати дані конкретного коментаря за його ID
SQL
SELECT * FROM comments WHERE comment_id = 2;
5. Показати всі заголовки постів, які створив користувач з ID 1
SQL
SELECT title FROM posts WHERE user_id = 1;
6. Перевірка наявності постів за певним тегом (ID 4)
SQL
SELECT * FROM post_tags WHERE tag_id = 4;
7. Складний запит: Пости з авторами та категоріями (JOIN)
SQL
SELECT 
    p.post_title, 
    u.nickname AS author, 
    t.tag_name AS category
FROM posts p
JOIN users u ON p.user_id = u.user_id
JOIN post_tags pt ON p.post_id = pt.post_id
JOIN tags t ON pt.tag_id = t.tag_id;
8. Загальна статистика заповненості таблиць (UNION ALL)
SQL
SELECT 'Users count:' as table, COUNT(*) FROM users
UNION ALL
SELECT 'Posts count:', COUNT(*) FROM posts
UNION ALL
SELECT 'Comments count:', COUNT(*) FROM comments;
INSERT
1. Додавання нового користувача
SQL
INSERT INTO users (nickname, email, password) 
VALUES ('Pro_Gamer_2026', 'pro@kpi.ua', 'pass123');
SELECT * FROM users;
2. Додавання нового тегу в систему
SQL
INSERT INTO tags (tag_name) 
VALUES ('Cyberpunk');
UPDATE
1. Зміна нікнейму користувача
SQL
UPDATE users
SET nickname = 'Tirsky_D_Modified'
WHERE user_id = 1;
2. Оновлення тексту коментаря
SQL
UPDATE comments
SET comment_text = 'This content has been updated.'
WHERE comment_id = 1;
DELETE
1. Видалення конкретного коментаря за його ID
SQL
DELETE FROM comments WHERE comment_id = 2;
2. Видалення тегу за його назвою
SQL
DELETE FROM tags WHERE tag_name = 'Reviews';
