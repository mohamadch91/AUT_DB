DELIMITER //

create procedure Activity (
	IN username varchar(20)
)
BEGIN
	call loginSession(@ID);
    
	SELECT id, user_id, text1, data1
	from twitt as t
    where not exists (select * from blocked where blocker=@id and blocked=username) and
    t.user_id = username
	
    ORDER BY T.data1 DESC;
END //

DELIMITER ;