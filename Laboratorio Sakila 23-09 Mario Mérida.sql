USE sakila;

-- 2
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- 3
SELECT title FROM film;

-- 4
SELECT DISTINCT l.name AS language
FROM film f
JOIN language l ON l.language_id = f.language_id;

-- 5.1
SELECT COUNT(*) AS total_stores FROM store;

-- 5.2
SELECT COUNT(*) AS total_staff FROM staff;

-- 5.3
SELECT CONCAT(first_name, ' ', last_name) AS employee_name
FROM staff
ORDER BY last_name, first_name;

-- 6.1
SELECT *
FROM actor
WHERE UPPER(first_name) = 'SCARLETT';

-- 6.2
SELECT *
FROM actor
WHERE UPPER(last_name) = 'JOHANSSON';

-- 6.3
SELECT COUNT(*) AS total_inventory_items FROM inventory;

-- 6.4
SELECT COUNT(*) AS total_rentals FROM rental;

-- 6.5
SELECT 
  MIN(rental_duration) AS min_rental_period_days,
  MAX(rental_duration) AS max_rental_period_days
FROM film;

-- 6.6
SELECT 
  MAX(length) AS max_duration,
  MIN(length) AS min_duration
FROM film;

-- 6.7
SELECT ROUND(AVG(length), 2) AS avg_duration_minutes
FROM film;

-- 6.8
SELECT 
  CONCAT(
    FLOOR(AVG(length)/60), 'h ',
    ROUND(MOD(AVG(length), 60)), 'm'
  ) AS avg_duration_h_m
FROM film;

-- 6.9
SELECT COUNT(*) AS films_over_3h
FROM film
WHERE length > 180;

-- 6.10
SELECT 
  CONCAT(first_name, ' ', UPPER(last_name), ' - ',
         LOWER(first_name), '.', LOWER(last_name), '@sakilacustomer.org') AS contact
FROM customer
ORDER BY last_name, first_name;

-- 6.11
SELECT MAX(CHAR_LENGTH(title)) AS longest_title_length
FROM film;
