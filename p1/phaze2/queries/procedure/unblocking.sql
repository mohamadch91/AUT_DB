DELIMITER //

CREATE PROCEDURE Unblock (
    IN username varchar(20)
)
BEGIN
	CALL loginSession(@ID);
    
	DELETE
    FROM blocked 
    WHERE blocker=@ID and blocked=username;
END //

DELIMITER ;