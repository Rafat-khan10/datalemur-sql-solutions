-- Problem: Unfinished Parts
-- Difficulty: Easy
-- Source: DataLemur
-- Link: https://datalemur.com/questions/tesla-unfinished-parts

-- Solution:

SELECT 
  part,
  assembly_step
FROM parts_assembly
WHERE finish_date IS NULL
