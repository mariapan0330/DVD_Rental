-- Q1: How many actors are there with the last name 'Wahlberg'? ---------> actor
-- A1: 2
SELECT COUNT(*) FROM actor WHERE last_name = 'Wahlberg';


-- Q2: How many payments were made between $3.99 and $5.99? ---------> payment
-- A2: 5,607
SELECT COUNT(*) FROM payment WHERE amount BETWEEN 3.99 AND 5.99;


-- Q3: What films have exactly 7 copies? (search in inventory) ---------> inventory
-- A3: There's 116 of them. In order by film_id, starts with 4, 10, and 11, and ends with 982, 985, and 993.
-- In order by title, starts with "Affair Prejudice", "Aladdin Calendar", and "Alamo Videotape", and
-- ends with "Women Dorado", "Wonderland Christmas", and "Wrong Behavior".

SELECT film.title
FROM inventory
INNER JOIN film ON inventory.film_id = film.film_id -- source: W3Schools (https://www.w3schools.com/sql/sql_join_inner.asp)
GROUP BY film.title
HAVING COUNT(inventory.film_id) = 7
ORDER BY film.title;

-- also works but only returns the ids
SELECT film_id
FROM inventory
GROUP BY film_id
HAVING COUNT(*) = 7
ORDER BY film_id;


-- Q4: How many customers have the first name 'Willie'? ---------> customer
-- A4: 2
SELECT COUNT(*) FROM customer WHERE first_name = 'Willie';


-- Q5: What store employee (get the id) sold the most rentals (use the rental table) ---------> rental
-- A5: Employee #1 made 8,040 rentals
SELECT staff_id, COUNT(staff_id) FROM rental GROUP BY staff_id;


-- Q6: How many unique district names are there? ---------> address 
-- A6: 378 
--     but I got that by scrolling to the bottom of the rows returned.
--     I can't figure out how to make it just return the number of rows that would satisfy this request.
SELECT district FROM address GROUP BY district ORDER BY district;


-- Q7: What film has the most actors in it? (use film_actor table and get film_id) ---------> film_actor & film
-- A7: There are 6 of them

SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
HAVING COUNT(film_id) = 13;
-- this doesnt seem right. How do i just return max(count(film_id))?


-- Q8: From store_id 1, how many customers have a last name ending with 'es'? (use customer table) ---------> customer 
-- A8: 21
SELECT COUNT(*) FROM customer WHERE last_name LIKE '%es';


-- Q9: How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use GROUP BY and HAVING > 250) ---------> payment
-- (AKA How many different payment amounts are there that have had over 250 rentals from all the ppl between 380 and 430)
-- A9: 3
SELECT amount FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount HAVING count(amount) > 250;


-- Q10: Within the film table, how many rating categories are there? And what rating has the most movies total? ---------> film
-- A10: There are 5 possible ratings. The PG-13 rating has the most movies (223)
SELECT rating, count(rating) FROM film GROUP BY rating;





--SELECT -> necessary
--FROM -> necessary
--JOIN
--ON -> not possible without JOIN
--WHERE 
--GROUP BY
--HAVING -> not possible without HAVING
--ORDER BY
--OFFSET
--LIMIT