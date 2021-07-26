SELECT Movie.title
FROM Movie 
LEFT JOIN Rating 
	ON Rating.mID= Movie.mID
WHERE stars IS NULL