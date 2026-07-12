CREATE DATABASE Student_DB;

USE Student_DB;

CREATE Table Student(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    age INT check(age>=18),
    course VARCHAR(50) 
);

INSERT INTO Student(name,email,age,course)
VALUES ("Rupam Islam","islamic@gmail.com",51,"Singer"),
("Soumalya Dere","abc@gmail.com",21,"B.Tech"),
("AR Rahman","rehman@gmail.com",60,"Music Composer"),
("Dwayne Johnson","johnson@gmail.com",56,"Wrestler"),
("Aditya Chopra","chopra@gmail.com",70,"Director"),
("Netaji S. C. Bose","bosesc@gmail.com",21,"Freedom Fighter");

-- UPDATE Student set course="MCA" WHERE student_id=3;

-- UPDATE Student set age=56 WHERE student_id=2;

-- DELETE FROM Student WHERE student_id=2;


-- --------------(SELECT query )---------------- --

SELECT * FROM Student;      -- * used to show all data in the table


SELECT student_id as ID,name,course FROM student;     /* column name show specific column details.
                                                            useing as clause can change the column name */

-- (Where clause for comparison operator)
-- Equal to operator
SELECT * FROM student WHERE course="B.TECH";
-- not equal to operator
SELECT * FROM student WHERE age != 21;
-- greater than or equalto operator
SELECT * FROM student WHERE age>40;
-- less than or equalto operator
SELECT * FROM student WHERE age<50;

-- IN operator
SELECT * FROM student WHERE student_id in(1,2,5,6);

-- not in operator
SELECT * FROM student WHERE student_id NOT in(1,5,6);


-- like clause used to show according to letter from start
SELECT * FROM student WHERE name LIKE "S%";
/*We use both side also %S% */

-- like clause used to show according to letter from end
SELECT * FROM student WHERE name LIKE "%a";

-- not like 
SELECT * FROM student WHERE name NOT LIKE "S%";


-- where clause operators - logical and null operator
SELECT * FROM student WHERE course="B.tech" and age>20;

SELECT * FROM student WHERE course="B.tech" or age>50;

SELECT * FROM student WHERE NOT course="B.tech" 

UPDATE student SET age=NULL WHERE student_id in (6,7);

SELECT * FROM student WHERE age is NULL;

SELECT * FROM student WHERE age is NOT NULL;


-- Sorted the data in the db

SELECT * FROM student ORDER BY age ASC;

SELECT * FROM student ORDER BY age DESC;

-- Limit ketword use to limit the data in row
SELECT * FROM student ORDER BY age  LIMIT 4;

/* limit with start(OFFset) and count 
    limit start,count*/

SELECT * FROM student LIMIT 1,3;

SELECT * FROM student ORDER BY name ASC LIMIT 1,4;

/* String operation using Upper and Lower clause*/

SELECT UPPER(name) as NameUpper FROM student;

SELECT *,UPPER(name) as NameUpper FROM student;

SELECT *,LOWER(name) as NameLower FROM student;

-- Using CONCAT clause
SELECT CONCAT(name,' - ',course) as Name_course FROM student;

-- Using substring clause
SELECT SUBSTRING(UPPER(name),1,4) as Namesubstring FROM student;

-- length clause to find the 
SELECT name,LENGTH(name) as lenName FROM student;

UPDATE student SET
course=CONCAT(" ",course," ") WHERE student_id in(1,2,3,4);

-- trim clause
SELECT TRIM(course) FROM student;


-- Numeric Functions
UPDATE student SET
course="BCA" WHERE student_id in(6,8);

-- abs() use to return absolute value(only positive value)
SELECT ABS(age) as age from student;    

-- Round(x,y) rounds number x to y decimal places
SELECT ROUND(age,2) as age from student -- can't run this beacuse we dont have fractional value

-- Floor() rounds down to nearest integer (10.9 -> 10 , 10.1 -> 10)
SELECT FLOOR(10.9);

-- Ceil()/Ceiling() Rounds up to nearest integer (10.1 -> 11)
SELECT CEIL(10.1);

-- Mod(x,y) return remainder after division x/y (17/5 -> 2)
SELECT MOD(17,5);

---- Aggregate Functions

/* Count() counts number of records and 
sum() calculate total values 
avg() find the average value
max() find the maximum value
min() find the minimum value */

SELECT COUNT(*) as count,
SUM(age) as totalage,
AVG(age) as avgage,
MAX(age) as maxage,
MIN(age) as minage from student;


-- group by using aggregate function
SELECT course, SUM(age) as total from student GROUP BY course;

SELECT course, COUNT(*) as count from student GROUP BY course;

-- Having() filters grouped records created by group by based on a condition

SELECT course, count(*) as count from student GROUP BY course HAVING count >= 2;



