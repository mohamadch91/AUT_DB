DELIMITER //

CREATE PROCEDURE UserTweet (
	IN username varchar(20)
)
BEGIN
	SELECT *
    FROM twitt
    WHERE USER_ID = username;
END //

DELIMITER ;