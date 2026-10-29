-- task 1

USE food_delivery_db;



CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    payment_method VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO orders (customer_name, payment_method, amount)
VALUES
('Manoj', 'UPI', 500),
('Rahul', 'Cash', 300),
('Priya', 'Credit Card', 800),
('Amit', 'UPI', 450),
('Neha', 'Cash', 600);

SELECT DISTINCT payment_method
FROM orders;

-- task 2

INSERT INTO users (name, location)
VALUES
('Manoj', 'Ahmedabad'),
('Rahul', 'Surat'),
('Priya', 'Rajkot'),
('Amit', 'Ahmedabad'),
('Neha', 'Vadodara');

SELECT DISTINCT location
FROM users
ORDER BY location ASC;

-- task 3

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100),
    booking_date DATE
);

INSERT INTO bookings (movie_name, booking_date)
VALUES
('Dangal', '2026-10-20'),
('Jawan', '2026-10-25'),
('Pathaan', '2026-10-15'),
('3 Idiots', '2026-10-27'),
('Animal', '2026-10-22'),
('KGF', '2026-10-18');

SELECT *
FROM bookings
ORDER BY booking_date DESC
LIMIT 5;

-- task 4

CREATE TABLE products1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    category VARCHAR(100),
    sold_count INT
);

INSERT INTO products1 (name, category, sold_count)
VALUES
('Mobile', 'Electronics', 500),
('Laptop', 'Electronics', 300),
('Shoes', 'Fashion', 700),
('Watch', 'Accessories', 250),
('Headphones', 'Electronics', 450),
('T-Shirt', 'Fashion', 600);

SELECT name, sold_count
FROM products1
ORDER BY sold_count DESC
LIMIT 10;