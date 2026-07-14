-- Problem: Average Deal Size (Part 1)
-- Difficulty: Easy
-- Source: DataLemur
-- Link: https://datalemur.com/questions/sql-average-deal-size

-- Solution:
SELECT 
  ROUND(AVG(yearly_seat_cost*num_seats),2) AS average_deal_size
FROM contracts
