SELECT COUNT(*) AS total_comments 
FROM comments;

SELECT 
    AVG(LENGTH(content)) AS avg_length,
    MAX(LENGTH(content)) AS max_length,
    MIN(LENGTH(content)) AS min_length
FROM posts;

SELECT user_id, COUNT(*) AS posts_count
FROM posts
GROUP BY user_id;

SELECT tag_id, COUNT(*) AS usage_count
FROM post_tags
GROUP BY tag_id
HAVING COUNT(*) > 1;

SELECT 
    u.nickname AS Comment_Author, 
    p.title AS Post_Title, 
    c.comment_text
FROM comments c
INNER JOIN users u ON c.user_id = u.user_id
INNER JOIN posts p ON c.post_id = p.post_id;

SELECT 
    t.tag_name, 
    COUNT(pt.post_id) AS posts_count
FROM tags t
LEFT JOIN post_tags pt ON t.tag_id = pt.tag_id
GROUP BY t.tag_name;

SELECT 
    u.nickname, 
    t.tag_name
FROM users u
CROSS JOIN tags t;

SELECT nickname 
FROM users 
WHERE user_id IN (
    SELECT DISTINCT user_id 
    FROM comments
);

SELECT 
    title, 
    (SELECT COUNT(*) FROM comments WHERE comments.post_id = posts.post_id) AS comments_count
FROM posts;

SELECT comment_text, LENGTH(comment_text) as len
FROM comments 
WHERE LENGTH(comment_text) > (
    SELECT AVG(LENGTH(comment_text)) FROM comments
);
