-- task 1

USE food_delivery_db;

CREATE TABLE IF NOT EXISTS RestaurantReviews (
    review_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT IGNORE INTO RestaurantReviews (review_id, restaurant_name, rating)
VALUES
(1, 'Pizza Palace', 4.5),
(2, 'Pizza Palace', 4.2),
(3, 'Burger House', 3.8),
(4, 'Burger House', 4.1),
(5, 'Spice Hub', 4.8),
(6, 'Spice Hub', 4.6);

CREATE OR REPLACE VIEW TopRatedRestaurants AS
SELECT
    restaurant_name,
    AVG(rating) AS average_rating,
    COUNT(*) AS total_reviews
FROM RestaurantReviews
GROUP BY restaurant_name
HAVING AVG(rating) > 4.0;

SELECT * FROM TopRatedRestaurants;

-- task 2

CREATE TABLE IF NOT EXISTS Restaurants1 (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(100)
);

INSERT IGNORE INTO Restaurants1 (restaurant_id, restaurant_name, city)
VALUES
(1, 'Pizza Palace', 'Ahmedabad'),
(2, 'Burger House', 'Surat'),
(3, 'Spice Hub', 'Vadodara');

CREATE OR REPLACE VIEW TopRatedRestaurants AS
SELECT
    rr.restaurant_name,
    r.city,
    AVG(rr.rating) AS average_rating,
    COUNT(*) AS total_reviews
FROM RestaurantReviews rr
INNER JOIN Restaurants1 r
    ON rr.restaurant_name = r.restaurant_name
GROUP BY rr.restaurant_name, r.city
HAVING AVG(rr.rating) > 4.0;

SELECT * FROM TopRatedRestaurants;

-- task 3

UPDATE TopRatedRestaurants
SET average_rating = 5.0
WHERE restaurant_name = 'Pizza Palace';

-- task 4

CREATE TABLE IF NOT EXISTS SwiggyOrders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT IGNORE INTO SwiggyOrders (order_id, order_date, total_amount)
VALUES
(1, CURDATE(), 250.00),
(2, CURDATE(), 450.00),
(3, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 300.00),
(4, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 500.00),
(5, DATE_SUB(CURDATE(), INTERVAL 35 DAY), 200.00);

CREATE OR REPLACE VIEW DailyOrderSummary AS
SELECT
    order_date,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM SwiggyOrders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY order_date;

SELECT * FROM DailyOrderSummary
ORDER BY order_date DESC;

-- task 5

/* 1. Use Meaningful Names
Example: Create a view named FlipkartSalesSummary to show total sales and revenue.

2. Select Only Required Columns
Example: Show only product_name, price, and sold_count instead of using SELECT *.

3. Use Filters to Improve Reporting
Example: Use WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) to show sales from the last 30 days.*/



