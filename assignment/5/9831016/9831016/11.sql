SELECT DISTINCT Movie.year
FROM Movie NATURAL JOIN Rating 
	ON Movie.MovieID = Rating.MovieID
WHERE Rating.rate >= 4 and Rating.rate <= 5
ORDER BY Movie.year ASC