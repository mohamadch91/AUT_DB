DELIMITER //

CREATE PROCEDURE Replies (
	IN twittid int
)
BEGIN
	CALL loginSession(@ID);
    SET @RID=(SELECT ID
				FROM login 
				ORDER BY id 
				DESC LIMIT 1); 
    SET @SID=(SELECT user_id
				FROM twitt
                WHERE ID = twittid); 
	SELECT ID, USER_ID, text1, data1
    FROM twitt
    WHERE id IN (SELECT reply_id
					from reply
                    where twitt_id=twittid)
	AND NOT EXISTS (SELECT * 
						FROM blocked AS B, reply AS R JOIN twitt AS T ON T.ID = R.reply_id 
                        WHERE (B.blocker = T.ID and B.blocked = @RID) or (B.blocker = @RID and B.blocked = T.ID))                
	AND NOT EXISTS (SELECT * 
						FROM blocked 
                        WHERE blocker=@SID and blocked=@RID);

END //

DELIMITER ;