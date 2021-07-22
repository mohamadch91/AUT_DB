DELIMITER //

CREATE PROCEDURE GetTweet (
	IN username varchar(20)
)
BEGIN
	CALL ActiveSession(@ID);

	SELECT *
	FROM message AS M
	WHERE M.TYPE=1 AND M.sender = username AND M.reciever = @ID
    AND NOT EXISTS (SELECT *
						FROM blocked AS B
                        WHERE B.blocker = @ID AND B.blocked = username)
	AND NOT EXISTS (SELECT *
						FROM blocked AS B, twitt AS T
						WHERE T.ID = M.twitt_id AND B.blocker = T.USER_ID AND B.blocked = M.reciever)
	ORDER BY POSTAGE DESC;
END //

DELIMITER ;