
select artist.name
from artist natural join album ,track
where album.albumid=track.albumid
having count(artist.name)>5