-- Q1: Find how much amount spent by each customer on artist?
-- WAQ to return customer name , artist name  and total  spent.

SELECT c.first_name customerName , art.name ArtistName , SUM(il.unit_price * il.quantity) AS totalCost 
FROM customer c
INNER JOIN invoice i
	ON i.customer_id = c.customer_id
INNER JOIN invoice_line il
	ON il.invoice_id = i.invoice_id
INNER JOIN track t
	ON t.track_id = il.track_id
INNER JOIN album a
	ON a.album_id = t.album_id
INNER JOIN artist art
	ON art.artist_id = a.artist_id
GROUP BY c.first_name, art.name
ORDER BY totalCost DESC;

-- Q2: Genre with the highest amount of purchases is the most popular genre
-- WAQ that returns each country along with the top genre . For countries
-- where the maximum number of purchases is shared  return all genres.

SELECT i.billing_country as country , COUNT(il.quantity) as Quantity , g.name
FROM invoice i
INNER JOIN invoice_line il
	ON i.invoice_id = il.invoice_id
INNER JOIN track t
	ON t.track_id = il.track_id
INNER JOIN genre g
	ON g.genre_id = t.genre_id
GROUP BY g.name, i.billing_country
ORDER BY Quantity DESC;


--Q3: WAQ that determines the customer that has spent the most on music
-- for each country. WAQ that returns the country along with the top customer
-- and how much they spent . For countries where the top amount spent  is shared
-- provide all customers who spent this amount.



SELECT c.first_name, billing_country, SUM(i.total) As spending
FROM invoice i
INNER JOIN customer c
	ON c.customer_id = i.customer_id
GROUP BY  billing_country,c.first_name 
ORDER BY SUM(i.total) DESC	;

