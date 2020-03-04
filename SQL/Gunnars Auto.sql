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
	SalesPrice money,
	BuyDate datetime2 NOT NULL DEFAULT GetDate(),
	SalesDate datetime2
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




insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Hyundai', 'Elantra', '5N1AT2MK6FC720196', 'JF44401', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Mercedes-Benz', 'SL-Class', 'WAUJT64B84N020271', 'KH30979', 1);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Lexus', 'ES', '5GALRAED5AJ051012', 'WK80268', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('GMC', 'Yukon XL 1500', '2G4GK5EX2F9188932', 'CJ95462', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Pontiac', 'Bonneville', '3FAHP0KCXAR727885', 'GU42268', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('BMW', 'M5', 'WAUAFAFL1EN716908', 'NQ60985', 1);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Nissan', 'Pathfinder', '1G6KD57YX2U158821', 'CT90292', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Lincoln', 'Town Car', '3C4PDDAGXFT034996', 'WY25770', 1);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Kia', 'Rio', 'WAUGL98E86A251374', 'QV90453', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Mitsubishi', 'Precis', 'WAUKF78P59A699258', 'ZH81471', 1);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Alfa Romeo', '164', '1GYFK63808R599685', 'ME21992', 1);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('GMC', 'Savana 1500', 'WAUR4AFD3CN230020', 'QE49780', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Saturn', 'L-Series', '19UUA66287A794116', 'SE87129', 1);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Acura', 'RL', 'KL4CJDSB9DB721826', 'XS55669', 1);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Ford', 'Bronco', '1G6DH577690801493', 'KA25444', 1);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Ford', 'Mustang', '5YMKT6C58F0699629', 'UG18177', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Suzuki', 'SJ 410', 'TRUTX28N521244394', 'RV36818', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Volkswagen', 'New Beetle', 'SALFR2BG0DH034641', 'YS08444', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Land Rover', 'Range Rover', 'SCFEDEANXCG939736', 'RT37226', 0);
insert into Cars (Brand, Model, Vin, RegisterNumber, IsUsed) values ('Mitsubishi', 'Eclipse', 'SCFPDCGP5EG686950', 'SS05328', 1);


insert into SalesPersons (FirstName, LastName, Initials, Hired) values ('Gunnar', 'Dannen-Skiold', 'GUDA', 1);
insert into SalesPersons (FirstName, LastName, Initials, Hired) values ('Jens-Ejner', 'Hansen', 'JEHA', 1);
insert into SalesPersons (FirstName, LastName, Initials, Hired) values ('Arne', 'Sigtenbjerggaard', 'ARSI', 1);
insert into SalesPersons (FirstName, LastName, Initials, Hired) values ('Berit', 'Sørensen', 'BESØ', 1);
insert into SalesPersons (FirstName, LastName, Initials, Hired) values ('Johann', 'Gambolputty', 'JOGA', 1);



insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (1, 5, 9, 4671, 6663, '2018-09-17', '2018-09-25');
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (0, 2, 9, 3945, null, '2020-01-27', null);
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (1, 3, 16, 7754, 3882, '2019-08-09', '2019-08-20');
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (0, 2, 17, 6361, null, '2019-11-13', null);
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (0, 4, 12, 3367, null, '2018-08-26', null);
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (0, 5, 19, 858, null, '2018-03-14', null);
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (0, 3, 13, 2783, null, '2019-12-20', null);
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (0, 3, 13, 7091, null, '2019-04-17', null);
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (0, 3, 19, 1491, null, '2016-03-16', null);
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (1, 5, 14, 4544, 8790, '2018-10-09', '2018-11-09');

insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (0, 4, 19, 721.14, 675.2, '2020-02-03', GETDATE());
insert into Sales (Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate) values (0, 3, 13, 6826.93, 5921.97, '2020-02-20', GETDATE());
