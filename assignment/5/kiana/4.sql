select track.bytes, avg(track.unitprice)
from track natural join PlaylistTrack,Playlist
where  playlist.name="grunge" and playlisttrack.playlistid=playlist.playlistID