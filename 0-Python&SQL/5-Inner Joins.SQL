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


-- Select country and language names, aliased
-- From countries (aliased)
-- Join to languages (aliased)
-- Use code as the joining field with the USING keyword
SELECT c.name AS country, l.name AS language
FROM countries AS c
INNER JOIN languages AS l
USING (code);


-- Rearrange SELECT statement, keeping aliases
-- Order the results by language
SELECT c.name AS country, l.name AS language
FROM countries AS c
INNER JOIN languages AS l
USING(code)
ORDER BY language;

-- Select relevant fields
-- Inner join countries and populations, aliased, on code
SELECT name, year, fertility_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code;

-- Add an additional joining condition such that you are also joining on year
SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
	AND p.year = e.year;