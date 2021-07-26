DELIMITER //

create procedure GetFollower (
	IN username varchar(20)
)
BEGIN
	select follower_id
    from follower
    where following_id=username;
END 
//DELIMITER ;