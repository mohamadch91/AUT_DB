DELIMITER //
create trigger find_tag
after insert  
on twitt
for each row
begin 
    SET @CONTENT=(SELECT twitt.text1 
					from twitt
					order by id desc  
					LIMIT 1);
	
    SET @LEN=CHAR_LENGTH(@CONTENT);
                    
	SET @ID=(SELECT id 
				from twitt
				order by id desc 
				LIMIT 1);
                
	SET @P=LOCATE('#', @CONTENT);
    
    WHILE @P > 0 DO
		SET @TAG=SUBSTRING(@CONTENT, @P, 6);
        INSERT INTO hashtag VALUES(@ID, @TAG);
        
        SET @CONTENT=SUBSTRING(@CONTENT, @P + 6, @LEN - @P - 5);
        SET @P=LOCATE('#', @CONTENT);
	END WHILE;
END //

DELIMITER ;