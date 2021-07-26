select reviewer.name,movie.title,rating.stars,rating.ratingdate
from movie,rating,reviewer
order by reviewer.name,movie.title,rating.stars