create database Employee;
use Employee;
CREATE TABLE Employee (
 EmployeeId INT PRIMARY KEY,
 FullName VARCHAR(45) NOT NULL,
 Department VARCHAR(45) NOT NULL,
 Salary float NOT NULL,
 Gender VARCHAR(45) NOT NULL,
 Age INT NOT NULL
);

alter table emp add Location varchar(20);
alter table Employee add Serial int first;
alter table Employee add Title varchar(5) after EmployeeId; 
alter table employee drop location;
alter table employee drop Serial, drop Title;

desc employee;

alter table employee modify FullName varchar(60) unique;
Select*from employee;

alter table employee change column Department DEPT varchar(45); #Rename the Column
alter table employee rename to emp;
select*from emp;

update emp set location = "Thane";

INSERT INTO Employee values
(1001,"John Doe","IT",35000,"Male",25),
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27),
(1003, 'James Brown', 'Finance', 50000, 'Male', 28),
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26),
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25),
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27),
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28),
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28),
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);

CREATE TABLE Projects (
ProjectId INT PRIMARY KEY AUTO_INCREMENT,
 ProjectName VARCHAR(200) NOT NULL,
EmployeeId INT,
 StartDate DATETIME,
 EndDate DATETIME
);
INSERT INTO Projects VALUES
(1,'Develop Ecommerse Website from scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(2,'WordPress Website for our company', 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(3,'Manage our Company Servers', 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(4,'Hosting account is not working', 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(5,'MySQL database from my desktop application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
(6,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(),
INTERVAL 10 DAY)),
(7,'Migrate web application and database to new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5
DAY)),
(8,'Android Application development', 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(9,'Hosting account is not working', 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(10,'MySQL database from my desktop application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15
DAY)),
(11,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(),
INTERVAL 10 DAY));

CREATE TABLE Address
(
 AddressId INT PRIMARY KEY AUTO_INCREMENT,
 EmployeeId INT,
 Country VARCHAR(50),
 State VARCHAR(50),
 City VARCHAR(50)
 );
 INSERT INTO Address (EmployeeId, Country, State, City) Values (1001, 'India', 'Odisha', 'BBSR');
 INSERT INTO Address (EmployeeId, Country, State, City) Values (1002, 'India', 'Maharashtra', 'Mumbai');
 INSERT INTO Address (EmployeeId, Country, State, City) Values (1003, 'India', 'Maharashtra', 'Pune');
 INSERT INTO Address (EmployeeId, Country, State, City) Values (1004, 'India', 'Odisha', 'Cuttack');
 INSERT INTO Address (EmployeeId, Country, State, City) Values (1005, 'India', 'Maharashtra', 'Nagpur');
 INSERT INTO Address (EmployeeId, Country, State, City) Values (1006, 'India', 'Odisha', 'Cuttack');

select * from Employee;
select * from Projects;
select * from Address;

desc Employee;
desc Projects;
desc Address;
show tables;

truncate table projects; 


create table simple
(
id int primary key auto_increment,
remarks varchar(23)
);

insert into simple(remarks) values
("hello"),(
"Good Morning"),
("Bye");

select*from simple;
select*from simple_123;

create table simple_123
(
id int primary key auto_increment,
remarks varchar(23)
);
insert into simple_123 values (1001,"Hello");
insert into simple_123(remarks) values ("Good Morning"), ("How are you");


select now();
select date_add(now(),interval 30 day); #can be used to give end deadline

select*from emp;
alter table emp  add Title varchar(4);
update emp set title ="Mr.";
update emp set title ="Mrs." where gender = "Female";
update emp set salary = 55000 where FullName = "Mary Smith";
delete from emp where EmployeeId = 1010;

#Sorting in SQL
select*from emp order by Salary desc;
select*from emp order by FullName desc;
select*from emp order by Salary;

-- 4 clauses in SQL
-- W G H O --


# Limit Command
select*from emp order by Salary limit 3;
select*from emp limit 3;
select*from emp limit 5,3; #first number (5) is skipping first records and called offset and second number (3) is called limit which means it gives next 3 numbers
select*from emp limit 3 offset 5;

# for even and odd
select*from emp where employeeid %2=0;

select fullname, salary, (Salary*0.05) as Bonus from emp;
select max(salary) from emp;
select min(salary) from emp;
select avg(salary) from emp;

#Null command (total empty
select*from projects;
select*from projects where employeeid is null;
select*from projects where employeeid is not null;

#groupby command
select*from emp;
select dept, count(dept) from emp group by dept;
select dept, count(*) from emp group by dept;
select gender, count(*) from emp group by gender;
select dept, sum(salary) from emp group by dept;
select dept, avg(salary) from emp group by dept;


select dept, avg(age) from emp group by dept;
select dept, truncate(avg(age),0) from emp group by dept;

#Truncate function
select truncate(123.45345,2);
select truncate(123.45345,0);
select truncate(123.45345,-1);
select truncate(123.45345,-3);
select truncate(123.45345,-2);


