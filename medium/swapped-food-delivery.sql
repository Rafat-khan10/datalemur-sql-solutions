-- Problem: Swapped Food Delivery
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-swapped-food-delivery

-- Solution:

WITH food_distribution AS (
  SELECT
   order_id,
   item,
   LAG(item) OVER(ORDER BY order_id ASC) AS prev_item,
   LEAD(item) OVER(ORDER BY order_id ASC) AS next_item
FROM orders 
)
SELECT
  order_id AS corrected_order_id,
  CASE
    WHEN order_id % 2 = 1 AND next_item IS NOT NULL THEN next_item 
    WHEN order_id % 2 = 0 THEN prev_item  
    ELSE item
  END AS item 
FROM food_distribution
