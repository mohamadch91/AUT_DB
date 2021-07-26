DELIMITER //

CREATE PROCEDURE Unfollow (
    IN username varchar(20)
)
BEGIN
	CALL loginSession(@ID);
    
	delete 
    FROM follower 
	WHERE follower_id=@ID and following_id=username;
END //

DELIMITER ;