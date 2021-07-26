select artist.name
from artist
where not exists (
select * from  Artist FULL  JOIN Album on Artist.Artistid=Album.artistid)
	