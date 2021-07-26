select movie.title,max(rating.stars)
from movie natural join rating
where movie.mid=rating.mid
group by(movie.title)  Asc