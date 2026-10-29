-- task 1

USE food_delivery_db;

INSERT INTO Restaurants (name, rating, location)
VALUES
('Sunrise Cafe', 4.5, 'Ahmedabad'),
('Royal Restaurant', 4.2, 'Surat'),
('Green Cafe', 4.7, 'Rajkot'),
('City Food Cafe', 4.1, 'Vadodara'),
('Pizza House', 4.3, 'Ahmedabad');

SELECT *
FROM Restaurants
WHERE name LIKE '%Cafe';

-- task 2

INSERT INTO Products (product_name, price, category)
VALUES
('Headphones', 800, 'Electronics'),
('Keyboard', 1200, 'Electronics'),
('Mouse', 400, 'Electronics'),
('Shoes', 1500, 'Fashion'),
('Watch', 2000, 'Accessories');

SELECT *
FROM Products
WHERE price BETWEEN 500 AND 1500;

-- task 3

CREATE TABLE Users1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    city VARCHAR(100),
    followers INT
);


INSERT INTO Users1 (name, city, followers)
VALUES
('Manoj', 'Ahmedabad', 1500),
('Rahul', 'Surat', 2000),
('Priya', 'Rajkot', 800),
('Amit', 'Vadodara', 1200),
('Neha', 'Mumbai', 900);

SELECT *
FROM Users1
WHERE city IN ('Ahmedabad', 'Surat', 'Vadodara');

-- task 4

use music_streaming_db;

CREATE TABLE Songs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(100),
    artist_name VARCHAR(100)
);

INSERT INTO Songs (song_name, artist_name)
VALUES
('Perfect', 'Ed Sheeran'),
('Believer', 'Imagine Dragons'),
('Hello', 'Ariana Grande'),
('Shape of You', 'Charlie Puth'),
('Stay', 'Justin Bieber');

SELECT *
FROM Songs
WHERE artist_name LIKE '%ar%';

