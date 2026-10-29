-- task 1

USE food_delivery_db;

INSERT INTO restaurants (name, rating, location)
VALUES
('Pizza Palace', 4.5, 'Ahmedabad'),
('Food Corner', 3.8, 'Surat'),
('Burger House', 4.7, 'Rajkot'),
('Spice Garden', 4.2, 'Vadodara'),
('Dominos', 4.6, 'Ahmedabad');

SELECT * FROM restaurants;

-- task 2

ALTER TABLE movies
ADD genre VARCHAR(50);

 select * from movies;
 
 SET SQL_SAFE_UPDATES = 0;
UPDATE movies
SET genre = 'Action'
WHERE movie_name IN ('Dangal', 'Pathaan', '3 Idiots');

UPDATE movies
SET genre = 'Drama'
WHERE movie_name = 'Dangal';

UPDATE movies
SET genre = 'Action'
WHERE movie_name = 'Pathaan';

SELECT *
FROM movies
WHERE release_year > 2020
AND genre = 'Action';

SET SQL_SAFE_UPDATES = 1;

-- task 3

ALTER TABLE products
ADD category VARCHAR(100);

SELECT * FROM products;

UPDATE products
SET category = 'Electronics'
WHERE product_id = 1;

UPDATE products
SET category = 'Clothing'
WHERE product_id = 2;

UPDATE products
SET category = 'Food'
WHERE product_id = 3;

SELECT *
FROM products
WHERE category <> 'Electronics'
OR price < 500;


SELECT * FROM products;

-- task 4

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100),
    followers INT
);

INSERT INTO users (name, location, followers)
VALUES
('Manoj', 'Ahmedabad', 1500),
('Rahul', 'Surat', 2000),
('Priya', 'Rajkot', 800),
('Amit', 'Vadodara', 1200),
('Neha', 'Ahmedabad', 500);

SELECT *
FROM users
WHERE NOT location = 'Ahmedabad'
AND followers > 1000;
