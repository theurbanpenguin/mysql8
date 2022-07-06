 USE sample;
 DELIMITER // ;
 CREATE PROCEDURE insert_user(IN u_name varchar(20))
 BEGIN
  INSERT INTO `user` (Username) values(u_name);
 END//
 DELIMITER ; //
 SHOW CREATE PROCEDURE insert_user;
 CALL insert_user('FredS');
 SELECT * FROM `user`;
 GRANT EXECUTE ON PROCEDURE sample.insert_user TO 'tux'@'localhost';
 SHOW GRANTS FOR 'tux'@'localhost';