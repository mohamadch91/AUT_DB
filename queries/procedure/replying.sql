DELIMITER //

CREATE PROCEDURE Reply (
	IN twittid int,
    IN content varchar(256)
)
BEGIN
	CALL loginSession(@ID);
	CALL Twitt(content);
    SET @LID=(SELECT .ID 
					FROM twitt
					ORDER BY id DESC  
					LIMIT 1);
	SET @SID=(SELECT ID
				FROM login 
				ORDER BY id 
				DESC LIMIT 1); 
	
    INSERT
    INTO reply (twittid, reply_id) 
    SELECT twitt_id, @LID
    WHERE NOT EXISTS (
		SELECT *
        FROM twitt as T, blocked as B
        WHERE T.ID = twittid AND ((T.user_id = B.blocker AND @SID = B.blocked) or 
        (T.user_id = B.blocked AND @SID = B.blocker)));
END //

DELIMITER ;