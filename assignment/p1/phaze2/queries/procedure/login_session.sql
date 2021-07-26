DELIMITER //

create procedure  loginSession (
	out id varchar(20)
)
BEGIN
	SET ID=(
	select L.ID
	from login as l
    order by  l.counter
    desc limit  1);
END //

DELIMITER ;