SELECT DISTINCT Movie.year
FROM Movie 
JOIN Rating 
	ON Movie.mid = Rating.mid
WHERE Rating.stars >= 4 and Rating.stars <= 5
ORDER BY Movie.year ASC