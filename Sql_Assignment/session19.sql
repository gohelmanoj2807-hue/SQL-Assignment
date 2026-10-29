-- task 1

USE food_delivery_db;

DROP PROCEDURE IF EXISTS InsertOrders;

DELIMITER //

CREATE PROCEDURE InsertOrders()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10000 DO
        INSERT IGNORE INTO orders
        (order_id, user_id, amount, order_date)
        VALUES (
            i,
            (i MOD 1000) + 1,
            (i MOD 5000) + 100,
            DATE_ADD('2025-01-01', INTERVAL (i MOD 365) DAY)
        );

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

-- Execute procedure
CALL InsertOrders();

-- Check total rows
SELECT COUNT(*) AS total_orders
FROM orders;

-- Find orders for user 101
SELECT *
FROM orders
WHERE user_id = 101;

-- task 2

EXPLAIN SELECT *
FROM orders
WHERE user_id = 101;

CREATE INDEX idx_user_id
ON orders(user_id);

SELECT *
FROM orders
WHERE user_id = 101;

EXPLAIN SELECT *
FROM orders
WHERE user_id = 101;

-- task 3

SELECT *
FROM orders
WHERE user_id = 101;

SHOW INDEX FROM orders;

EXPLAIN
SELECT *
FROM orders
WHERE user_id = 101;

SELECT *
FROM orders
WHERE user_id = 101;

-- task 4

CREATE INDEX idx_category
ON products(category);

SELECT *
FROM products
WHERE category = 'Dairy';

EXPLAIN
SELECT *
FROM products
WHERE category = 'Dairy';

-- task 5

EXPLAIN
SELECT *
FROM orders
WHERE user_id = 101;

SELECT order_id, user_id, amount
FROM orders
WHERE user_id = 101;

EXPLAIN
SELECT order_id, user_id, amount
FROM orders
WHERE user_id = 101;
