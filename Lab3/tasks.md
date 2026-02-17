# SELECT

## 1. Показати всіх користувачів
```sql
SELECT * FROM users;
```
![All Users](./src/1.png)

---

## 2. Показати всі рівні
```sql
SELECT * FROM levels;
```
![All Levels](./src/2.png)

---

## 3. Показати всі голоси
```sql
SELECT * FROM votes;
```
![All Votes](./src/3.png)

---

## 4. Отримати тільки імена користувачів
```sql
SELECT username FROM users;
```
![Username from Users](./src/4.png)

---

## 5. Отримати назви рівнів та їх складність (placement)
```sql
SELECT name, placement FROM levels;
```
![Name and placement from levels](./src/5.png)

---

## 6. Знайти тільки ПУБЛІЧНІ рівні (ті, що не приховані)
```sql
SELECT * FROM levels 
WHERE public = TRUE;
```
![All Public Levels](./src/6.png)

---

## 7. Знайти рівні, які складніші за перший (placement > 1)
```sql
SELECT name, placement FROM levels 
WHERE placement > 1;
```
![Levels with placement > 1](./src/7.png)

---

## 8. Знайти всі ПОЗИТИВНІ голоси (лайки)
```sql
SELECT * FROM votes 
WHERE is_agree = TRUE;
```
![Positive Votes](./src/8.png)

---

## 9. Хто за що проголосував (з іменами замість цифр)
```sql
SELECT 
    users.username AS Гравець, 
    levels.name AS Рівень, 
    votes.is_agree AS Лайк
FROM votes
JOIN users ON votes.user_id = users.user_id
JOIN levels ON votes.level_id = levels.level_id;
```
![Votes by Users](./src/9.png)

---

# INSERT

## 1. Додавання нового користувача
```sql
INSERT INTO users (username) VALUES ('Pro_Gamer_2024');
SELECT * FROM users;
```
![New User](./src/10.png)

---

## 2. Додавання нового рівня
```sql
INSERT INTO levels (name, placement, moderation, public) VALUES ('Impossible Mode', 10, TRUE, TRUE);
```
![New Level](./src/11.png)

---

## 3. Додавання нового голосу
```sql
INSERT INTO votes (user_id, level_id, is_agree) VALUES (3, 6, FALSE);
SELECT * FROM votes WHERE user_id = 3;
```
![New Vote](./src/12.png)

---

# UPDATE

## 1. Оновлення голосу
```sql
UPDATE votes
SET is_agree = TRUE
WHERE user_id = 3 AND level_id = 6;
SELECT * FROM VOTES WHERE user_id = 3;
```
![Vote update](./src/13.png)

---

## 2. Оновлення Користувача
```sql
UPDATE users
SET username = 'romavolosh'
WHERE user_id = 1;
SELECT * FROM USERS WHERE user_id = 1;
```
![User update](./src/14.png)

---

## 3. Оновлення Рівня
```sql
UPDATE levels
SET moderation = FALSE,
    "public" = FALSE
WHERE level_id = 1;
SELECT * FROM levels WHERE level_id = 1;
```
![Level Update](./src/15.png)

---

# DELETE

## 1. Видалення користувача
```sql
DELETE FROM USERS
WHERE user_id = 2;
SELECT * FROM USERS WHERE user_id = 2;
```
![Level Update](./src/16.png)

---

## 1. Видалення користувача
```sql
DELETE FROM USERS
WHERE user_id = 2;
SELECT * FROM USERS WHERE user_id = 2;
```
![Level Update](./src/16.png)

---

## 2. Видалення Голосу
```sql
DELETE FROM VOTES
WHERE NOT is_agree;
SELECT * FROM VOTES;
```
![Level Update](./src/17.png)

---

## 2. Видалення Рівня
```sql
DELETE FROM LEVELS
WHERE placement > 2;
SELECT * FROM LEVELS;
```
![Level Update](./src/18.png)

---
