USE sample;

DELIMITER //

CREATE PROCEDURE delete_user_by_username(IN u_name VARCHAR(20))
BEGIN
    DECLARE user_count INT;

    -- Start a transaction
    START TRANSACTION;

    -- Count the number of users matching the given username
    SELECT COUNT(*) INTO user_count
    FROM `user`
    WHERE Username = u_name;

    -- Check conditions and take actions accordingly
    IF user_count > 1 THEN
        -- Rollback if more than one user matches
        ROLLBACK;
        SIGNAL SQLSTATE '45000' -- User defined error code
            SET MESSAGE_TEXT = 'Multiple users found with the same username. Use UserID for precise deletion.';
    ELSEIF user_count = 0 THEN
        -- Rollback if no user matches
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No user found with the given username.';
    ELSE
        -- Delete the user if exactly one record matches
        DELETE FROM `user`
        WHERE Username = u_name;

        -- Commit the transaction
        COMMIT;
    END IF;
END//

DELIMITER ;