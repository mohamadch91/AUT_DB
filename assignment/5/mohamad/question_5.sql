SELECT artist.Name
FROM album 
INNER JOIN artist 
	ON album.ArtistId = artist.ArtistId
GROUP BY artist.Name 
HAVING COUNT(artist.Name) > 5