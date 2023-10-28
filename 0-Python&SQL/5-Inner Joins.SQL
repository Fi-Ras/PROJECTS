-- Active: 1686445526786@@127.0.0.1@3306@countries
USE countries; 

-- Show tables 
SHOW TABLES;

-- Select all columns from cities
SELECT * FROM cities;

-- Inner join to countries
SELECT * 
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

-- Select name fields (with alias) and region 
SELECT cities.name AS city, countries.name AS country, countries.region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

-- Select fields with aliases
SELECT c.code AS country_code, c.name, e.year, e.inflation_rate
FROM countries AS c
-- Join to economies (alias e)
INNER JOIN economies AS e
-- Match on code field using table aliases
ON c.code = e.code;

SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
-- Match using the code column
USING(code);
