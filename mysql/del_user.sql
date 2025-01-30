USE sample;
DELIMITER // ;
CREATE PROCEDURE del_user(IN u_name VARCHAR(20))
BEGIN
    DECLARE user_count INT;
    SELECT COUNT(*) INTO user_count
    FROM `user`
    WHERE Username = u_name;

    IF user_count > 1 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Too many users';
    ELSEIF user_count = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Too few users';
    ELSE
        DELETE FROM `user`
        WHERE Username = u_name;
        COMMIT;
    END IF;
END//
DELIMITER ; //