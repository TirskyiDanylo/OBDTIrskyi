SELECT
1. Показати всіх користувачів
SQL
SELECT * FROM users;
2. Отримати тільки нікнейми та email користувачів
SQL
SELECT nickname, email FROM users;
3. Знайти користувачів з поштою домену KPI
SQL
SELECT nickname FROM users WHERE email LIKE '%@kpi.ua';
4. Отримати назви постів конкретного користувача (ID = 1)
SQL
SELECT title FROM posts WHERE user_id = 1;
5. Пошук конкретного коментаря за ID
SQL
SELECT * FROM comments WHERE comment_id = 2;
6. Перегляд зв'язків постів з тегами за певним ID тегу
SQL
SELECT * FROM post_tags WHERE tag_id = 4;
7. Детальна інформація про пости з авторами та категоріями (JOIN)
SQL
SELECT 
    p.post_title, 
    u.nickname AS author, 
    t.tag_name AS category
FROM posts p
JOIN users u ON p.user_id = u.user_id
JOIN post_tags pt ON p.post_id = pt.post_id
JOIN tags t ON pt.tag_id = t.tag_id;
8. Загальна статистика кількості записів у таблицях
SQL
SELECT 'Users count:', COUNT(*) FROM users
UNION ALL
SELECT 'Posts count:', COUNT(*) FROM posts
UNION ALL
SELECT 'Comments count:', COUNT(*) FROM comments;
DELETE
1. Видалення тегу за назвою
SQL
DELETE FROM tags WHERE tag_name = 'Reviews';
2. Видалення коментаря за ID
SQL
DELETE FROM comments WHERE comment_id = 2;
