DELIMITER //

create procedure haveUser (
	in username varchar(20)
)
BEGIN
	select *
	from user AS u
	where u.id = username;
END //

DELIMITER ;