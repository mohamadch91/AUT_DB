DELIMITER //

create procedure voteCount (
    IN twittid int
)
BEGIN
	call loginSession(@ID);
	
	select COUNT(twitt_id)
    from liked
    where twitt_id = twittid
    and not exists  (select  * 
						from blocked as B, twitt AS T
						where T.ID = tweet_id and T.USER_ID = B.blocker and @id = B.blocked);
END //

DELIMITER ;