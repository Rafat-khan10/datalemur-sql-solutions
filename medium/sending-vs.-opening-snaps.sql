-- Problem: Sending vs. Opening Snaps
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/time-spent-snaps

-- Solution:

WITH cte AS (
SELECT
 age_bucket,
 SUM(
   CASE 
     WHEN a.activity_type='send' THEN a.time_spent
     ELSE 0
    END ) AS sending_time_spent,
    
  SUM(
    CASE 
      WHEN a.activity_type='open' THEN a.time_spent
      ELSE 0
    END ) AS opening_time_spent
    
FROM activities AS a 
INNER JOIN age_breakdown  AS ab 
ON a.user_id = ab.user_id
GROUP BY age_bucket
)
SELECT
  age_bucket,
  ROUND(sending_time_spent*100.0/(sending_time_spent + opening_time_spent),2) AS send_perc,
  ROUND(opening_time_spent*100.0/(sending_time_spent + opening_time_spent),2) AS open_perc
FROM cte


