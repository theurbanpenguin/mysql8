CREATE DATABASE IF NOT EXISTS sample;
USE sample;
CREATE TABLE `user` (
  `UserID` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  PRIMARY KEY (`UserID`)
);

USE sample;
CREATE VIEW user_view AS
SELECT Username FROM `user`;

GRANT SELECT ON sample.user_view TO 'tux'@'localhost';

USE sample;
DELIMITER // ;
CREATE PROCEDURE insert_user(IN u_name varchar(20))
 BEGIN
  INSERT INTO `user` (Username) values(u_name);
 END//
DELIMITER ; //

GRANT EXECUTE ON PROCEDURE sample.insert_user TO 'tux'@'localhost';