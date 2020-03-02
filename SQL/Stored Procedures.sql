USE GunnarsAutoDB
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('GetAllSalesPersons') IS NOT NULL
BEGIN
	DROP PROCEDURE GetAllSalesPersons
END
GO
CREATE PROCEDURE GetAllSalesPersons
		
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	SELECT * FROM dbo.SalesPersons	

	END
GO

IF OBJECT_ID('GetSalesPerson') IS NOT NULL
BEGIN
	DROP PROCEDURE GetSalesPerson
END
GO
CREATE PROCEDURE GetSalesPerson
		@SalesPersonId [int]
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	SELECT * FROM dbo.SalesPersons
	WHERE (SalesPersonId = @SalesPersonId)

	END
GO

IF OBJECT_ID('CreateSalesPerson') IS NOT NULL
BEGIN
	DROP PROCEDURE CreateSalesPerson
END
GO
CREATE PROCEDURE CreateSalesPerson
	(
		@FirstName [nvarchar](100),
		@LastName [nvarchar](100),
		@Initials [nchar](4),
		@Hired [bit]
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	INSERT INTO dbo.SalesPersons
	(
		FirstName, LastName, Initials, Hired
	)
	VALUES
	(
		@FirstName,
		@LastName,
		@Initials,
		@Hired

	)

	END
GO

IF OBJECT_ID('UpdateSalesPerson') IS NOT NULL
BEGIN
	DROP PROCEDURE UpdateSalesPerson
END
GO
CREATE PROCEDURE UpdateSalesPerson
	(
		@SalesPersonId [int],
		@FirstName [nvarchar](100),
		@LastName [nvarchar](100),
		@Initials [nchar](4),
		@Hired [bit]
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN
		UPDATE dbo.SalesPersons
		SET  FirstName = @FirstName, LastName = @LastName, Initials = @Initials, Hired = @Hired
		WHERE (SalesPersonId = @SalesPersonId)
	END
GO


IF OBJECT_ID('GetAllCars') IS NOT NULL
BEGIN
	DROP PROCEDURE GetAllCars
END
GO
CREATE PROCEDURE GetAllCars
		
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	SELECT * FROM dbo.Cars	

	END
GO

IF OBJECT_ID('GetCar') IS NOT NULL
BEGIN
	DROP PROCEDURE GetCar
END
GO
CREATE PROCEDURE GetCar
		@CarId [int]
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	SELECT * FROM dbo.Cars
	WHERE (CarId = @CarId)

	END
GO

IF OBJECT_ID('CreateCar') IS NOT NULL
BEGIN
	DROP PROCEDURE CreateCar
END
GO
CREATE PROCEDURE CreateCar
	(
		@Brand [nvarchar](100),
		@Model [nvarchar](100),
		@Vin [nchar](17),
		@RegisterNumber [nvarchar](10),
		@IsUsed [bit]
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	INSERT INTO dbo.Cars
	(
		Brand, Model, Vin, RegisterNumber, IsUsed
	)
	VALUES
	(
		@Brand,
		@Model,
		@Vin,
		@RegisterNumber,
		@IsUsed

	)	

	END
GO

IF OBJECT_ID('UpdateCar') IS NOT NULL
BEGIN
	DROP PROCEDURE UpdateCar
END
GO
CREATE PROCEDURE UpdateCar
	(
		@CarId [int],
		@Brand [nvarchar](100),
		@Model [nvarchar](100),
		@Vin [nchar](17),
		@RegisterNumber [nvarchar](10),
		@IsUsed [bit]
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN
		UPDATE dbo.Cars
		SET  Brand = @Brand, Model = @Model, Vin = @Vin, RegisterNumber = @RegisterNumber, IsUsed = @IsUsed
		WHERE (CarId = @CarId)
	END
GO

IF OBJECT_ID('GetAllSales') IS NOT NULL
BEGIN
	DROP PROCEDURE GetAllSales
END
GO
CREATE PROCEDURE GetAllSales
		
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	SELECT * FROM dbo.Sales	

	END
GO

IF OBJECT_ID('GetSale') IS NOT NULL
BEGIN
	DROP PROCEDURE GetSale
END
GO
CREATE PROCEDURE GetSale
		@SalesId [int]
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	SELECT * FROM dbo.Sales
	WHERE (SalesId = @SalesId)

	END
GO

IF OBJECT_ID('CreateSales') IS NOT NULL
BEGIN
	DROP PROCEDURE CreateSales
END
GO
CREATE PROCEDURE CreateSales
	(
		@Sold [bit],
		@SalesPerson [int],
		@Car [int],
		@BuyPrice [money],
		@SalesPrice [money]
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	INSERT INTO dbo.Sales
	(
		Sold, SalesPerson, Car, BuyPrice, SalesPrice
	)
	VALUES
	(
		@Sold,
		@SalesPerson,
		@Car,
		@BuyPrice,
		@SalesPrice

	)	

	END
GO

IF OBJECT_ID('UpdateSales') IS NOT NULL
BEGIN
	DROP PROCEDURE UpdateSales
END
GO
CREATE PROCEDURE UpdateSales
	(
		@SalesId [int],
		@Sold [bit],
		@SalesPerson [int],
		@Car [int],
		@BuyPrice [money],
		@SalesPrice [money]
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN
		UPDATE dbo.Sales
		SET  Sold = @Sold, SalesPerson = @SalesPerson, Car = @Car, BuyPrice = @BuyPrice, SalesPrice = @SalesPrice
		WHERE (SalesId = @SalesId)
	END
GO

IF OBJECT_ID('GetCarsBySalesPerson') IS NOT NULL
BEGIN
	DROP PROCEDURE GetCarsBySalesPerson
END
GO
CREATE PROCEDURE GetCarsBySalesPerson
	@SalesPersonId [int]
	
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	SELECT c.*
	FROM dbo.Sales	
	JOIN dbo.Cars c ON dbo.Sales.Car = c.CarId
	WHERE SalesPerson = @SalesPersonId

	END
GO

IF OBJECT_ID('GetSalesBySalesPerson') IS NOT NULL
BEGIN
	DROP PROCEDURE GetSalesBySalesPerson
END
GO
CREATE PROCEDURE GetSalesBySalesPerson
	@SalesPersonId [int]
	
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	SELECT *
	FROM dbo.Sales	
	WHERE SalesPerson = @SalesPersonId

	END
GO