-- SHOW AVAILABLE DATABASES
SHOW DATABASES;

-- Use DATA_C DATABASE
USE DATA_C;

--Show tables in DATABASE
SHOW TABLES;

-- Select name from people and sort alphabetically
SELECT name 
FROM people 
ORDER BY name;

-- Select the title and duration from longest to shortest film
SELECT title, duration
FROM films 
ORDER BY duration;

-- Select the release year, duration, and title sorted by release year and duration
SELECT release_year, duration, title
FROM films 
ORDER BY release_year, duration;

-- Select the certification, release year, and title sorted by certification and release year
SELECT certification, release_year, title
FROM films 
ORDER BY certification ASC, release_year DESC;

-- Find the release_year and film_count of each year
SELECT release_year, COUNT(*) AS film_count
FROM films
GROUP BY release_year;

-- Find the release_year and average duration of films for each year
SELECT release_year, AVG(duration) AS avg_duration
FROM films
GROUP BY release_year;

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year, country, MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;

-- Select the country and distinct count of certification as certification_count
-- Group by country
-- Filter results to countries with more than 10 different certifications
SELECT country, COUNT(DISTINCT(certification)) AS certification_count
FROM films
GROUP BY country
HAVING COUNT(DISTINCT(certification)) > 10;


-- Select the country and average_budget from films
-- Group by country
-- Filter to countries with an average_budget of more than one billion
-- Order by descending order of the aggregated budget
SELECT country, AVG(budget) AS average_budget
FROM films
GROUP BY country
HAVING AVG(budget) > 1000000000
ORDER BY average_budget DESC;


-- Select the release_year for films released after 1990 grouped by year
SELECT release_year
FROM films 
WHERE release_year > 1990
GROUP BY release_year;

-- Modify the query to also list the average budget and average gross
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross 
FROM films
GROUP BY release_year
HAVING release_year > 1990;

-- Modify the query to see only years with an avg_budget of more than 60 million
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000;

-- Order the results from highest to lowest average gross and limit to one
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY AVG(budget)
LIMIT 1;