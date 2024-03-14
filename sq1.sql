CREATE DATABASE mel;
USE mel;

-- Q1:  Who is the senior most employee based on job title ?
SELECT TOP (1 ) *
FROM employee
ORDER BY levels DESC;

-- Q2: Which countries have the most invoices ?
SELECT * FROM invoice;
SELECT  billing_country  AS c, COUNT(total) AS total
FROM invoice
GROUP BY billing_country
ORDER BY total DESC;

--Q3. What are top 3 values of total invoives ?
SELECT TOP (3) *
FROM invoice
ORDER BY total DESC;

-- Q4: Write a query to return one city that has the 
-- highest sum of invoice totals. Return both the city name
-- and sum of all invoice totals

SELECT billing_city , SUM(total) as sum_of_invoice
FROM invoice
GROUP BY billing_city
ORDER BY sum_of_invoice DESC;

-- Q5: WAQ to return the name of the customer who has spent the most money
SELECT * FROM customer;
SELECT * FROM invoice;

SELECT  TOP (1) customer.customer_id, SUM(invoice.total) AS total
FROM customer
INNER JOIN invoice
ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id 
ORDER BY total DESC;

SELECT first_name
FROM customer
WHERE customer_id = 5;