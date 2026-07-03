-- Problem: Highest-Grossing Items
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-highest-grossing

-- Solution:
WITH cte AS (SELECT
  category,
  product,
  SUM(spend) AS total_spend
FROM product_spend 
WHERE EXTRACT(YEAR FROM transaction_date)='2022'
GROUP BY category,product
),

cte2 AS (
SELECT
 category,
 product,
 total_spend,
 DENSE_RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) AS rank
FROM cte
)

SELECT
 category,
 product,
 total_spend
FROM cte2
WHERE rank <= 2
