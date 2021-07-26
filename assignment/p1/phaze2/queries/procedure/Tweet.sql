DELIMITER //

CREATE PROCEDURE twitt (
    IN content varchar(256)
)
BEGIN
    CALL loginSession(@ID);

	INSERT
    INTO twitt (user_id, text1, data1)
    VALUES(@ID, content, current_date());
END //

DELIMITER ;