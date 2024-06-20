-- Q1: Write query to return the email, first name, last name & Genre of all Rock Music Listeners.
--     Return Your list ordered alphabetically by email starting with A

-- METHOD 1.
SELECT DISTINCT email,first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;



-- METHOD 2.
SELECT DISTINCT email AS Email, First_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;	
	
	
	


-- Q2: Let's invite the artists who have written the most rock music in our dataset.
--	   write a query that returns the artist name and total track count of the top 10 rock bands.

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;





-- Q3: Return all the track names that have a song length longer than the average song length. 
--	   Return the Name and Milliseconds for each track.
--	   Order by the song length with tahe longest songs listed first.

-- METHOD 1.
SELECT name,milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track )
ORDER BY milliseconds DESC;




SELECT AVG(milliseconds) AS avg_track_length
	FROM track 



-- METHOD 2.	
SELECT name,milliseconds
FROM track
WHERE milliseconds > 393599
ORDER BY milliseconds DESC;
