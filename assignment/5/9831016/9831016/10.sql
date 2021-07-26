SELECT Viewer.Name, Rating.Stars, Rating.RatingDate, Movie.Title 
FROM Movie NATURAL JOIN Rating NATURAL JOIN Viewer 
	ON Movie.MovieID = Rating.MovieID
	ON viewer.RateId = Rating.RateId
ORDER BY Viewer.Name, Movie.Title, Rating.Rate, Rating.RatingDate ASC