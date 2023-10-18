-- SHOW AVAILABLE DATABASES
SHOW DATABASES;

-- Use DATA_C DATABASE
USE DATA_C;

--Show tables in DATABASE
SHOW TABLES;

-- Select film_ids and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_score 
FROM reviews
WHERE imdb_score > 7.0;

-- Select film_ids and facebook_likes for ten records with less than 1000 likes 
SELECT film_id, facebook_likes 
FROM reviews
WHERE facebook_likes < 1000 
LIMIT 10;

-- Count the records with at least 100,000 votes
SELECT COUNT(num_votes) AS films_over_100K_votes
FROM reviews
WHERE num_votes >= 100000;

-- Count the Spanish-language films
SELECT COUNT(language) As count_spanish
FROM films
WHERE language = 'Spanish';

-- Select the title and release_year for all German-language films released before 2000
SELECT title, release_year 
FROM films
WHERE language = 'German' AND release_year < 2000;

-- Update the query to see all German-language films released after 2000
SELECT title, release_year
FROM films
WHERE release_year > 2000
	AND language = 'German';


-- Find the title and year of films from 1990 or 1999
SELECT title, release_year
FROM films
WHERE release_year = 1990 OR release_year = 1999;

-- Add a filter to see only English or Spanish-language films
SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND 
	(language = 'English' OR language = 'Spanish');

-- Filter films with more than $2,000,000 gross
SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
	AND (gross > 2000000);

-- Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year 
FROM films 
WHERE release_year BETWEEN 1990 AND 2000;

-- Narrow down your query to films with budgets > $100 million
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND
	(budget > 100000000);

-- Restrict the query to only Spanish-language films
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
	AND language = 'Spanish';

-- Amend the query to include Spanish or French-language films
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
	AND (language = 'Spanish' OR language = 'French');

-- Select the names that start with B
SELECT name 
FROM people 
WHERE name LIKE 'B%';

-- Select the names that have r as the second letter
SELECT name
FROM people
WHERE name LIKE '_r';

-- Select names that don't start with A
SELECT name
FROM people
WHERE name NOT LIKE 'A%';

-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title, release_year 
FROM films 
WHERE release_year IN (1990, 2000) 
AND duration > 120;

-- Find the title and language of all films in English, Spanish, and French
SELECT title, language 
FROM films 
WHERE language IN ('English', 'Spanish', 'French');

-- Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek
SELECT title, certification, language 
FROM films 
WHERE (certification = 'NC-17' OR certification = 'R')
AND 
language IN ('English', 'Italian', 'Greek');

-- Count the unique titles
-- Narrow it down to G, PG, and PG-13 certifications
-- Filter to release_years between 1990 and 1999 (inclusive)
-- Filter for English-language films
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
WHERE release_year BETWEEN 1990 AND 1999
    AND language = 'English'
    AND certification IN ('G', 'PG', 'PG-13');

-- List all film titles with missing budgets
SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL

-- Count the number of films we have language data for
SELECT COUNT(*) AS count_language_known
FROM films
WHERE language IS NOT NULL;





