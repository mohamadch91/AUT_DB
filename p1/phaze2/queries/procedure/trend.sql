DELIMITER //

CREATE PROCEDURE Trend (
)
BEGIN
	SET @AVERAGE=(SELECT AVG(A.counter)
					FROM (SELECT COUNT(user_id) 
							AS counter 
                            FROM liked 
                            GROUP BY twitt_id) 
						  AS a);
                          
	SELECT *
    FROM twitt AS T
    WHERE t.id IN (SELECT twitt_if
					FROM liked
					GROUP BY twitt_id
					having COUNT(user_id) > @AVERAGE);
END //

DELIMITER ;