-- Primary Key & Foreign Key
CREATE Table employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    Foreign Key (dept_id) REFERENCES Student(student_id)
)

INSERT INTO employees(emp_id,emp_name,salary,dept_id) 
VALUES (1,'Amit',50000,1),
(2,'Priya',60000,6),
(3,'Rahul',55000,3),
(4,'Sneha',70000,4),
(5,'Rohit',48000,NULL),
(6,'Anajli',52000,5),
(7,'Arjun',55000,4),
(8,'Puja',50000,NULL),
(9,'Deepak',62000,3),
(10,'Nikhil',57000,6),
(11,'Sakshi',50000,4),
(12,'Tanvi',59000,1);

SELECT * FROM employees

-- Inner join concept
SELECT e.emp_id,e.emp_name,e.salary ,s.student_id,s.course,s.name 
FROM employees e 
INNER JOIN student s on e.dept_id=s.student_id ORDER BY emp_id;

-- Left join (return all employees rows)
SELECT e.emp_id,e.emp_name,e.salary ,s.student_id,s.course,s.name 
FROM employees e 
LEFT JOIN student s on e.dept_id=s.student_id ORDER BY emp_id;

-- Right join(return all right table)
SELECT e.emp_id,e.emp_name,e.salary ,s.student_id,s.course,s.name 
FROM employees e 
INNER JOIN student s on e.dept_id=s.student_id ORDER BY emp_id;

-- Using UNION joint (combine 2 queries)

SELECT emp_name,dept_id FROM employees WHERE dept_id=1
UNION
SELECT emp_name,dept_id FROM employees WHERE dept_id=3;

-- Self Join (a table joins with itself. useful for hierarchy of comparing rows)

ALTER Table employees
ADD manager_id INT,
ADD constraint FOREIGN KEY(manager_id)
REFERENCES employees(emp_id);

UPDATE employees SET manager_id=2
WHERE emp_id IN (4,5);

SELECT e1.emp_name,e2.emp_name as manager
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id=e2.emp_id;

-- Cross Join (it combines every row from the first table with every row from the second table[cartesian product])

CREATE Table colors(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    colorName VARCHAR(50)
);

INSERT INTO colors (Id,colorName) VALUES
(1,'red'),
(2,'blue');

CREATE Table sizes(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    sizeName VARCHAR(50)
);

INSERT INTO sizes (Id,sizeName) VALUES
(1,'XXL'),
(2,'XL');

SELECT c.colorName,s.sizeName 
FROM colors c CROSS JOIN sizes s; 


-- Subquery(Inner query) --> [a subquery is a query nested inside another query]

SELECT max(salary) as secondMax FROM employees
WHERE salary<(SELECT max(salary) FROM employees);

SELECT emp_name,salary,dept_id,
(SELECT MAX(salary) FROM employees e2 WHERE e2.dept_id=e1.dept_id)
as deptMaxsalary
FROM employees e1;

--View (use as a virtual table)
CREATE View employee_salary_view as 
SELECT emp_name,salary FROM employees
WHERE salary>50000;

SELECT * FROM employee_salary_view;

-- Index (cluster,non-cluster, unique index) used for fast data filtering

CREATE INDEX idx_employee_name
ON employees(emp_name);

SELECT * FROM employees WHERE emp_name="Priya";


-- Case statement (If-then-else)

SELECT emp_name,salary,(

    CASE 
        WHEN salary>100000 THEN "High"  
        WHEN salary BETWEEN 50000 and 100000 THEN "Medium"
        ELSE  "Low"
    END

) as salaryCategory FROM employees;


-- Function
DELIMITER $$
CREATE Function getAnnualSalary(monthSalary INT)
RETURNS INT
DETERMINISTIC
begin
    RETURN monthSalary*12;
END $$ DELIMITER;

SELECT emp_name,salary,getAnnualSalary(salary) as AnnualSalary
FROM employees;

-- Store Prodedure

DELIMITER $$ 
CREATE Procedure getEmpbyDeptId(deptId INT)
begin
    SELECT emp_id,emp_name,salary FROM employees
    WHERE dept_id=deptId;
END $$
DELIMITER;

CALL getempbyDeptId(3);


-- Trigger
-- Before Trigger - executes before the data modification occurs

DELIMITER $$
CREATE Trigger before_insert_employees
BEFORE INSERT ON employees
for EACH ROW
begin
    IF new.salary<0 or new.salary is null THEN
        set new.salary=0;
    end if;
end $$
DELIMITER;

-- INSERT INTO employees(emp_name,salary,dept_id) 
-- VALUES ('Amit',-50000,1);

-- INSERT INTO employees(emp_name,salary,dept_id) 
-- VALUES ('washin',50000,3);

-- SELECT * FROM employees

-- After trigger - exevutes after the data modification occurs


