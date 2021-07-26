DELIMITER //
CREATE PROCEDURE signup (
	IN fname varchar(30),
	IN lname varchar(30),
	IN id varchar(20),
    IN pass varchar(128),
    IN birthday date,
    IN login date,
    IN bio varchar(64)
)
BEGIN
	INSERT IGNORE
    INTO user
    VALUES(fname, lname, id, SHA2(pass, 256), birthday, login, bio);
    CALL AddSession(id);
END //
DELIMITER ;

