-- Problem: Patient Support Analysis (Part 2)
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/uncategorized-calls-percentage

-- Solution:

SELECT 
  ROUND(
  SUM
  (CASE 
    WHEN call_category='n/a' OR call_category IS NULL THEN 1 
    ELSE 0
  END)*100.0/COUNT(*),1) AS uncategorised_call_pct
FROM callers
