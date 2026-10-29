-- task 1

USE food_delivery_db;

SELECT
    user_id,
    COUNT(order_id) AS total_orders
FROM food_orders
GROUP BY user_id;

-- task 2


CREATE TABLE transactions (
    transaction_id INT,
    user_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50)
);


INSERT INTO transactions (transaction_id, user_id, amount, payment_method)
VALUES
(1, 101, 500.00, 'UPI'),
(2, 102, 1200.00, 'Credit Card'),
(3, 103, 300.00, 'UPI'),
(4, 101, 800.00, 'Debit Card'),
(5, 102, 700.00, 'Credit Card');

SELECT
    payment_method,
    SUM(amount) AS total_amount_spent
FROM transactions
GROUP BY payment_method;

-- task 3

DESCRIBE movies;

CREATE TABLE movies1 (
    movie_id INT,
    genre VARCHAR(50),
    box_office_collection DECIMAL(12,2)
);


INSERT INTO movies1 (movie_id, genre, box_office_collection)
VALUES
(1, 'Action', 15.00),
(2, 'Comedy', 5.00),
(3, 'Action', 8.00),
(4, 'Drama', 12.00),
(5, 'Comedy', 3.00);

SELECT
    genre,
    SUM(box_office_collection) AS total_collection
FROM movies1
GROUP BY genre
HAVING SUM(box_office_collection) > 10;

-- task 4

CREATE TABLE playlist (
    playlist_id INT,
    user_id INT,
    song_id INT,
    duration INT
);

INSERT INTO playlist (playlist_id, user_id, song_id, duration)
VALUES
(1, 101, 501, 2000),
(1, 101, 502, 2500),
(1, 101, 503, 3000),
(2, 102, 504, 1800),
(2, 102, 505, 2000),
(3, 103, 506, 4000),
(3, 103, 507, 3500);

SELECT
    user_id,
    SUM(duration) AS total_duration
FROM playlist
GROUP BY user_id
HAVING SUM(duration) > 7200;
