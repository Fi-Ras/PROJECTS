USE countries; 


-- Select country code for countries in the Middle East
SELECT code 
FROM countries 
WHERE region = 'Middle East';


-- Select unique language names
-- Order by the name of the language
SELECT DISTINCT (name)
FROM languages
ORDER BY name ASC;


-- Add syntax to use bracketed subquery below as a filter
SELECT DISTINCT name
FROM languages
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;


-- Select code and name of countries from Oceania
SELECT code, name 
FROM countries
WHERE continent = 'Oceania';


-- Filter for countries not included in the bracketed subquery
SELECT code, name
FROM countries
WHERE continent = 'Oceania'
  AND code NOT IN
    (SELECT code
    FROM currencies);


-- Select average life_expectancy from the populations table & filter for the year 2015
SELECT AVG(life_expectancy) 
FROM populations
WHERE year = 2015;


-- Filter for only those populations where life expectancy is 1.15 times higher than average
SELECT *
FROM populations
WHERE life_expectancy > 1.15 *
  (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015) 
    AND year = 2015;


-- Select relevant fields from cities table & filter using a subquery on the countries table
SELECT name, country_code, urbanarea_pop
FROM cities
WHERE name IN 
    (Select capital 
    FROM countries
    WHERE cities.country_code = countries.code)
ORDER BY urbanarea_pop DESC;


-- Find top nine countries with the most cities & Order by count of cities as cities_num
SELECT countries.name AS country, COUNT(*) AS cities_num
FROM countries
LEFT JOIN cities
ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;

-- Subquery that provides the count of cities   
SELECT countries.name AS country,
  (SELECT count(*)
   FROM cities
   WHERE cities.country_code = countries.code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;


-- Select code, and language count as lang_num
SELECT 
    code, 
    count(*) AS lang_num
FROM languages AS l
GROUP BY code;

-- Select local_name and lang_num from appropriate tables where codes match
SELECT local_name, lang_num
FROM countries,
  (SELECT code, COUNT(*) AS lang_num
  FROM languages
  GROUP BY code) AS sub
WHERE countries.code = sub.code
ORDER BY lang_num DESC;


-- Select relevant fields & Subquery returning country codes filtered on gov_form
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015 
  AND code NOT IN
  (SELECT code 
  FROM countries
  WHERE (gov_form LIKE '%Republic%') OR (gov_form LIKE '%Monarchy%'))
ORDER BY inflation_rate;


-- Select fields from cities
SELECT name, country_code, city_proper_pop, metroarea_pop, (city_proper_pop / metroarea_pop * 100) AS city_perc 
FROM cities
-- Use subquery to filter city names of countries in Europe or America
WHERE name IN 
    (SELECT capital
    FROM countries 
    WHERE continent = 'Europe' OR continent LIKE '%America')
-- Add filter condition such that metroarea_pop does not have null values
    AND metroarea_pop IS NOT NULL
-- Sort and limit the result
ORDER BY city_perc DESC
LIMIT 10;