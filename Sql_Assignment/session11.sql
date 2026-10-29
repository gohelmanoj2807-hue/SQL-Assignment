-- task 1

USE food_delivery_db;


SELECT name, rating
FROM Restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM Restaurants
);

-- task 2

CREATE TABLE Products2 (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

INSERT INTO Products2 (product_id, name, price, category) VALUES
(1, 'iPhone', 60000, 'Mobile'),
(2, 'Samsung Galaxy', 40000, 'Mobile'),
(3, 'HP Laptop', 55000, 'Laptop'),
(4, 'Dell Laptop', 45000, 'Laptop'),
(5, 'Boat Headphones', 2000, 'Accessories'),
(6, 'Smart Watch', 4000, 'Accessories');

SELECT
    p1.name,
    p1.price,
    p1.category,
    (SELECT AVG(p2.price)
     FROM Products2 p2
     WHERE p2.category = p1.category
    ) AS avg_category_price
FROM Products2 p1;

-- task 3

SELECT u.name, p.playlist_count
FROM Users u
JOIN (
    SELECT id, COUNT(*) AS playlist_count
    FROM Playlists
    GROUP BY id
) AS p
ON u.id = p.id
WHERE p.playlist_count > (
    SELECT AVG(playlist_count)
    FROM (
        SELECT COUNT(*) AS playlist_count
        FROM Playlists
        GROUP BY id
    ) AS avg_playlists
);

-- task 4

CREATE TABLE IF NOT EXISTS Orders5 (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders5 (user_id, total_amount)
VALUES
(1, 250),
(2, 500),
(3, 150),
(1, 800),
(4, 300);

SELECT DISTINCT user_id
FROM Orders5
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Orders5
);

