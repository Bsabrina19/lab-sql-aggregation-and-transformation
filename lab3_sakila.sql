# Chalenge 1:

USE sakila;

#the shortest and longest movie durations
SELECT 
    MAX(length) AS max_duration, 
    MIN(length) AS min_duration 
FROM film;

#the average movie duration in hours and minutes

SELECT 
    FLOOR(AVG(length) / 60) AS avg_hours, # FLLOR(x) Always rounds down to the nearest integer
    ROUND(AVG(length) - (FLOOR(AVG(length) / 60) * 60)) AS avg_minutes # ROUND(x,n) Rounds to the nearest integer (or n decimal places).
FROM film;

# the number of days that the company has been operating
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days 
FROM rental;

# rental information and adding columns 
SELECT rental_id, rental_date, 
       MONTHNAME(rental_date) AS rental_month, 
       DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

#BONUS  Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week
SELECT rental_id, rental_date, 
       DAYNAME(rental_date) AS rental_weekday,
       CASE 
           WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend' 
           ELSE 'workday' 
       END AS DAY_TYPE
FROM rental;

#
SELECT film_id, title, 
       IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY film_id ASC;

#BONUS :retrieve the concatenated first and last names of customers, along with the first 3 characters of their email address
SELECT CONCAT(first_name, ' ', last_name) AS full_name, #Combines first and last names into a single column
       LEFT(email, 3) AS email_prefix #Extracts the first 3 characters of the email address
FROM customer
ORDER BY last_name ASC;


# Challenge 2



