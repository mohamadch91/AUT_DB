DELIMITER //

create procedure blocked (
    in username varchar(20)
)
BEGIN
	call loginSession(@ID);
    
	select *
    from blocked
    where blocker=@ID and blocked=username;
END //

DELIMITER ;