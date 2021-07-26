SELECT Artist.Name
FROM Artist  JOIN Album
WHERE Album.AlbumId is null
