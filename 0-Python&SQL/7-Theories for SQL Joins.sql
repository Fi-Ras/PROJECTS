USE countries;

-- Select all fields from economies2015
SELECT * FROM economies2015
-- Set operation
UNION
-- Select all fields from economies2019
SELECT * FROM economies2019
ORDER BY code, year;


-- Query that determines all pairs of code and year from economies and populations, without duplicates
SELECT code, year FROM economies
-- Set operation
UNION
-- Select all fields from economies2019
SELECT country_code, year FROM populations
ORDER BY code, year;

-- Return all cities with the same name as a country
SELECT name
FROM cities 
INTERSECT --MySQL do not support INTERSECT
SELECT name
FROM countries;
-- To adapt the Script
SELECT name
FROM cities
WHERE name IN (
    SELECT name
    FROM countries
);

-- Return all cities that do not have the same name as a country
SELECT name
FROM cities 
EXCEPT --MySQL do not support EXCEPT
SELECT name
FROM countries 
ORDER BY name;
-- To adapt the Script
SELECT cities.name
FROM cities
LEFT JOIN countries ON cities.name = countries.name
WHERE countries.name IS NULL
ORDER BY cities.name;