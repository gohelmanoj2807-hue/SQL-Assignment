-- task 1

USE food_delivery_db;

CREATE TABLE AppOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

CREATE TABLE InStoreOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO AppOrders VALUES
(1, 'Rahul', 250.00, '2026-10-25'),
(2, 'Priya', 400.00, '2026-10-26'),
(3, 'Amit', 350.00, '2026-10-27');

INSERT INTO InStoreOrders VALUES
(4, 'Neha', 300.00, '2026-10-25'),
(5, 'Karan', 500.00, '2026-10-26'),
(6, 'Riya', 200.00, '2026-10-27');

SELECT * FROM AppOrders;

SELECT * FROM InStoreOrders;

-- task 2

SELECT customer_name
FROM AppOrders

UNION

SELECT customer_name
FROM InStoreOrders;

-- task 3

SELECT order_id, customer_name, amount, order_date
FROM AppOrders

UNION ALL

SELECT order_id, customer_name, amount, order_date
FROM InStoreOrders;

-- task 4

INSERT INTO AppOrders VALUES
(7, 'Rahul', 250.00, '2026-10-28');

INSERT INTO InStoreOrders VALUES
(8, 'Rahul', 300.00, '2026-10-28');

SELECT customer_name FROM AppOrders
UNION
SELECT customer_name FROM InStoreOrders;

SELECT customer_name FROM AppOrders
UNION ALL
SELECT customer_name FROM InStoreOrders;