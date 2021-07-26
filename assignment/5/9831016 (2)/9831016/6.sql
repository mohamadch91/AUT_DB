SELECT *
FROM PlayList NATURAL JOIN PlayListTrack ,track,genre
	where track.GenreId= Genre.GenreId  
	AND PlayListTrack.trackId= Track.trackId 
	AND PlayListTrack.playlistId=PlayList.playlistId 
and  Genre.Name <> 'Latin'