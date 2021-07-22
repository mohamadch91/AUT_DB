DELIMITER //

create procedure GetMessage (
	IN username varchar(20)
)
BEGIN
	call loginSession(@id);

	select *
	from message
	WHERE reciever= @id and SENDER_ID = username and  type=0   
    and not exists (SELECT *
						from blocked
                        where blocker = @id and blocked = username)
	order by data desc;
END //

DELIMITER ;