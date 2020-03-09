USE GunnarsAutoDB
GO

IF OBJECT_ID('TotalSalesToday') IS NOT NULL DROP FUNCTION TotalSalesToday;
GO
CREATE FUNCTION TotalSalesToday()
RETURNS decimal(34, 0)
AS
BEGIN

Declare @Result as decimal(34, 0)

SET @Result = (SELECT SUM(data) AS Total FROM
		(
			SELECT CAST(s.SalesPrice AS decimal(34, 0)) AS data  FROM dbo.Sales s
			WHERE CONVERT(varchar(10), s.SalesDate, 102) = CONVERT(varchar(10), GETDATE(), 102)

		) AS Total)

RETURN @Result
END
GO

IF OBJECT_ID('TransactionsToday') IS NOT NULL DROP FUNCTION TransactionsToday;
GO
CREATE FUNCTION TransactionsToday()
RETURNS decimal(34, 0)
AS
BEGIN

Declare @Result as decimal(34, 0)

SET @Result = (SELECT SUM(data) AS Total FROM
		(
			SELECT CAST(s.BuyPrice AS decimal(34, 0)) AS data  FROM dbo.Sales s
			WHERE CONVERT(varchar(10), s.BuyDate, 102) = CONVERT(varchar(10), GETDATE(), 102)

		) AS Total)

RETURN @Result
END
GO

EXEC tsqlt.NewTestClass 'TotalTest';
GO

CREATE PROCEDURE TotalTest.[test TotalSalesToday should return 150 if there is two sales today with 50 and 100]
AS
BEGIN
--Assemble: Fake the Particle table to make sure 
  --          it is empty and has no constraints
  EXEC tSQLt.FakeTable 'Sales';
  INSERT INTO Sales VALUES(0, 4, 19, 7210, 50, '2020-02-03', GETDATE());
  INSERT INTO Sales VALUES(0, 3, 13, 6826, 100, '2020-02-20', GETDATE());
  insert into Sales values (0, 4, 19, 7210, 675, '2020-02-03', DATEADD(DAY, -1, GETDATE()));

  DECLARE @Expected AS decimal(34, 0) = 150;
  DECLARE @Actual AS decimal(34, 0);

  SELECT @Actual = TotalSalesToday();

  EXEC tSQLt.AssertEquals @Expected,@Actual;

END;
GO

CREATE PROCEDURE TotalTest.[test TransactionsToday should return 150 if there is two transaction today with 50 and 100]
AS
BEGIN
--Assemble: Fake the Particle table to make sure 
  --          it is empty and has no constraints
  EXEC tSQLt.FakeTable 'Sales';
  INSERT INTO Sales VALUES(0, 4, 19, 50, 50, GETDATE(), DATEADD(DAY, 1, GETDATE()));
  INSERT INTO Sales VALUES(0, 3, 13, 100, 100, GETDATE(), DATEADD(DAY, 1, GETDATE()));
  insert into Sales values (0, 4, 19, 7210, 675, DATEADD(DAY, -1, GETDATE()), DATEADD(DAY, 1, GETDATE()));

  DECLARE @Expected AS decimal(34, 0) = 150;
  DECLARE @Actual AS decimal(34, 0);

  SELECT @Actual = TransactionsToday();

  EXEC tSQLt.AssertEquals @Expected,@Actual;

END;
GO

CREATE PROCEDURE TotalTest.[test MonthToDateSales should return 150 if the chosen month is last month and there is two sales beween last month and today]
AS
BEGIN
--Assemble: Fake the Particle table to make sure 
  --          it is empty and has no constraints
  EXEC tSQLt.FakeTable 'Sales';
  INSERT INTO Sales VALUES(0, 4, 19, 50, 50, DATEADD(DAY, -1, GETDATE()), GETDATE());
  INSERT INTO Sales VALUES(0, 3, 13, 100, 100, DATEADD(MONTH, -2, GETDATE()), DATEADD(MONTH, -1, GETDATE()));
  insert into Sales values (0, 4, 19, 7210, 675, DATEADD(MONTH, -3, GETDATE()), DATEADD(MONTH, -2, GETDATE()));

  DECLARE @Expected AS decimal(34, 0) = 150;
  DECLARE @Actual AS decimal(34, 0);

  DECLARE @Month AS datetime2;

  SET @Month = DATEADD(MONTH, -1, GETDATE());

  SELECT @Actual = MonthToDateSales(@Month);

  EXEC tSQLt.AssertEquals @Expected,@Actual;

END;
GO

CREATE PROCEDURE TotalTest.[test YearToDateSales should return 150 if the chosen year is last year and there is two sales beween last year and today]
AS
BEGIN
--Assemble: Fake the Particle table to make sure 
  --          it is empty and has no constraints
  EXEC tSQLt.FakeTable 'Sales';
  INSERT INTO Sales VALUES(0, 4, 19, 50, 50, DATEADD(DAY, -1, GETDATE()), GETDATE());
  INSERT INTO Sales VALUES(0, 3, 13, 100, 100, DATEADD(YEAR, -2, GETDATE()), DATEADD(YEAR, -1, GETDATE()));
  insert into Sales values (0, 4, 19, 7210, 675, DATEADD(YEAR, -3, GETDATE()), DATEADD(YEAR, -2, GETDATE()));

  DECLARE @Expected AS decimal(34, 0) = 150;
  DECLARE @Actual AS decimal(34, 0);

  DECLARE @Year AS datetime2;

  SET @Year = DATEADD(YEAR, -1, GETDATE());

  SELECT @Actual = YearToDateSales(@Year);

  EXEC tSQLt.AssertEquals @Expected,@Actual;

END;
GO

EXEC tSQLt.Run 'TotalTest';