-- Problem: Histogram of Users and Purchases
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/histogram-users-purchases

-- Solution:

SELECT
  transaction_date,
  user_id, 
  COUNT(*) AS purchase_count
FROM user_transactions
WHERE (user_id, transaction_date) IN (
SELECT
  user_id,
  MAX(transaction_date) AS transaction_date
FROM user_transactions 
GROUP BY user_id
)
GROUP BY user_id, transaction_date
ORDER BY transaction_date ASC
