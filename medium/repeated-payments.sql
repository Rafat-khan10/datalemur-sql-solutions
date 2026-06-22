-- Problem: Repeated Payments
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/repeated-payments

-- Solution:

WITH cte AS (
SELECT
  merchant_id,
  credit_card_id,
  amount,
  transaction_timestamp,
  LEAD(transaction_timestamp) 
  OVER(
  PARTITION BY merchant_id,credit_card_id,amount 
  ORDER BY transaction_timestamp ASC
  ) AS next_transaction
FROM transactions
),
cte2 AS (
SELECT
  merchant_id,
  credit_card_id,
  amount,
  COUNT(*) AS transaction_count
FROM cte 
WHERE next_transaction IS NOT NULL AND next_transaction - transaction_timestamp <=INTERVAL '10 MINUTES'
GROUP BY merchant_id,credit_card_id,amount
)
SELECT
 SUM(transaction_count) AS payment_count
FROM cte2




