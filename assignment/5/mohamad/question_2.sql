SELECT Artist.name
FROM Track 
INNER JOIN Genre 
	ON Track.GenreId = Genre.GenreId
INNER JOIN Album 
	ON Track.AlbumId = Album.AlbumId
INNER JOIN Artist 
	ON  Artist.ArtistId = Album.ArtistId
WHERE Genre.name = 'latin'