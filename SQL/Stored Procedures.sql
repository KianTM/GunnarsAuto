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
		@FirstName [nvarchar](100) = NULL,
		@LastName [nvarchar](100) = NULL,
		@Initials [nchar](4) NULL,
		@Hired [bit] = NULL
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN
		UPDATE dbo.SalesPersons
		SET  
			FirstName = ISNULL(@FirstName, FirstName),
			LastName = ISNULL(@LastName, LastName),
			Initials = ISNULL(@Initials, Initials),
			Hired = ISNULL(@Hired, Hired)

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
		@IsUsed [bit],
		@SalesPersonId [int],
		@Price [money]
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION

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

	DECLARE @LastInsertedId int;

	SET @LastInsertedId = SCOPE_IDENTITY();

	DECLARE @Today datetime2;
	
	SET @Today = GETDATE();
	
	EXEC CreateSales @Sold = 0, @SalesPerson = @SalesPersonId , @Car = @LastInsertedId, @BuyPrice = @Price, @SalesPrice = NULL, @BuyDate = @Today, @SalesDate = NULL;

	COMMIT
GO

IF OBJECT_ID('UpdateCar') IS NOT NULL
BEGIN
	DROP PROCEDURE UpdateCar
END
GO
CREATE PROCEDURE UpdateCar
	(
		@CarId [int],
		@Brand [nvarchar](100) = NULL,
		@Model [nvarchar](100) = NULL,
		@Vin [nchar](17) = NULL,
		@RegisterNumber [nvarchar](10) = NULL,
		@IsUsed [bit] = NULL
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN
		UPDATE dbo.Cars
		SET  
			Brand = ISNULL(@Brand, Brand), 
			Model = ISNULL(@Model, Model), 
			Vin = ISNULL(@Vin, Vin), 
			RegisterNumber = ISNULL(@RegisterNumber, RegisterNumber), 
			IsUsed = ISNULL(@IsUsed, IsUsed)

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
		@SalesPrice [money],
		@BuyDate [datetime2],
		@SalesDate [datetime2]
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

	INSERT INTO dbo.Sales
	(
		Sold, SalesPerson, Car, BuyPrice, SalesPrice, BuyDate, SalesDate
	)
	VALUES
	(
		@Sold,
		@SalesPerson,
		@Car,
		@BuyPrice,
		@SalesPrice,
		@BuyDate,
		@SalesDate
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
		@Sold [bit] = NULL,
		@SalesPerson [int] = NULL,
		@Car [int] = NULL,
		@BuyPrice [money] = NULL,
		@SalesPrice [money] = NULL,
		@BuyDate [datetime2] = NULL,
		@SalesDate [datetime2] = NULL
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN
		UPDATE dbo.Sales
		SET  
			Sold = ISNULL(@Sold, Sold), 
			SalesPerson = ISNULL(@SalesPerson, SalesPerson), 
			Car = ISNULL(@Car, Car), 
			BuyPrice = ISNULL(@BuyPrice, BuyPrice), 
			SalesPrice = ISNULL(@SalesPrice, SalesPrice),
			BuyDate = ISNULL(@BuyDate, BuyDate),
			SalesDate =ISNULL(@SalesDate, SalesDate)

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

IF OBJECT_ID('TotalSalesToday') IS NOT NULL
BEGIN
	DROP PROCEDURE TotalSalesToday
END
GO
CREATE PROCEDURE TotalSalesToday	
	
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

		SELECT SUM(data) AS Total FROM
		(
			SELECT CAST(s.SalesPrice AS decimal(34, 0)) AS data  FROM dbo.Sales s
			WHERE CONVERT(varchar(10), s.SalesDate, 102) = CONVERT(varchar(10), GETDATE(), 102)

		) AS Total

	END
GO

IF OBJECT_ID('TransactionsToday') IS NOT NULL
BEGIN
	DROP PROCEDURE TransactionsToday
END
GO
CREATE PROCEDURE TransactionsToday	
	
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

		SELECT SUM(data) AS Total FROM
		(
			SELECT CAST(s.BuyPrice AS decimal(34, 0)) AS data  FROM dbo.Sales s
			WHERE CONVERT(varchar(10), s.BuyDate, 102) = CONVERT(varchar(10), GETDATE(), 102)

		) AS Total

	END
GO

IF OBJECT_ID('MonthToDateSales') IS NOT NULL
BEGIN
	DROP PROCEDURE MonthToDateSales
END
GO
CREATE PROCEDURE MonthToDateSales
	@ChosenMonth [datetime2]
	
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

		SELECT SUM(data) AS Total FROM
		(
			SELECT CAST(s.SalesPrice AS decimal(34, 0)) AS data  FROM dbo.Sales s
			WHERE (MONTH(s.SalesDate) BETWEEN MONTH(@ChosenMonth) AND MONTH(GETDATE()))
			AND (YEAR(s.SalesDate) BETWEEN YEAR(@ChosenMonth) AND YEAR(GETDATE()))


		) AS Total

	END
GO

IF OBJECT_ID('YearToDateSales') IS NOT NULL
BEGIN
	DROP PROCEDURE YearToDateSales
END
GO
CREATE PROCEDURE YearToDateSales
	@ChosenYear [datetime2]
	
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN

		SELECT SUM(data) AS Total FROM
		(
			SELECT CAST(s.SalesPrice AS decimal(34, 0)) AS data  FROM dbo.Sales s
			WHERE (YEAR(s.SalesDate) BETWEEN YEAR(@ChosenYear) AND YEAR(GETDATE()))			


		) AS Total

	END
GO