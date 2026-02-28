-- Problem: Histogram of Tweets
-- Difficulty: Easy
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-histogram-tweets

-- Solution:
WITH cte AS
  (SELECT user_id,
          COUNT(*) AS users_num
   FROM tweets
   WHERE EXTRACT(YEAR FROM tweet_date) = '2022'
   GROUP BY user_id)

SELECT 
    COUNT(*) AS tweet_bucket,
    users_num
FROM cte
GROUP BY users_num
ORDER BY tweet_bucket ASC
