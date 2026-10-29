-- task 1

USE food_delivery_db;

DESCRIBE users;

SELECT CONCAT(name, '') AS full_name
FROM users;

-- task 2

DESCRIBE playlists;

DROP TABLE IF EXISTS playlists;

CREATE TABLE playlists (
    id INT PRIMARY KEY,
    song_title VARCHAR(100)
);

INSERT INTO playlists (id, song_title) VALUES
(1, 'Kesariya'),
(2, 'Tum Hi Ho'),
(3, 'Apna Bana Le'),
(4, 'Perfect');


SELECT UPPER(song_title) AS song_title
FROM playlists;

-- task 3

CREATE TABLE IF NOT EXISTS food_items (
    id INT PRIMARY KEY,
    item_code VARCHAR(100)
);

SELECT TRIM(item_code) AS item_code
FROM food_items;

-- task 4

SELECT RIGHT(id, 7) AS movie_number
FROM movies;

-- task 5

CREATE TABLE IF NOT EXISTS product_skus (
    id INT PRIMARY KEY,
    sku_code VARCHAR(100)
);

INSERT IGNORE INTO product_skus (id, sku_code) VALUES
(1, 'MOB-123-XY'),
(2, 'LAP-456-AB'),
(3, 'TAB-789-CD');

SELECT REPLACE(sku_code, '-', '_') AS sku_code
FROM product_skus;

