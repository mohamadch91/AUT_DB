SELECT *
FROM PlayList NATURAL JOIN PlayListTrack NATURAL JOIN Track NATURAL JOIN Genre 
	ON Track.GenreId= Genre.GenreId  
	ON PlayListTrack.trackId= Track.trackId 
	ON PlayListTrack.playlistId=PlayList.playlistId 
WHERE Genre.Name <> 'Latin'