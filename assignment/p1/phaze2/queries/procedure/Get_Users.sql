DELIMITER //

create procedure GetUsers()
BEGIN
	select *  from user;
END 
//DELIMITER ;