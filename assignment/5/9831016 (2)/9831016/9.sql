SELECT Movie.Title, MaX(Rating.Rate)
FROM Movie FULL JOIN RATING
WHERE Movie.mId = Rating.mID
Order by(Movie.title)