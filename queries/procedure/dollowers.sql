DELIMITER //

CREATE PROCEDURE MyFollowers (
)
BEGIN
	CALL loginSession(@ID);
    
	SELECT follower_id
    FROM follower
    WHERE following_id=@ID;
END //

DELIMITER ;