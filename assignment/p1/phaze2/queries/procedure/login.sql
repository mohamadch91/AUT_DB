DELIMITER //

CREATE PROCEDURE Login (
	IN username varchar(20),
    IN password varchar(128)
)
BEGIN
	IF EXISTS (SELECT * FROM user AS U WHERE U.ID = username AND U.PASSWORD_HASH = SHA2(password, 256)) THEN
		CALL AddSession(username);
        SELECT TRUE;
	ELSE
		SELECT FALSE;
	END IF;
END //

DELIMITER ;