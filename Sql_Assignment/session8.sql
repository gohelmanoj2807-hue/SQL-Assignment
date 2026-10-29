-- task 1

CREATE DATABASE join_practice;


USE join_practice;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (user_id, username, city)
VALUES
(1, 'Manoj', 'Ahmedabad'),
(2, 'Rahul', 'Surat'),
(3, 'Amit', 'Vadodara');

INSERT INTO Orders (order_id, user_id, product, amount)
VALUES
(101, 1, 'Laptop', 45000.00),
(102, 1, 'Mouse', 500.00),
(103, 2, 'Mobile', 15000.00),
(104, 2, 'Headphones', 2000.00),
(105, 1, 'Keyboard', 1200.00);

SELECT * FROM Users;
SELECT * FROM Orders;

-- task 2

SELECT Users.username, Orders.product
FROM Users
INNER JOIN Orders
ON Users.user_id = Orders.user_id;


-- task 3

SELECT Users.username, Orders.product
FROM Users
LEFT JOIN Orders
ON Users.user_id = Orders.user_id;

-- task 4

SELECT Orders.order_id, Orders.product, Users.username
FROM Users
RIGHT JOIN Orders
ON Users.user_id = Orders.user_id;

-- task 5

CREATE TABLE Users1 (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50),
    segment_id INT
);

CREATE TABLE CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50)
);

CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

ALTER TABLE Users1
ADD CONSTRAINT fk_customer_segment
FOREIGN KEY (segment_id)
REFERENCES CustomerSegments(segment_id);

INSERT INTO CustomerSegments (segment_id, segment_name)
VALUES
(1, 'Regular'),
(2, 'Premium'),
(3, 'New Customer');

INSERT INTO Users1 (user_id, username, city, segment_id)
VALUES
(1, 'Manoj', 'Ahmedabad', 2),
(2, 'Rahul', 'Surat', 1),
(3, 'Amit', 'Vadodara', 3);

INSERT INTO Orders1 (order_id, user_id, product, amount)
VALUES
(101, 1, 'Pizza', 500.00),
(102, 1, 'Burger', 250.00),
(103, 2, 'Sandwich', 150.00),
(104, 2, 'Biryani', 300.00),
(105, 3, 'Pasta', 200.00);

SELECT
    Users1.username,
    CustomerSegments.segment_name,
    COALESCE(SUM(Orders1.amount), 0) AS total_order_amount
FROM Users1
INNER JOIN CustomerSegments
    ON Users1.segment_id = CustomerSegments.segment_id
LEFT JOIN Orders1
    ON Users1.user_id = Orders1.user_id
GROUP BY
    Users1.user_id,
    Users1.username,
    CustomerSegments.segment_name;

