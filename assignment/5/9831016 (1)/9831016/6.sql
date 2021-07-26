SELECT *
FROM PlayList NATURAL JOIN PlayListTrack NATURAL JOIN Track NATURAL JOIN Genre 
	ON Track.GenreId= Genre.GenreId  
	AND PlayListTrack.trackId= Track.trackId 
	AND PlayListTrack.playlistId=PlayList.playlistId 
WHERE Genre.Name <> 'Latin'