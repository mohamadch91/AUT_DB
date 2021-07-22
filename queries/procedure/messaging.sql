DELIMITER //

CREATE PROCEDURE SendMessage (
	IN username varchar(20),
    IN content varchar(256)
)
BEGIN
	CALL loginSession(@ID);

	INSERT
    INTO message
    SELECT @ID, username, null, content, current_date(), 0
    WHERE   NOT EXISTS (SELECT *
						FROM blocked as B
						WHERE B.blocker = username AND B.blocker = @ID) and EXISTS (SELECT *
					FROM user 
                    WHERE ID = username) ; 
END //

DELIMITER ;