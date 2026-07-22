-- Problem: Patient Support Analysis (Part 3)
-- Difficulty: Hard
-- Source: DataLemur
-- Link: https://datalemur.com/questions/patient-call-history

-- Solution:
WITH prev_day_call AS (
SELECT 
 policy_holder_id,
 call_date,
 LAG(call_date) OVER(PARTITION BY policy_holder_id ORDER BY call_date ASC) AS previous_call_date
FROM callers
),
days_difference AS (
SELECT
 *,
 call_date ::DATE - previous_call_date::DATE AS days_gap
FROM prev_day_call 
WHERE previous_call_date IS NOT NULL
),
more_than_2_call AS (
SELECT
  policy_holder_id 
FROM days_difference 
WHERE days_gap < 7
GROUP BY policy_holder_id
)
SELECT
  COUNT(DISTINCT policy_holder_id) AS policy_holder_count
FROM more_than_2_call  
