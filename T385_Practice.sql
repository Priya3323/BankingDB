show databases;
create database BankingDB;
use BankingDB;
create table Customers (CustomerID INT, FirstName varchar(50), LastName varchar(50), Email varchar(50), Phone varchar(15));
drop table Customers;
create table Customers (CustomerID INT primary key, FirstName varchar(50), LastName varchar(50), Email varchar(50), Phone varchar(15), AccountCreationDate DATE );
select*from Customers;
show tables;

desc customers; #to check the structure of table, we can know the dataypes of each column using describe command

Create table Accounts (
AccountID int,
AccountType varchar(20),
Balance decimal(10,2)
);

create table Transactions(
TransactionID int,
TransactionDate date,
Amount decimal(10,2),
TransactionType varchar(20)
);
desc Transactions;

create table Branches(
BranchID int,
BranchName Varchar(100),
BranchAdress varchar(200),
BranchPhone varchar(15)
);
show tables;
Select*from Branches;

Create table Loans(
LoanID int, LoanAmount decimal(10,2),
InterestRate decimal (5,2),
StartDate Date,
EndDate Date);