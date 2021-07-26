SELECT Artist.Name
FROM Artist 
WHERE (SELECT count (*)
	FROM Artist A, Album, Track 
	WHERE Track.AlbumId = Album.AlbumId 
		AND ArtistId = A.ArtistId 
		AND A.ArtistId = Album.ArtistId)>5