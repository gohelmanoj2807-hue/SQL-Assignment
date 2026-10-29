-- task 1

USE food_delivery_db;

SELECT NOW() AS CurrentDateTime;

-- task 2

SELECT
    order_date,
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    DAY(order_date) AS Day
FROM Orders;

-- task 3

CREATE TABLE IF NOT EXISTS Deliveries (
    delivery_id INT PRIMARY KEY,
    delivery_date DATE
);

INSERT IGNORE INTO Deliveries (delivery_id, delivery_date) VALUES
(1, '2026-10-28'),
(2, '2026-10-29'),
(3, '2026-10-30'),
(4, '2026-11-01');

SELECT
    delivery_date,
    DATE_SUB(delivery_date, INTERVAL 2 DAY) AS expected_pickup_date
FROM Deliveries;


-- task 4

CREATE TABLE IF NOT EXISTS Subscriptions (
    user_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

INSERT IGNORE INTO Subscriptions (user_id, start_date, end_date) VALUES
(1, '2026-01-01', '2026-01-31'),
(2, '2026-02-01', '2026-02-15'),
(3, '2026-03-01', '2026-03-20'),
(4, '2026-04-01', '2026-04-30');

SELECT
    user_id,
    start_date,
    end_date,
    DATEDIFF(end_date, start_date) AS total_days
FROM Subscriptions;

-- task 5

CREATE TABLE IF NOT EXISTS AppLogins (
    user_id INT PRIMARY KEY,
    last_login_date DATE
);

INSERT IGNORE INTO AppLogins (user_id, last_login_date) VALUES
(1, '2026-10-20'),
(2, '2026-09-01'),
(3, '2026-08-15'),
(4, '2026-10-25');

SELECT
    user_id,
    last_login_date
FROM AppLogins
WHERE DATEDIFF(NOW(), last_login_date) > 30;

