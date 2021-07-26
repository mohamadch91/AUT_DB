DELIMITER //

create procedure GetFollowing (
	in username varchar(20)
)
BEGIN
	select following_id
    from follower
    where follower_id=username;
END //

DELIMITER ;