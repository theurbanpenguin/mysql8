USE sample;

CREATE TABLE department (
  DeptID smallint NOT NULL AUTO_INCREMENT,
  DeptName varchar(20) NOT NULL,
  PRIMARY KEY(`DeptID`)
);

INSERT INTO department (DeptName) VALUES('IT');
INSERT INTO department (DeptName) VALUES('Sales');

ALTER TABLE `user` ADD dept SMALLINT NOT NULL;

UPDATE user SET dept = 1;

ALTER TABLE `user`
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept)
REFERENCES department(DeptID);

INSERT INTO user (UserName, Dept) VALUES('FredB',2);

SELECT u.UserName, d.DeptName
FROM user AS u
JOIN department as d
ON u.dept = d.DeptID;
