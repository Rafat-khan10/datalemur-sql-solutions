-- Problem: Duplicate Job Listings
-- Difficulty: Easy
-- Source: DataLemur
-- Link: hhttps://datalemur.com/questions/duplicate-job-listings

-- Solution:

WITH cte AS (
SELECT
  company_id,
  title,
  description
FROM job_listings 
GROUP BY company_id,title,description
HAVING COUNT(*) > 1
)

SELECT
 COUNT(*) AS duplicate_companies
FROM cte
