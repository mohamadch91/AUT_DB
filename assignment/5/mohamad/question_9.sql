SELECT Movie.title, SUM(Rating.stars)
FROM Movie 
JOIN Rating 
	ON Rating.mID=Movie.mID  
ORDER BY Title ASC