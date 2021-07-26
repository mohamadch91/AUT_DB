select distinct movie.year
from movie natural join rating
where rating.stars>=4 and rating.stars<=5