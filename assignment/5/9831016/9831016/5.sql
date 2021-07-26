SELECT Artist.Name
FROM Album INNER JOIN Artist 
	ON Album.ArtistId = Artist.ArtistId
GROUP BY Artist.Name 
HAVING COUNT(Artist.Name) > 5