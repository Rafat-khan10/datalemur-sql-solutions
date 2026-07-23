-- Problem: 3-Day Rolling Earnings
-- Difficulty: Hard
-- Source: DataLemur
-- Link: https://datalemur.com/questions/3d-rolling-earnings

-- Solution:

WITH cte AS (
SELECT
  user_id,
  transaction_date ,
  SUM(amount) AS total_amount
FROM user_transactions  
GROUP BY user_id,transaction_date
)
SELECT
  user_id,
  transaction_date,
  SUM(total_amount) OVER(
  PARTITION BY user_id 
  ORDER BY transaction_date ASC
  RANGE BETWEEN INTERVAL '2 DAYS' PRECEDING AND CURRENT ROW 
  ) AS rolling_earnings_3d
FROM cte 
