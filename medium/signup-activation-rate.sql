-- Problem: Signup Activation Rate
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/signup-confirmation-rate

-- Solution:

SELECT
  ROUND(SUM(
  CASE 
    WHEN t.signup_action ='Confirmed' THEN 1 
    ELSE 0 
  END)::NUMERIC/COUNT(*),2) AS confirm_rate
FROM emails AS e
INNER JOIN texts AS t
ON e.email_id=t.email_id
