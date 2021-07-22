DELIMITER //

CREATE PROCEDURE Upvote (
    IN twittid int
)
BEGIN
	CALL ActiveSession(@id);
    
	INSERT
    INTO liked 
    SELECT twitt_id, @ID
    WHERE NOT EXISTS (SELECT * 
						FROM blocked as B, twitt AS T
						WHERE  t.user_id = B.blocker AND @id = B.blocked and  T.id = tweet_id );
END //

DELIMITER ;