-- Problem: Average Post Hiatus (Part 1)
-- Difficulty: Easy
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-average-post-hiatus-1

-- Solution:

SELECT user_id,
       MAX(DATE(post_date)) - MIN(DATE(post_date)) AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date)=2021
GROUP BY user_id
HAVING COUNT(*) > 1
