SELECT *
FROM Movie , Rating , Reviewer 
WHERE Movie.mID = Rating.mID AND Rating.rID = Reviewer.rID
order by Reviewer.Same, Movie.Title, Rating.Stars