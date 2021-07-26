SELECT Movie.Title, MAX(Rating.Rate)
FROM Movie NATURAL JOIN Rating 
	ON Rating.MovieID=Movie.MovieID  
ORDER BY Title ASC