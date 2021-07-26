DELIMITER //

create procedure block (
    in username varchar(20)
)
BEGIN
	call loginSession(@id);
    
	insert
    into blocked 
    values(@id, username);
END //

DELIMITER ;