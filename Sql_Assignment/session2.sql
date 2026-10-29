-- task 1
USE food_delivery_db;

SHOW TABLES;

CREATE TABLE restaurants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);

INSERT INTO restaurants (name, rating, location)
VALUES
('Pizza Hut', 4.2, 'Ahmedabad'),
('Dominos', 4.5, 'Surat'),
('McDonalds', 4.0, 'Vadodara');

SELECT * FROM restaurants;


-- task 2

CREATE TABLE zomato_reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO zomato_reviews (name, rating)
VALUES
('Pizza Palace', 4.5),
('Burger King', 4.2),
('Food Corner', 3.8),
('Dominos', 4.7);

SELECT name, rating
FROM zomato_reviews;

-- task 3

CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100),
    release_year INT
);

INSERT INTO movies (movie_name, release_year)
VALUES
('Dangal', 2016),
('Pathaan', 2023),
('3 Idiots', 2009);

SELECT 
    movie_name AS 'Title',
    release_year AS 'Year Released'
FROM movies;

-- task 4

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT
);

INSERT INTO products (product_name, price, quantity)
VALUES
('Milk', 60.00, 10),
('Cheese', 250.00, 5),
('Butter', 100.00, 8);

SELECT * FROM products;