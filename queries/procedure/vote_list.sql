DELIMITER //

create procedure voteList (
    IN twittid int
)
BEGIN
	call loginSession(@id);
	
	select user_id
    from liked
    where twitt_id = twittid
    and not exists (select * 
						from blocked as B, twitt AS T
						where T.ID = twitt_id AND T.user_id = B.blocker AND @ID = B.blocked);
END //

DELIMITER ;