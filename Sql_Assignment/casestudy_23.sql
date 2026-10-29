CREATE DATABASE IF NOT EXISTS ZomatoDB;
USE ZomatoDB;

CREATE TABLE zomato (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150),
    location VARCHAR(100),
    rate VARCHAR(10),
    votes INT,
    cuisines VARCHAR(255),
    rest_type VARCHAR(100),
    `approx_cost(for two people)` VARCHAR(30)
);

INSERT INTO zomato
(name, location, rate, votes, cuisines, rest_type,
 `approx_cost(for two people)`)
VALUES
('Empire Restaurant', 'Koramangala', '4.2/5', 850, 'North Indian, Mughlai', 'Casual Dining', '800'),
('Truffles', 'Koramangala', '4.5/5', 1500, 'American, Burger, Cafe', 'Cafe', '900'),
('Meghana Foods', 'Koramangala', '4.4/5', 1200, 'Biryani, Andhra', 'Casual Dining', '700'),
('Food Point', 'Koramangala', '2.8/5', 350, 'South Indian, Chinese', 'Quick Bites', '300'),
('Cafe Coffee Day', 'Koramangala', '3.5/5', 280, 'Cafe, Beverages', 'Cafe', '450'),
('Spice Garden', 'Indiranagar', '4.3/5', 600, 'North Indian, Chinese', 'Casual Dining', '1200'),
('The Pizza Place', 'Indiranagar', '3.8/5', 450, 'Pizza, Italian', 'Casual Dining', '1000'),
('Green Bowl', 'Indiranagar', '4.1/5', 320, 'Healthy Food, Salad', 'Quick Bites', '500'),
('Dragon Palace', 'Indiranagar', '2.7/5', 420, 'Chinese, Thai', 'Casual Dining', '1600'),
('Budget Meals', 'Indiranagar', '2.9/5', 250, 'South Indian, North Indian', 'Quick Bites', '250'),
('Royal Dine', 'MG Road', '4.6/5', 900, 'North Indian, Mughlai', 'Fine Dining', '2200'),
('Coffee House', 'MG Road', '4.0/5', 500, 'Cafe, Desserts', 'Cafe', '600'),
('Burger Hub', 'BTM', '3.9/5', 300, 'Burger, Fast Food', 'Quick Bites', '400'),
('Royal Feast', 'Koramangala', '2.6/5', 500, 'North Indian, Chinese', 'Casual Dining', '1800'),
('Sweet Treats', 'Indiranagar', '4.4/5', 700, 'Bakery, Desserts', 'Bakery', '350');


-- Task 1 — Top 5 highest-rated restaurants in Koramangala

SELECT
    name,
    CAST(SUBSTRING_INDEX(rate, '/', 1) AS DECIMAL(3,1))
        AS average_rating,
    votes
FROM zomato
WHERE location = 'Koramangala'
  AND rate IS NOT NULL
ORDER BY average_rating DESC, votes DESC
LIMIT 5;

-- Task 2 — Unique cuisines in Indiranagar and their counts

WITH RECURSIVE cuisine_split AS (
    SELECT
        restaurant_id,
        TRIM(SUBSTRING_INDEX(cuisines, ',', 1)) AS cuisine,
        CASE
            WHEN cuisines LIKE '%,%'
            THEN SUBSTRING(cuisines, LOCATE(',', cuisines) + 1)
            ELSE ''
        END AS remaining
    FROM zomato
    WHERE location = 'Indiranagar'
      AND cuisines IS NOT NULL
      AND cuisines <> ''

    UNION ALL

    SELECT
        restaurant_id,
        TRIM(SUBSTRING_INDEX(remaining, ',', 1)),
        CASE
            WHEN remaining LIKE '%,%'
            THEN SUBSTRING(remaining, LOCATE(',', remaining) + 1)
            ELSE ''
        END
    FROM cuisine_split
    WHERE remaining <> ''
)
SELECT
    cuisine,
    COUNT(DISTINCT restaurant_id) AS restaurant_count
FROM cuisine_split
WHERE cuisine <> ''
GROUP BY cuisine
ORDER BY restaurant_count DESC, cuisine;

-- Task 3 — Average cost for two by restaurant type

SELECT
    rest_type,
    ROUND(
        AVG(
            CAST(
                REPLACE(`approx_cost(for two people)`, ',', '')
                AS DECIMAL(10,2)
            )
        ), 2
    ) AS average_cost_for_two
FROM zomato
WHERE rest_type IS NOT NULL
  AND `approx_cost(for two people)` REGEXP '^[0-9,]+$'
GROUP BY rest_type
ORDER BY average_cost_for_two DESC;

-- Task 4 — Rating below 3.0 and more than 200 votes

SELECT
    name,
    location,
    rate,
    votes,
    `approx_cost(for two people)` AS cost_for_two
FROM zomato
WHERE CAST(SUBSTRING_INDEX(rate, '/', 1) AS DECIMAL(3,1)) < 3.0
  AND votes > 200
ORDER BY votes DESC;

-- Task 5 — Budget, Mid-range, and Premium segmentation

SELECT
    name,
    location,
    `approx_cost(for two people)` AS cost_for_two,
    CASE
        WHEN CAST(
            REPLACE(`approx_cost(for two people)`, ',', '')
            AS UNSIGNED
        ) < 500 THEN 'Budget'

        WHEN CAST(
            REPLACE(`approx_cost(for two people)`, ',', '')
            AS UNSIGNED
        ) <= 1500 THEN 'Mid-range'

        ELSE 'Premium'
    END AS market_category
FROM zomato
WHERE `approx_cost(for two people)` REGEXP '^[0-9,]+$'
ORDER BY market_category, name;

USE ZomatoDB;
SHOW TABLES;
SELECT COUNT(*) AS total_restaurants FROM zomato;