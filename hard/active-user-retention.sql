-- Problem: Active User Retention
-- Difficulty: Hard
-- Source: DataLemur
-- Link: https://datalemur.com/questions/user-retention

-- Solution:

WITH cte AS (
SELECT 
  user_id,
  EXTRACT(MONTH FROM event_date) AS curr_month 
FROM user_actions
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
  curr_month AS month,
  COUNT(DISTINCT user_id) AS monthly_active_users
FROM cte2
WHERE prev_month IS NOT NULL
AND prev_month = 6
AND curr_month = 7
GROUP BY curr_month
