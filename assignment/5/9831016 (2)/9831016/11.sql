SELECT DISTINCT Movie.year
FROM Movie NATURAL JOIN Rating 
where Movie.MovieID = Rating.MovieID
WHERE Rating.rate >= 4 AND Rating.rate <= 5 AND Rating.stars IS NOT NULL
order by Rating.ratingDate
