SELECT Movie.Title, Rating.Stars
FROM Movie, Rating 
WHERE Movie.mID = Rating.mID 
	AND stars = (SELECT MAX(stars)
		     FROM rating
                      WHERE mID = Movie.mID
		     )
order by Movie.title	