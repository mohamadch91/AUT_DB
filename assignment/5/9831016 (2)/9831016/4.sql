SELECT SUM(Track.Bytes), SUM(Track.UnitPrice)
FROM Track NATURAL JOIN Genre 
	where  genre.GenreId=Track.GenreId 
WHERE Genre.Name = 'Grunge'