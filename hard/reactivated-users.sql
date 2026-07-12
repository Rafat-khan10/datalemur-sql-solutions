-- Problem: Reactivated Users
-- Difficulty: Hard
-- Source: DataLemur
-- Link:https://datalemur.com/questions/reactivated-users

-- Solution:

WITH cte AS (
SELECT 
  user_id,
  EXTRACT(MONTH FROM login_date) AS curr_month
FROM user_logins
GROUP BY user_id,curr_month
),
cte2 AS (
SELECT
  user_id,
  LAG(curr_month) OVER(PARTITION BY user_id ORDER BY curr_month ASC) AS prev_month,
  curr_month
FROM cte
)
SELECT
   curr_month,
   COUNT(DISTINCT user_id) AS reactivated_users
FROM cte2
WHERE prev_month IS NULL OR curr_month - prev_month !=1
GROUP BY curr_month
