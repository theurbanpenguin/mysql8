CREATE USER IF NOT EXISTS 'tux'@'localhost' IDENTIFIED BY 'Password1';
SELECT user FROM mysql.user;
GRANT SELECT on northwind.* TO 'tux'@'localhost';
SHOW GRANTS for 'tux'@'localhost';