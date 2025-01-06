SET @rows_affected = 0;

START TRANSACTION; -- Start a transaction

-- Attempt to delete the user with a specific EmployeeID
DELETE FROM employees
-- WHERE employeeid = 10;

-- Capture the number of rows affected by the DELETE statement
SET @rows_affected = ROW_COUNT();

-- Conditional logic
IF @rows_affected = 1 THEN
    -- Commit the transaction if only one row was deleted
    COMMIT;
    SELECT 'Transaction committed: 1 row deleted.' AS Message;
ELSE
    -- Rollback the transaction if no rows or multiple rows were affected
    ROLLBACK;
    SELECT 'Transaction rolled back: 0 or more than 1 row affected.' AS Message;
END IF;
