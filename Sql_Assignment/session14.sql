-- task 1

USE food_delivery_db;

DESCRIBE Orders;

ALTER TABLE Orders
ADD COLUMN order_date DATE;

SELECT
    order_id,
    user_id,
    order_date,
    amount,
    ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY order_date DESC
    ) AS row_num
FROM Orders;

-- task 2

CREATE TABLE IF NOT EXISTS Songs (
    song_id INT PRIMARY KEY,
    artist VARCHAR(100),
    streams BIGINT
);

INSERT IGNORE INTO Songs (song_id, artist, streams) VALUES
(1, 'Arijit Singh', 5000000),
(2, 'Arijit Singh', 8000000),
(3, 'Arijit Singh', 5000000),
(4, 'Shreya Ghoshal', 7000000),
(5, 'Shreya Ghoshal', 9000000),
(6, 'Shreya Ghoshal', 4000000);

SELECT
    song_id,
    artist,
    streams,
    RANK() OVER (
        PARTITION BY artist
        ORDER BY streams DESC
    ) AS song_rank
FROM Songs;

-- task 3

SELECT
    id,
    genre,
    release_year,
    DENSE_RANK() OVER (
        PARTITION BY genre
        ORDER BY  release_year DESC
    ) AS movie_rank
FROM Movies;


-- task 4

CREATE TABLE IF NOT EXISTS Influencers1 (
    id INT PRIMARY KEY,
    platform VARCHAR(50),
    followers INT
);

INSERT IGNORE INTO Influencers1 (id, platform, followers) VALUES
(1, 'Instagram', 500000),
(2, 'Instagram', 900000),
(3, 'Instagram', 700000),
(4, 'Instagram', 300000),
(5, 'Instagram', 800000),
(6, 'YouTube', 1000000),
(7, 'YouTube', 800000),
(8, 'YouTube', 1200000),
(9, 'YouTube', 600000);

WITH RankedInfluencers AS (
    SELECT
        id,
        platform,
        followers,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY followers DESC
        ) AS row_num
    FROM Influencers1
)
SELECT
    id,
    platform,
    followers,
    row_num
FROM RankedInfluencers
WHERE row_num <= 3
ORDER BY platform, row_num;