-- Problem: Data Science Skills
-- Difficulty: Easy
-- Source: DataLemur
-- Link: https://datalemur.com/questions/matching-skills

-- Solution:
SELECT 
  candidate_id
FROM candidates
WHERE skill IN ( 'Python', 'Tableau', 'PostgreSQL' )
GROUP BY candidate_id
HAVING COUNT(DISTINCT( skill )) = 3
ORDER BY candidate_id ASC 
