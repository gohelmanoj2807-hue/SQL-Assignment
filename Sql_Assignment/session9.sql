-- task 1

USE food_delivery_db;

CREATE TABLE influencers (
    influencer_id INT PRIMARY KEY,
    influencer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO influencers VALUES
(1, 'Rahul', 'Ahmedabad'),
(2, 'Priya', 'Mumbai'),
(3, 'Amit', 'Delhi');

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50),
    city VARCHAR(50)
);


INSERT INTO brands VALUES
(1, 'Nike', 'Ahmedabad'),
(2, 'Adidas', 'Mumbai'),
(3, 'Puma', 'Surat');

SELECT
    influencers.influencer_name,
    brands.brand_name
FROM influencers
LEFT JOIN brands
ON influencers.city = brands.city

UNION

SELECT
    influencers.influencer_name,
    brands.brand_name
FROM influencers
RIGHT JOIN brands
ON influencers.city = brands.city;

-- task 2

CREATE TABLE playlists (
    id INT PRIMARY KEY,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);

INSERT INTO playlists (id, playlist_name, parent_playlist_id)
VALUES
(1, 'My Music', NULL),
(2, 'Bollywood Songs', 1),
(3, 'English Songs', 1),
(4, 'Arijit Singh', 2),
(5, 'Rock Music', 3);

SELECT
    p.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM playlists p
LEFT JOIN playlists parent
ON p.parent_playlist_id = parent.id;

-- task 3

CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);

INSERT INTO offers VALUES
(1, '10% Discount'),
(2, 'Free Delivery'),
(3, 'Festive Sale');

SELECT
    u.name AS user_name,
    o.offer_title
FROM users u
CROSS JOIN offers o;


-- task 4

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Rahul', NULL),
(2, 'Amit', 1),
(3, 'Priya', 1),
(4, 'Neha', 2);

SELECT e.name AS employee_name,
       m.name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;

SELECT name AS employee_name
FROM employees
WHERE manager_id IS NULL;

-- task 5

SELECT 
    u1.name AS user1,
    u2.name AS user2,
    u1.location
FROM users u1
JOIN users u2
ON u1.location = u2.location
AND u1.id < u2.id;