-- task 1

USE food_delivery_db;

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO food_orders (order_id, user_id, amount)
VALUES
(1, 101, 250.00),
(2, 102, 400.00),
(3, 101, 150.00),
(4, 103, 300.00),
(5, 102, 200.00);

SELECT SUM(amount) AS total_amount_spent
FROM food_orders;

-- task 2


CREATE TABLE spotify_playlists (
    playlist_id INT,
    user_id INT,
    song_id INT
);

INSERT INTO spotify_playlists (playlist_id, user_id, song_id)
VALUES
(1, 101, 501),
(1, 101, 502),
(1, 101, 503),
(2, 102, 504),
(2, 102, 505),
(3, 103, 506);

SELECT COUNT(song_id) AS total_songs
FROM spotify_playlists
WHERE user_id = 101;

-- task 3

CREATE TABLE bookmyshow_reviews ( 
review_id INT,
movie_id INT, 
rating DECIMAL(3,1)
);

INSERT INTO bookmyshow_reviews (review_id, movie_id, rating) 
VALUES (1, 101, 4.5), 
		(2, 102, 3.8), 
        (3, 101, 4.0), 
        (4, 103, 3.5),
        (5, 102, 4.2);
        

SELECT ROUND(AVG(rating), 1) AS average_rating
FROM bookmyshow_reviews;

-- task 4

CREATE TABLE paytm_transactions (
    txn_id INT,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO paytm_transactions (txn_id, user_id, amount)
VALUES
(1, 101, 500.00),
(2, 101, 1200.00),
(3, 101, 250.00),
(4, 102, 800.00),
(5, 101, 1500.00);

SELECT
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount
FROM paytm_transactions
WHERE user_id = 101;


-- task 5

CREATE TABLE myntra_orders (
    order_id INT,
    user_id INT,
    total_price DECIMAL(10,2)
);

INSERT INTO myntra_orders (order_id, user_id, total_price)
VALUES
(1, 101, 1500.00),
(2, 101, 2500.00),
(3, 102, 800.00),
(4, 102, 1200.00),
(5, 101, 3000.00);

SELECT
    user_id,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(total_price), 2) AS average_order_value,
    MAX(total_price) AS highest_order_value
FROM myntra_orders
GROUP BY user_id;

