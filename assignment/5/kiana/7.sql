select movie.title
from movie.natural join rating
where movie.mid=rating.mid