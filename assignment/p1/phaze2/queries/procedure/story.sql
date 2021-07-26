DELIMITER //

CREATE PROCEDURE Timeline (
)
BEGIN
	CALL loginSession(@ID);
    
	SELECT ID, USER_ID, T.text1, T.data1
	FROM twitt as T
    WHERE 
    T.USER_ID IN (SELECT following_id FROM follower WHERE follower_id=@ID)
	AND NOT EXISTS (SELECT * FROM blocked WHERE blocker=@ID and blocked=T.USER_ID)
    ORDER BY T.data1 DESC;
END //

DELIMITER ;