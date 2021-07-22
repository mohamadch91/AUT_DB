DELIMITER //

create procedure GetHashtag (
    in tag varchar(6)
)
BEGIN
	select *
    from twitt
    where id in (select twitt_id
					from hashtag
					where hashag.tag = tag);
END //

DELIMITER ;