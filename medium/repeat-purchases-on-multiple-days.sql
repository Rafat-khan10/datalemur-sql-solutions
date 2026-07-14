-- Problem: Repeat Purchases on Multiple Days
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-repeat-purchases

-- Solution:

SELECT 
  COUNT(DISTINCT p1.user_id ) AS repeat_purchasers
FROM purchases AS p1 
INNER JOIN purchases AS p2 
ON p1.user_id = p2.user_id
AND p1.product_id = p2.product_id
AND EXTRACT(DAY FROM p1.purchase_date)!=EXTRACT(DAY FROM p2.purchase_date)
