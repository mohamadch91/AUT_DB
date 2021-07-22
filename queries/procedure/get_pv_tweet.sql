DELIMITER //

create procedure getPVtwitt (
)
BEGIN
	CALL loginSession(@id);

	select *
    from twitt
    where user_id = @id
    order by data1 DESC;
END 
//DELIMITER ;