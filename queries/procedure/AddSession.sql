DELIMITER //

create procedure session (
	in id varchar(20)
)
BEGIN
	insert
    into login (id, time)
    values(id, current_date());
END //

DELIMITER ;