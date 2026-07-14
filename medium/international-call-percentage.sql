-- Problem: International Call Percentage
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/international-call-percentage

-- Solution:
WITH cte AS (
SELECT
  c.caller_id,
  c.receiver_id,
  i.country_id
FROM phone_calls AS c 
INNER JOIN  phone_info  AS i
ON c.caller_id=i.caller_id
)
SELECT
  ROUND(SUM(CASE 
    WHEN cte.country_id != i.country_id THEN 1
    ELSE 0
  END)*100.0 / COUNT(*),1) AS international_calls_pct
FROM  phone_info  AS i 
INNER JOIN cte 
ON cte.receiver_id = i.caller_id
