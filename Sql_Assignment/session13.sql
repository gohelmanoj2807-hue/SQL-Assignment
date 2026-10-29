-- task 1

USE food_delivery_db;

ALTER TABLE Orders
ADD COLUMN user_id INT,
ADD COLUMN order_amount DECIMAL(10,2),
ADD COLUMN app_name VARCHAR(50);

UPDATE Orders SET user_id = 101, order_amount = 500, app_name = 'Zomato' WHERE order_id = 1;
UPDATE Orders SET user_id = 102, order_amount = 800, app_name = 'Swiggy' WHERE order_id = 2;
UPDATE Orders SET user_id = 103, order_amount = 1200, app_name = 'Flipkart' WHERE order_id = 3;
UPDATE Orders SET user_id = 101, order_amount = 600, app_name = 'Zomato' WHERE order_id = 4;
UPDATE Orders SET user_id = 104, order_amount = 900, app_name = 'Swiggy' WHERE order_id = 5;
UPDATE Orders SET user_id = 102, order_amount = 1500, app_name = 'Flipkart' WHERE order_id = 6;
UPDATE Orders SET user_id = 105, order_amount = 700, app_name = 'Zomato' WHERE order_id = 7;
UPDATE Orders SET user_id = 103, order_amount = 400, app_name = 'Swiggy' WHERE order_id = 8;
UPDATE Orders SET user_id = 104, order_amount = 1100, app_name = 'Flipkart' WHERE order_id = 9;
UPDATE Orders SET user_id = 105, order_amount = 1000, app_name = 'Zomato' WHERE order_id = 10;

SELECT
    order_id,
    user_id,
    order_amount,
    app_name,
    SUM(order_amount) OVER() AS total_order_amount
FROM Orders;

-- task 2


SELECT
    user_id,
    order_id,
    order_amount,
    AVG(order_amount) OVER (PARTITION BY user_id) AS average_order_amount
FROM Orders;

-- task 3

DESCRIBE Playlist;

ALTER TABLE Playlist
ADD COLUMN duration_sec INT;

SELECT
    song_id,
    user_id,
    duration_sec,
    SUM(duration_sec) OVER (
        PARTITION BY user_id
    ) AS total_duration_sec
FROM Playlist;

-- task 4

CREATE TABLE IF NOT EXISTS MovieRatings (
    rating_id INT PRIMARY KEY,
    user_id INT,
    movie_name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT IGNORE INTO MovieRatings (rating_id, user_id, movie_name, rating) VALUES
(1, 101, 'Pathaan', 4),
(2, 102, 'Pathaan', 5),
(3, 103, 'Pathaan', 3),
(4, 101, 'Jawan', 5),
(5, 102, 'Jawan', 4),
(6, 104, 'Jawan', 3),
(7, 103, 'Animal', 4),
(8, 104, 'Animal', 5),
(9, 105, 'Animal', 3);


SELECT
    rating_id,
    user_id,
    movie_name,
    rating,
    AVG(rating) OVER (
        PARTITION BY movie_name
    ) AS average_movie_rating,
    rating - AVG(rating) OVER (
        PARTITION BY movie_name
    ) AS rating_difference
FROM MovieRatings;