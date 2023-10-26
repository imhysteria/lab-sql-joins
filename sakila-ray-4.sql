USE sakila;

#1 List the number of films per category.

SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;

SELECT c.name as genre_name , COUNT(distinct fc.film_id) as number_of_movies
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY c.name ASC;

#2 Retrieve the store ID, city, and country for each store.

SELECT * FROM sakila.address;
SELECT * FROM sakila.country;
SELECT * FROM sakila.city;
SELECT * FROM sakila.store;

SELECT s.store_id, c.city, co.country FROM sakila.store s
JOIN sakila.address a
USING (address_id)
JOIN sakila.city c
USING (city_id)
JOIN sakila.country co
USING(country_id);


#3 Calculate the total revenue generated by each store in dollars.

SELECT * FROM sakila.store;
SELECT * FROM sakila.customer;
SELECT * FROM sakila.payment;

SELECT store.store_id, CONCAT('$ ', SUM(payment.amount)) AS total_revenue
FROM sakila.store
JOIN sakila.customer
ON store.store_id = sakila.customer.store_id
JOIN sakila.payment
ON customer.customer_id = payment.customer_id
GROUP BY store.store_id;


#4 Determine the average running time of films for each category.

SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.film;

SELECT c.name, AVG(f.length) AS average_time
FROM sakila.category c
JOIN sakila.film_category AS fc
USING (category_id)
JOIN sakila.film AS f 
ON fc.film_id = f.film_id 
GROUP BY c.name;

#5 Identify the film categories with the longest average running time.

SELECT * FROM sakila.film;
SELECT * FROM sakila.film_category;

SELECT fc.category_id, AVG(length) as average
FROM sakila.film f
JOIN sakila.film_category fc
USING (film_id)
GROUP BY fc.category_id
ORDER BY average DESC LIMIT 1;

#6 Display the top 10 most frequently rented movies in descending order.


#7 Determine if "Academy Dinosaur" can be rented from Store 1.

SELECT * FROM sakila.inventory;
SELECT * FROM sakila.film;

SELECT i.store_id, (IF(title = 'Academy Dinosaur','Yes','NO')) AS available
FROM sakila.inventory AS i
JOIN sakila.film AS f
USING(film_id)
WHERE f.title='Academy Dinosaur' and store_id = 1
GROUP BY store_id;


#8 Provide a list of all distinct film titles, along with their availability status in the inventory. 





SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;

SELECT c.name , COUNT(fc.film_id)
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY c.name ASC;

#2 Display the total amount rung up by each staff member in August of 2005.

SELECT * FROM sakila.staff;
SELECT * FROM sakila.payment;

SELECT staff.staff_id, staff.first_name, last_name, COUNT(payment.amount) AS total_by_staff
FROM sakila.staff
JOIN sakila.payment
ON staff.staff_id = payment.staff_id
WHERE YEAR(payment.payment_date) = 2005 AND MONTH(payment.payment_date) = 8
GROUP BY staff.staff_id
ORDER BY staff.staff_id ASC;

#3 Which actor appeared in most films

SELECT * FROM sakila.actor;
SELECT * FROM sakila.film_actor;

SELECT actor.actor_id, actor.first_name, last_name, COUNT(film_actor.film_id) AS total_movies
FROM sakila.actor
JOIN sakila.film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY total_movies DESC;


#4 Most active customer (the customer that has rented the most number of films)

SELECT * FROM sakila.customer;
SELECT * FROM sakila.rental;

SELECT customer.customer_id, customer.first_name, customer.last_name, COUNT(rental.customer_id) AS rental_counts
FROM sakila.customer
JOIN sakila.rental
ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY rental_counts DESC Limit 1;

#5 Display the first and last names, as well as the address, of each staff member.

SELECT * FROM sakila.staff;
SELECT * FROM sakila.address;

SELECT staff.address_id, staff.first_name, staff.last_name, CONCAT(address.address,' ', address.district) AS staff_address
FROM sakila.staff
JOIN sakila.address
USING (address_id);

#6 List each film and the number of actors who are listed for that film.

SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;

SELECT film.title, COUNT(DISTINCT film_actor.actor_id) AS number_actors
FROM sakila.film
JOIN sakila.film_actor
USING (film_id)
GROUP BY film.title;

#7 Using the tables payment and customer and the JOIN command, list the total paid by each customer.

SELECT * FROM sakila.payment;
SELECT * FROM sakila.customer;

SELECT customer.customer_id, customer.last_name AS customer_name, SUM(payment.amount) AS total_paid
FROM sakila.payment
JOIN sakila.customer
USING (customer_id)
GROUP BY customer.customer_id
ORDER BY customer_name ASC;

#8 List the titles of films per category.

SELECT * FROM sakila.film;
SELECT * FROM sakila.film_category;

SELECT film.title, film_category.category_id AS category
FROM sakila.film
JOIN sakila.film_category
USING (film_id);