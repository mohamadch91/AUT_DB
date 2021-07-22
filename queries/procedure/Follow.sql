DELIMITER //

create procedure Follow (
    in username varchar(20)
)
BEGIN
	call loginSession(@id);
    
	insert
    into follower 
    values(@id, username);
END 
//DELIMITER ;