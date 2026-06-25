-- Problem: Top Three Salaries
-- Difficulty: Medium
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-top-three-salaries

-- Solution:

WITH employee_info AS (
SELECT
  d.department_name,
  e.name,
  e.salary
FROM employee AS e 
INNER JOIN department  AS d 
ON e.department_id = d.department_id
ORDER BY d.department_name ASC, e.salary DESC,e.name ASC
),
rank AS (
SELECT
  department_name,
  name,
  salary,
  DENSE_RANK() OVER(
  PARTITION BY department_name
  ORDER BY salary DESC
  ) AS rank
FROM employee_info
)
SELECT
  department_name,
  name,
  salary
FROM rank
WHERE rank<=3
