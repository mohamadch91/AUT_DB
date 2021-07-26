select artist.name
from artist natural join album ,track ,genre
where  Genre.name <> 'latin' and album.albumid=track.albumid and genre.genreid=track.genreid