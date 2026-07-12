CREATE DATABASE User_db;

USE User_db;

-- CREATE Table emp(
--     userId INT PRIMARY KEY AUTO_INCREMENT,
--     username VARCHAR(50) NOT NULL,
--     usermail VARCHAR(50) UNIQUE,
--     age INT check(age>=18),
--     userphone INT
-- );

-- Create Table dept(
--     deptID INT PRIMARY KEY AUTO_INCREMENT,
--     depname VARCHAR(50) NOT NULL

-- );

-- (Add new column int he table)
-- ALTER Table emp ADD useraddress VARCHAR(100);
-- ALTER Table emp ADD userstatus TINYINT;

-- (Modify column's datatype size)
-- ALTER Table emp MODIFY usermail VARCHAR(100) NOT NULL;

-- (Changeing the column name)
-- ALTER Table emp CHANGE COLUMN useraddress address VARCHAR(100);

-- (Dropout a column)
-- ALTER TABLE emp DROP COLUMN address
-- ALTER TABLE emp DROP COLUMN userstatus

-- (Rename the table name)
-- ALTER Table emp RENAME to userlist;
-- ALTER Table userlist RENAME to emp;

-- (Insert single values in Rows and column in the table)
-- INSERT INTO emp( username,usermail,age,userphone)
-- VALUES("Soumalya","ajakjhb@gmail.com",21,905153);

-- (Insert multiple values in rowa and column)
-- INSERT INTO emp (username,usermail,age,userphone)
-- VALUES ("Raja","Rajhb@gmail.com",29,628981),
-- ("Lolita","lailahb@gmail.com",50,785532);


-- (Delete query used to delete data of one row only)
-- DELETE FROM emp WHERE `userId`=3;

-- (truncate query used to delete all data from a table)
-- TRUNCATE Table emp;

-- (Drop query used to delete whole table)
-- DROP Table dept;

-- (Update query used to update inside the row)
UPDATE emp SET
username="Fooltusi Roy",
usermail="rokomari@gmail.com"
WHERE `userId`=3;



