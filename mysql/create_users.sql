SELECT user,host FROM mysql.user;

CREATE USER 'bob'@'localhost' IDENTIFIED BY 'Password1';
CREATE USER 'jane'@'192.168.1.1' IDENTIFIED BY 'Password1';
CREATE USER 'safi' IDENTIFIED BY 'Password1';

ALTER USER 'bob'@'localhost'
FAILED_LOGIN_ATTEMPTS 3
PASSWORD_LOCK_TIME 2;
