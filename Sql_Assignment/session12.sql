-- task 1

USE food_delivery_db;


CREATE TABLE IF NOT EXISTS SpotifyArtists (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100),
    followers BIGINT
);

INSERT IGNORE INTO SpotifyArtists (artist_id, name, followers) VALUES
(1, 'Taylor Swift', 120000000),
(2, 'Ed Sheeran', 110000000),
(3, 'Ariana Grande', 100000000),
(4, 'Drake', 90000000),
(5, 'The Weeknd', 80000000);

WITH TopArtists AS (
    SELECT artist_id, name, followers
    FROM SpotifyArtists
    ORDER BY followers DESC
    LIMIT 3
)
SELECT * FROM TopArtists;

-- task 2

CREATE TABLE IF NOT EXISTS FlipkartOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT IGNORE INTO FlipkartOrders VALUES
(1, 101, '2023-01-15', 5000),
(2, 102, '2023-01-20', 3000),
(3, 103, '2023-02-10', 7000),
(4, 104, '2023-02-18', 4000),
(5, 105, '2023-03-05', 10000),
(6, 106, '2023-03-15', 8000),
(7, 107, '2023-04-12', 6000);


WITH MonthlyTotals AS (
    SELECT
        MONTH(order_date) AS month_number,
        SUM(total_amount) AS total_sales
    FROM FlipkartOrders
    WHERE YEAR(order_date) = 2023
    GROUP BY MONTH(order_date)
)
SELECT month_number, total_sales
FROM MonthlyTotals
ORDER BY total_sales DESC
LIMIT 1;

-- task 3

CREATE TABLE IF NOT EXISTS CalendarDays (
    day_date DATE
);

WITH RECURSIVE DateCTE AS (
    SELECT CURDATE() AS day_date

    UNION ALL

    SELECT DATE_ADD(day_date, INTERVAL 1 DAY)
    FROM DateCTE
    WHERE day_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT day_date
FROM DateCTE;

-- task 4

CREATE TABLE IF NOT EXISTS ZomatoRestaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    rating DECIMAL(3,1)
);

INSERT IGNORE INTO ZomatoRestaurants VALUES
(1, 'Restaurant A', 'Ahmedabad', 4.5),
(2, 'Restaurant B', 'Ahmedabad', 4.2),
(3, 'Restaurant C', 'Mumbai', 3.5),
(4, 'Restaurant D', 'Mumbai', 3.8),
(5, 'Restaurant E', 'Delhi', 4.5),
(6, 'Restaurant F', 'Delhi', 4.7);

WITH CityRatings AS (
    SELECT city, AVG(rating) AS average_rating
    FROM ZomatoRestaurants
    GROUP BY city
)
SELECT r.*, c.average_rating
FROM ZomatoRestaurants r
JOIN CityRatings c ON r.city = c.city
WHERE c.average_rating > 4.0;

-- task 4

CREATE TABLE IF NOT EXISTS IPLMatches (
    match_id INT,
    team VARCHAR(100),
    runs INT,
    match_year INT
);

INSERT INTO IPLMatches VALUES
(1, 'CSK', 500, 2023),
(2, 'MI', 800, 2023),
(3, 'CSK', 700, 2023),
(4, 'MI', 600, 2023),
(5, 'RCB', 900, 2023),
(6, 'CSK', 900, 2023),
(7, 'MI', 700, 2023),
(8, 'RCB', 800, 2023);

WITH TeamRuns AS (
    SELECT team, SUM(runs) AS total_runs
    FROM IPLMatches
    WHERE match_year = 2023
    GROUP BY team
)
SELECT team, total_runs
FROM TeamRuns
WHERE total_runs > 2000
ORDER BY total_runs DESC;
