SELECT *
FROM PlayList 
INNER JOIN PlayListTrack 
	ON PlayListTrack.playlistId=PlayList.playlistId 
INNER JOIN Track 
	ON PlayListTrack.trackId= Track.trackId 
INNER JOIN Genre 
	ON Track.GenreId= Genre.GenreId  
WHERE genre.Name <> 'latin'