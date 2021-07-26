SELECT Artist.Name
FROM Track INNER JOIN Genre INNER JOIN Album INNER JOIN Artist 
	ON  Artist.ArtistId = Album.ArtistId
	ON Track.AlbumId = Album.AlbumId
	ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Latin'