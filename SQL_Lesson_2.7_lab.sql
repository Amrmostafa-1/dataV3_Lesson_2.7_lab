-- LAB 2.7
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
USE sakila;

SELECT category_id , COUNT(f.film_id)
FROM sakila.film f
JOIN sakila.film_category fc
USING (film_id)
GROUP BY fc.category_id
ORDER BY fc.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT s.staff_id ,s.first_name, sum(p.amount)
FROM sakila.staff s
JOIN sakila.payment p
USING (staff_id)
GROUP BY s.staff_id;

-- 3.Which actor has appeared in the most films?

SELECT a.actor_id ,a.first_name, a.last_name, COUNT(fa.film_id)
FROM sakila.actor a
JOIN sakila.film_actor fa
USING (actor_id)
GROUP BY a.actor_id
ORDER BY COUNT(fa.film_id) DESC;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT c.customer_id ,c.first_name, c.last_name, COUNT(r.rental_id) AS '#_of_rented_films'
FROM sakila.customer c
JOIN sakila.rental r
USING (customer_id)
GROUP BY c.customer_id
ORDER BY COUNT(r.rental_id) DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
USING (address_id);

-- 6. List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(fa.actor_id) AS '#_of_actors'
FROM sakila.film f
JOIN sakila.film_actor fa
USING (film_id)
GROUP BY f.film_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.last_name,  SUM(p.amount) AS 'Total_amount'
FROM sakila.customer c
JOIN sakila.payment p
USING (customer_id)
GROUP BY c.customer_id
ORDER BY c.last_name ASC;

-- 8. List the titles of films per category.

SELECT c.name, f.title
FROM sakila.film_category fc
JOIN sakila.film f
USING (film_id)
JOIN sakila.category c
USING (category_id);

