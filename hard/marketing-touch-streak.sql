-- Problem: Marketing Touch Streak
-- Difficulty: Hard
-- Source: DataLemur
-- Link: https://datalemur.com/questions/marketing-touch-streak

-- Solution:

WITH cte AS (
SELECT
  *
FROM marketing_touches 
WHERE contact_id IN (
  SELECT
  contact_id
 FROM marketing_touches 
 WHERE event_type LIKE 'trial_request%'
 )
), 

cte2 AS (
SELECT
   cte.contact_id,
   cc.email,
   LAG(cte.event_date) OVER(PARTITION BY cte.contact_id ORDER BY cte.event_date ASC) AS prev_event_date,
   cte.event_date AS current_event_date,
   LEAD(cte.event_date) OVER(PARTITION BY cte.contact_id ORDER BY cte.event_date ASC) AS next_event_date
FROM cte 
INNER JOIN crm_contacts  AS cc 
ON cte.contact_id = cc.contact_id
)

SELECT
 email
FROM cte2
WHERE prev_event_date IS NOT NULL 
AND next_event_date IS NOT NULL 
AND EXTRACT(WEEK FROM current_event_date) - EXTRACT(WEEK FROM prev_event_date) =1
AND EXTRACT(WEEK FROM next_event_date) - EXTRACT(WEEK FROM current_event_date) =1

