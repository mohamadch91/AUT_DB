DELIMITER //

create procedure MessageList (
)
BEGIN
	CALL loginSession(@id);

	select *
	from message as m
	where reciever = @id and TYPE=0  
    AND NOT EXISTS (SELECT *
					from blocked as b
					where b.blocker = @id and b.blocked = m.sender)
	order by data desc;
END //

DELIMITER ;