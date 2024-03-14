-- Q1: WAQ to return the first name , last name , email ,  and genre of all 
-- rock music listeners . return your list ordered alphabetically by email 
-- starting with a

SELECT * FROM genre;       -- genre , genre id
SELECT * FROM customer;  -- email , first name , last name 
SELECT * FROM track; -- genre id

SELECT  DISTINCT email , first_name, last_name , genre.genre_id 
FROM customer
INNER JOIN invoice
	ON customer.customer_id = invoice.customer_id
INNER JOIN invoice_line
	ON invoice.invoice_id = invoice_line.invoice_id
INNER JOIN track
	ON track.track_id = invoice_line.track_id
INNER JOIN genre
	ON genre.genre_id = track.genre_id
WHERE genre.name = 'Rock'
--GROUP BY email, first_name, last_name , genre.genre_id
ORDER by email ASC;


-- Q2: WAQ that returns the artist name and total track count of the top 10 rock bands

SELECT TOP(10) artist.name , COUNT(artist.artist_id) AS popularity
FROM artist
INNER JOIN album
	ON artist.artist_id = album.artist_id
INNER JOIN track
	ON track.album_id = album.album_id
INNER JOIN genre
	 ON track.genre_id=genre.genre_id 
WHERE genre.name = 'Rock'
GROUP BY artist.name
ORDER BY popularity DESC;

-- Q3: Return all the song names that have a song length longer than the average song length.
-- Return the name and milliseconds for each track . Order by the song length  with the longest
-- songs listed first.

SELECT * FROM track; -- milliseconds

SELECT AVG(milliseconds) AS avgSongDuration FROM track; 

SELECT name , milliseconds AS duration
FROM track
WHERE milliseconds > (
		SELECT AVG(milliseconds)
		FROM track
	)
ORDER BY milliseconds DESC;






