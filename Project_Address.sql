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
#Group by using having clause

select dept, count(*) from emp group by dept having count(*)>2; #Having works on the result of group by (doing filtering on group by result)
select dept, count(*) from emp group by dept having dept="it";

select gender, sum(salary) from emp
group by gender having sum(salary)>200000;

select*from Address;
select state, count(*) from address group by state; #Statewise employees in address table 
select city, count(*) from address group by city;
select city, count(*) from address group by city having count(*)>1;

select*from projects;
select datediff(enddate,startdate) as duration from projects;
select datediff(enddate,startdate) as duration, count(*) from projects
group by datediff(enddate,startdate);
select datediff(enddate,startdate) as duration, count(*) from projects
group by datediff(enddate,startdate) having count(*)>=2;

#where clause
select datediff(enddate,startdate) as duration, count(*) from projects where employeeId>1004
group by datediff(enddate,startdate) having count(*)>=2;




select dept, avg(age) from emp group by dept;
select dept, truncate(avg(age),0) from emp group by dept;

#Truncate function
select truncate(123.45345,2);
select truncate(123.45345,0);
select truncate(123.45345,-1);
select truncate(123.45345,-3);
select truncate(123.45345,-2);

select distinct gender from emp; #used to find distinct values
select distinct dept, gender from emp;
select distinct gender, dept from emp;

#NOT in Operator
select*from emp where age not in (23,28); # IT will give the all the ages are not 23 and 28
select*from emp where employeeId not IN (1006, 1008);
#Between Operator
select*from emp where salary between 40000 and 60000; 
select*from emp where age between 26 and 28; 

#IN OPERATOR
select*from emp where age IN (26, 28); #SHOW ME ALL THE EMPLOYEES WHERE AGE IS EITHER 25 OR 28

#Like and not like Operator
select * from emp where fullname like "P%" ;
select * from emp where fullname like "%Y" ;
select * from emp where fullname like "%i%" ;
select * from emp where fullname like "_i%" ;
select * from emp where fullname like "__u%" ;
select * from emp where fullname like "%n__" ;
select * from emp where fullname not like "%n___" ;


#Null in SQL
select*from projects;
select*from projects where employeeid is not null;


#every table has only one primary key if there are 3 columns in a table which is unique and not null still sql consider first one as primary key by default
create table table2 (ID1 int unique not null,
ID2 int unique not null,
ID3 int unique not null);
desc table2;

#Check Constraint
create table voter_list (voter_ID int, Name varchar(100), age int check(age>=18));
desc voter_list;
select*from voter_list;
drop table voter_list;
insert into voter_list values (20067,"Anuja Patil", 16);
insert into voter_list values (20067,"Anuja Patil", 19);

#Default constraint
create table voter
(name varchar (10),
age int check (age>=18),
email varchar (20) default "dummy@gmail.com");
select *from voter;
insert into voter values
("sachin",18);
desc voter;

select*from projects where employeeId is null;
select*from projects where employeeId is not null;

#string function in SQL
#1. Concat
select*, concat(fullname, "-", employeeid) as Specific_code from emp;

#2. Lower 
select fullname, lower(fullname) from emp;
#3. Upper 
select fullname, upper(fullname) from emp;

#.4 Replace, it replaces just to display does not make any changes in actual table, if we want to make the changes we need touse update statement
select fullname, replace(fullname,"Mohanty","Kulkarni") as New_Name from emp;

update emp set fullname= "Sambit Kulkarni" where employeeid=1008;
 update emp set fullname= "Anurag Kulkarni" where employeeid=1006;
 select*from emp;
 
#5. Length Function
select length('Good Morning');
select fullname, length(fullname) as charactercount from emp;

#6. SUbstring
select substring("Mary Smith",2,3);
select fullname, substring(fullname,2,3) as partiall,
length(substring(fullname,2,3)) as length from emp;

#rtrim and rtrim and trim function
#--trim remove the spaces from both left and right, rtrim will do from right and ltrim will do from left

#Reverse function
select fullname, reverse(fullname) from emp;
select reverse("Priyanka");

#Maths Function
#1. Absolute function just give the actual unsigned whole number, (removing any signs)
select abs(-4352);
select abs(datediff(startdate, enddate)) as duration from projects;

#2. Modulus mod()- returns the reminder of the division
select mod(12,7);

#3. Floor and ceiling function {floor is lowest value of a decimal integer and ceiling is the highest value)
select floor(12.4);
select ceiling(14.9);

#4. Truncate function{it is a math function diff from actual truncate function}
select truncate(1434.5365752,-3); #as we move in negative direction it will be making zero as per the given condition
select exp(2);

select power(3,3); #power can be written as pow() as well, 
select sqrt(169); #find square root of values

#date function
select curdate(); #gives today's date
select now(); #give today's date along with time, in sql date format is always like "yyyy-mm-dd"
select sysdate();

#lastday() suggest last date of month
select last_day(now()); #give last date of month as per the date given
select last_day("2026-02-22");

#date_format
select date_format(now(),"%b"); #%b means shortcut of month
select date_format(now(),"%M"); #%M means full month
select date_format(now(),"%y"); # %y in lower case give last two digits
select date_format(now(),"%Y"); #%Y in upper give full year
select date_format(now(),"%a %D-%b"); 
select date_format(now(),"%j");
select date_format(now(),"%D-%M %Y"); 
select date_format("2028-08-15","%D-%M-%Y, %W") as Date; 
select abs(datediff("2001-08-15",now())) as Days;

select month(now());
select year(now());

#Aggreate function
select avg(salary) from emp where dept="IT"; #for average we use average
select count(*) from emp;
select max(salary) from emp where gender = 'male';
select min(salary) from emp where gender = 'male';
select avg(salary) from emp where gender = 'male';
select count(salary) from emp where gender = 'male';
