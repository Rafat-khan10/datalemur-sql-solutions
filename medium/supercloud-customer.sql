-- Problem: Supercloud Customer
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/supercloud-customer

-- Solution:

SELECT c.customer_id
FROM customer_contracts AS c
INNER JOIN products AS p ON c.product_id = p.product_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT product_category) >=
  (SELECT COUNT(DISTINCT product_category)
   FROM products)
