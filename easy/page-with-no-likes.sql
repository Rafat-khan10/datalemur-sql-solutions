-- Problem: Page With No Likes
-- Difficulty: Easy
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-page-with-no-likes

-- Solution:

SELECT p.page_id
FROM pages AS p
LEFT JOIN page_likes AS pl ON p.page_id=pl.page_id
WHERE pl.user_id IS NULL
ORDER BY p.page_id ASC;
