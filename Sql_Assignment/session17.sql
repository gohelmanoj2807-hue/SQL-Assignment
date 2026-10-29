-- task 1

USE food_delivery_db;

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    total_amount DECIMAL(10,2)
);

INSERT INTO FoodOrders (order_id, customer_name, total_amount)
VALUES
(1, 'Manoj', 200),
(2, 'Rahul', 500),
(3, 'Amit', 1200),
(4, 'Priya', 300),
(5, 'Neha', 999);

SELECT
    *,
    CASE
        WHEN total_amount < 300 THEN 'Small'
        WHEN total_amount BETWEEN 300 AND 999 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM FoodOrders;

-- task 2

DESCRIBE Movies;

ALTER TABLE Movies
ADD COLUMN rating DECIMAL(3,1);

UPDATE Movies
SET rating = CASE
    WHEN id = 1 THEN 8.5
    WHEN id = 2 THEN 7.2
    WHEN id = 3 THEN 4.5
    WHEN id = 4 THEN 9.0
    WHEN id = 5 THEN 6.0
    ELSE 5.0
END
WHERE id BETWEEN 1 AND 5
  AND rating IS NULL;
  
  SELECT *,
    CASE
        WHEN rating >= 8 THEN 'Blockbuster'
        WHEN rating >= 5 THEN 'Hit'
        ELSE 'Average'
    END AS popularity
FROM Movies;

-- task 3

CREATE TABLE IF NOT EXISTS FlipkartProducts (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT IGNORE INTO FlipkartProducts (id, product_name, price)
VALUES
(1, 'Headphones', 399),
(2, 'Shoes', 1200),
(3, 'Smartphone', 15000),
(4, 'Keyboard', 800),
(5, 'Mouse', 250);

SELECT *,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price <= 2000 THEN 'Standard'
        ELSE 'Premium'
    END AS price_category
FROM FlipkartProducts;

-- task 4


CREATE TABLE IF NOT EXISTS SpotifyTracks (
    id INT PRIMARY KEY,
    track_name VARCHAR(100),
    duration INT
);

INSERT IGNORE INTO SpotifyTracks (id, track_name, duration)
VALUES
(1, 'Song A', 150),
(2, 'Song B', 240),
(3, 'Song C', 350),
(4, 'Song D', 180),
(5, 'Song E', 300);

SELECT *,
    CASE
        WHEN duration < 180 THEN 'Short'
        WHEN duration <= 300 THEN 'Medium'
        ELSE 'Long'
    END AS duration_label
FROM SpotifyTracks;

