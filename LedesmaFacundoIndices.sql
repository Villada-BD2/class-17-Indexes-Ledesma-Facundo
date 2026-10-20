USE sakila;

SELECT DISTINCT postal_code
FROM address
WHERE postal_code IS NOT NULL
LIMIT 10;

EXPLAIN ANALYZE
SELECT *
FROM address
WHERE postal_code IN ("35200", "17886");

EXPLAIN ANALYZE
SELECT *
FROM address
WHERE postal_code NOT IN ("35200", "17886");

EXPLAIN ANALYZE
SELECT a.address, a.postal_code, c.city, co.country
FROM address a
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
WHERE a.postal_code IN ("35200", "17886");

CREATE INDEX idx_postal_code
ON address(postal_code);

EXPLAIN ANALYZE
SELECT *
FROM address
WHERE postal_code IN ("35200", "17886");

EXPLAIN ANALYZE
SELECT *
FROM address
WHERE postal_code NOT IN ("35200", "17886");

EXPLAIN ANALYZE
SELECT a.address, a.postal_code, c.city, co.country
FROM address a
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
WHERE a.postal_code IN ("35200", "17886");

EXPLAIN ANALYZE
SELECT *
FROM actor
WHERE first_name = "PENELOPE";

EXPLAIN ANALYZE
SELECT *
FROM actor
WHERE last_name = "GUINESS";

SHOW INDEX FROM actor;

CREATE INDEX idx_actor_first_name
ON actor(first_name);

EXPLAIN ANALYZE
SELECT *
FROM actor
WHERE first_name = "PENELOPE";

SELECT film_id, title, description
FROM film
WHERE description LIKE "%drama%";

SELECT film_id, title, description
FROM film_text
WHERE MATCH(title, description)
AGAINST("drama" IN NATURAL LANGUAGE MODE);

CREATE FULLTEXT INDEX idx_description_ft
ON film_text(description);

SELECT film_id, title, description
FROM film_text
WHERE MATCH(description)
AGAINST("drama" IN NATURAL LANGUAGE MODE);