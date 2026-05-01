USE fashion__db;
SHOW TABLES;


SELECT * FROM fashion_table LIMIT 100;

SELECT brand, AVG(avg_rating)
FROM fashion_table
GROUP BY brand
ORDER BY AVG(avg_rating) DESC
LIMIT 5;

SELECT colour, COUNT(*) 
FROM fashion_table
GROUP BY colour
ORDER BY COUNT(*) DESC;


ALTER TABLE fashion_table
ADD price_category VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE fashion_table
SET price_category =
CASE 
  WHEN price < 1000 THEN 'Low'
  WHEN price BETWEEN 1000 AND 2000 THEN 'Medium'
  ELSE 'High'
END
WHERE p_id IS NOT NULL;

UPDATE fashion_table
SET price = CAST(price AS UNSIGNED);

SELECT price_category, COUNT(*)
FROM fashion_table
GROUP BY price_category; 

SELECT 
    price_category,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fashion_table), 2) AS percentage
FROM fashion_table
GROUP BY price_category;