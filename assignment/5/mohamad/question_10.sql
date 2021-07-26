SELECT viewer.Name,Rating.stars,Rating.RatingDate, Movie.Title 
FROM Movie 
JOIN Rating 
	ON Movie.mID = Rating.mID
JOIN viewer 
	ON viewer.RateId = Rating.RateId
ORDER BY viewer.Name, Movie.Title, Rating.stars, Rating.RatingDate ASC