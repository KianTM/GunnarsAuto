USE master
IF EXISTS(select * from sys.databases where name='GunnarsAutoDB')
BEGIN
alter database GunnarsAutoDB set single_user with rollback IMMEDIATE
DROP DATABASE GunnarsAutoDB
END

CREATE DATABASE GunnarsAutoDB
USE GunnarsAutoDB

CREATE TABLE SalesPersons (
	SalesPersonId int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	Initials nchar(4) NOT NULL,
	Hired bit NOT NULL DEFAULT 1
)

CREATE TABLE Cars (
	CarId int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Brand nvarchar(100) NOT NULL,
	Model nvarchar(100) NOT NULL,
	Vin nchar(17) NOT NULL,
	RegisterNumber nvarchar(10),
	IsUsed bit NOT NULL
)

CREATE TABLE Sales (
	SalesId int NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Sold bit NOT NULL,
	SalesPerson int NOT NULL FOREIGN KEY REFERENCES SalesPersons(SalesPersonId),
	Car int NOT NULL FOREIGN KEY REFERENCES Cars(CarId),
	BuyPrice money NOT NULL,
	SalesPrice money
)

--CREATE TABLE Errors (
--	ErrorId int NOT NULL PRIMARY KEY IDENTITY(1, 1),
--	UserName nvarchar(100),
--	ErrorNumber int,
--	ErrorState int,
--	ErrorSeverity  INT,
--	ErrorLine int,
--	ErrorProcedure nvarchar(MAX),
--	ErrorMessage nvarchar(MAX),
--	ErrorDateTime datetime2
--)