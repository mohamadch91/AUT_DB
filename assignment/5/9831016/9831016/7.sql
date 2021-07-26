SELECT Movie.Title
FROM Movie LEFT JOIN Rating 
	ON Movie.MovieID = Rating.MovieID
WHERE rate is null