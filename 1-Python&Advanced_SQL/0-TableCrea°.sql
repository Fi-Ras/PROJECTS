-- Create Database 
CREATE DATABASE European_Soccer_Database;

-- Use The DB
USE European_Soccer_Database;

-- CREATE TABLES
CREATE TABLE country (
	id INT NOT NULL, 
    name VARCHAR(150)
) ;

SELECT * FROM country;

CREATE TABLE matches (
	id INT NOT NULL, 
    country_id INT, 
    season VARCHAR(150), 
    stage INT,
    date VARCHAR(150),
    hometeam_id INT,
    awayteam_id INT,
    home_goal INT,
    away_goal INT
) ;

SELECT * FROM matches;

CREATE TABLE team (
	id INT NOT NULL, 
    team_api_id INT, 
    team_long_name VARCHAR(150),
    team_short_name VARCHAR(150)
) ;

SELECT * FROM team;

CREATE TABLE league (
	id INT NOT NULL, 
    country_id   INT, 
    name VARCHAR(150)
) ;

SELECT * FROM league;

-- Teams GERMANY

CREATE TABLE teams_germany (
	id INT NOT NULL, 
    team_api_id INT, 
    team_long_name VARCHAR(150), 
    team_short_name VARCHAR(50)
) ;

SELECT * FROM teams_germany;

-- Teams ITALY

CREATE TABLE teams_italy (
	id INT NOT NULL, 
    team_api_id INT, 
    team_long_name VARCHAR(150), 
    team_short_name VARCHAR(50)
) ;

SELECT * FROM teams_italy;

-- Matches GERMANY

CREATE TABLE matches_germany (
	id INT NOT NULL, 
    country_id INT, 
    season VARCHAR(150), 
    stage INT,
    date VARCHAR(150),
    hometeam_id INT,
    awayteam_id INT,
    home_goal INT,
    away_goal INT
) ;
SELECT * FROM matches_germany;

-- Matches ITALY

CREATE TABLE matches_italy (
	id INT NOT NULL, 
    country_id INT, 
    season VARCHAR(150), 
    stage INT,
    date VARCHAR(150),
    hometeam_id INT,
    awayteam_id INT,
    home_goal INT,
    away_goal INT
) ;

-- Matches_2013_2014

CREATE TABLE matches_2013_2014 (
	id INT NOT NULL, 
    country_id INT, 
    season VARCHAR(150), 
    stage INT,
    date VARCHAR(150),
    hometeam_id INT,
    awayteam_id INT,
    home_goal INT,
    away_goal INT
) ;

-- INSERT values using the CSV files And My SQL or Using INSERT INTO 