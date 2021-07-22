DELIMITER //

CREATE PROCEDURE TweetList (
)
BEGIN
	CALL loginSession(@ID);

	SELECT *
	FROM message AS m
	WHERE m.TYPE=1 AND m.reciever = @ID
    AND NOT EXISTS (SELECT *
						FROM blocked AS B
                        WHERE B.blocker = @ID AND B.blocked = m.sender)
	AND NOT EXISTS (SELECT *
						FROM blocked AS B, twitt AS T
						WHERE T.ID = m.twitt_id AND B.blocker = T.USER_ID AND B.blocked = m.reciever) 
	ORDER BY datas DESC;
END //

DELIMITER ;