select playlist.name
from playlist
where not exists(
select *
from playlist natural join playlisttrack,track,genre
where playlistTrack.Trackid=track.trackid and track.genreid=genre.genreid and genre.name='latin')