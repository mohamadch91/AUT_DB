SELECT SUM(Track.Bytes), SUM(Track.UnitPrice)
FROM Track 
INNER JOIN Genre 
	ON  Genre.GenreId=Track.GenreId 
WHERE Genre.Name = 'Grunge'