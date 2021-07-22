DELIMITER //

CREATE PROCEDURE sned_twitt (
	IN username varchar(20),
    IN twittid int
)
BEGIN
	CALL loginSession(@ID);

	INSERT
    INTO message
    SELECT @ID, username, twittid, null, current_date(), 1
    WHERE EXISTS (SELECT *
					FROM user 
                    WHERE ID = username)
                     AND NOT EXISTS (SELECT *
						FROM blocked as B
						WHERE B.blocker = username AND B.blocked = @ID)
	AND EXISTS (SELECT *
					FROM twitt
                    WHERE ID = twittid)
   ; 
END //

DELIMITER ;