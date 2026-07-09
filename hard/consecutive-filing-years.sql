-- Problem: Consecutive Filing Years
-- Difficulty: Hard
-- Source: DataLemur
-- Link: https://datalemur.com/questions/consecutive-filing-years

-- Solution:

WITH cte AS (
SELECT 
   *,
  LAG(filing_date) OVER(PARTITION BY user_id ORDER BY filing_date ASC) AS prev_filing_date,
  filing_date AS current_filing_date,
  LEAD(filing_date) OVER(PARTITION BY user_id ORDER BY filing_date ASC) AS next_filing_date
FROM filed_taxes 
WHERE product LIKE 'TurboTax%'
)

SELECT
  DISTINCT user_id
FROM cte
WHERE prev_filing_date IS NOT NULL
AND next_filing_date IS NOT NULL 
AND EXTRACT(YEAR FROM current_filing_date) - EXTRACT(YEAR FROM prev_filing_date) =1
AND EXTRACT(YEAR FROM next_filing_date) - EXTRACT(YEAR FROM current_filing_date) =1
