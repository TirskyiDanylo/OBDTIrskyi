# SELECT

## 1. Показати всіх користувачів
```sql
SELECT * FROM users;
```
![All Users](./src/1.png)

---

## 2. Показати контактні дані
```sql
SELECT nickname, email FROM users;
```
![All Levels](./src/2.png)

---

## 3. Показати всі доступні теги
```sql
SELECT * FROM tags;
```
![All Votes](./src/3.png)

---

## 4. Знайти пости конкретного автора
```sql
SELECT title, created_at FROM posts 
WHERE user_id = 1;
```
![Username from Users](./src/4s.png)

---

## 5. Знайти коментарі за ключовим словом
```sql
SELECT * FROM comments 
WHERE comment_text LIKE '%Performance%';
```
![Name and placement from levels](./src/5.png)

---

## 6. Показати пости разом з іменами авторів
```sql
SELECT 
    users.nickname AS Автор, 
    posts.title AS Заголовок, 
    posts.created_at AS Дата
FROM posts
JOIN users ON posts.user_id = users.user_id;
```
![All Public Levels](./src/6.png)

---

# INSERT

## 1. Додавання нового користувача
```sql
INSERT INTO users (nickname, email, password) 
VALUES ('Star_Lord', 'quill@galaxy.com', 'dance_off_2026');

SELECT * FROM users WHERE nickname = 'Star_Lord';
```
![New User](./src/7.png)

---

## 2. Додавання нової публікації
```sql
INSERT INTO posts (user_id, title, content) 
VALUES (4, 'How to fly a Milano', 'Step 1: Don`t let Rocket drive...');

SELECT * FROM posts WHERE user_id = 4;
```
![New Level](./src/8.png)

---

# UPDATE

## 1. Оновлення нікнейму користувача
```sql
UPDATE users
SET nickname = 'Tirsky_PRO'
WHERE user_id = 1;

SELECT * FROM users WHERE user_id = 1;
```
![Vote update](./src/9.png)

---

## 2. Оновлення змісту публікації
```sql
UPDATE posts
SET content = 'The new patch fixes major bugs and improves FPS by 20%.'
WHERE post_id = 1;

SELECT * FROM posts WHERE post_id = 1;
```
![User update](./src/10.png)

---

# DELETE

## 1. Видалення конкретного коменатря
```sql
DELETE FROM comments
WHERE comment_id = 2;

SELECT * FROM comments;
```
![Level Update](./src/11.png)

---

## 2. Видалення категорії
```sql
DELETE FROM tags
WHERE tag_name = 'Update';

SELECT * FROM tags;
SELECT * FROM post_tags;
```
![Level Update](./src/12.png)

---

