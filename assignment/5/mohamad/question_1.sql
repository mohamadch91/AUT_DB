SELECT Artist.name
FROM Artist
WHERE ArtistId
NOT IN
(SELECT ArtistId FROM Album)
