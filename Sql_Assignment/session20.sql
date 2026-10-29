-- task 1

CREATE DATABASE ipl_database;

USE ipl_database;

CREATE TABLE ipl_matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    season VARCHAR(20),
    city VARCHAR(100),
    match_date DATE,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    toss_winner VARCHAR(100),
    winner VARCHAR(100),
    result VARCHAR(50),
    player_of_match VARCHAR(100)
);

INSERT INTO ipl_matches
(season, city, match_date, team1, team2,
 toss_winner, winner, result, player_of_match)
VALUES
('2023', 'Ahmedabad', '2023-03-31',
 'Gujarat Titans', 'Chennai Super Kings',
 'Chennai Super Kings', 'Gujarat Titans',
 'Wickets', 'Rashid Khan'),

('2023', 'Chennai', '2023-04-03',
 'Chennai Super Kings', 'Lucknow Super Giants',
 'Chennai Super Kings', 'Chennai Super Kings',
 'Runs', 'Moeen Ali'),

('2023', 'Bengaluru', '2023-04-02',
 'Royal Challengers Bangalore', 'Mumbai Indians',
 'Mumbai Indians', 'Royal Challengers Bangalore',
 'Wickets', 'Virat Kohli');
 
SELECT * FROM ipl_matches;

SELECT COUNT(*) AS total_matches
FROM ipl_matches;

-- task 2

SELECT *
FROM ipl_matches
WHERE team1 = 'Mumbai Indians'
   OR team2 = 'Mumbai Indians';
   
-- task 3

SELECT team, COUNT(*) AS total_matches
FROM (
    SELECT team1 AS team FROM ipl_matches
    UNION ALL
    SELECT team2 AS team FROM ipl_matches
) AS all_teams
GROUP BY team
ORDER BY total_matches DESC;

-- task 4

SELECT
    winner AS team,
    COUNT(*) AS total_wins
FROM ipl_matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY total_wins DESC;

-- task 5

create database ipl_db;

