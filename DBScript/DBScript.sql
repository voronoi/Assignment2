CREATE DATABASE TestDB
GO

USE TestDB
GO

/****** Object:  Table [dbo].[SaionTest]    Script Date: 03/01/2016 16:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaionTest](
	[SaionTestID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_SaionTest] PRIMARY KEY CLUSTERED 
(
	[SaionTestID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[pr_UpdateSaionTest]    Script Date: 03/01/2016 16:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_UpdateSaionTest]
	@SaionTestID int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Email nvarchar(50),
	@Phone nvarchar(50)
AS
BEGIN
	UPDATE [dbo].[SaionTest]
	SET 
		[FirstName] = @FirstName,
		[LastName] = @LastName,
		[Email] = @Email,
		[Phone] = @Phone
	 WHERE SaionTestID = @SaionTestID
END
GO
/****** Object:  StoredProcedure [dbo].[pr_LoadData]    Script Date: 03/01/2016 16:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_LoadData]
AS
BEGIN
	SELECT [SaionTestID]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Phone]
  FROM [dbo].[SaionTest]
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Load]    Script Date: 03/01/2016 16:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Load]
	@SaionTestID int
AS
BEGIN
	SELECT [SaionTestID]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Phone]
  FROM [dbo].[SaionTest]
  WHERE [SaionTestID] = @SaionTestID
END
GO
/****** Object:  StoredProcedure [dbo].[pr_InsertSaionTest]    Script Date: 03/01/2016 16:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_InsertSaionTest]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Email nvarchar(50),
	@Phone nvarchar(50)
AS
BEGIN
	INSERT INTO [dbo].[SaionTest]
	(
		[FirstName],
		[LastName],
		[Email],
		[Phone]
	)
	VALUES
	(
		@FirstName,
		@LastName,
		@Email,
		@Phone
	)
END
GO
/****** Object:  StoredProcedure [dbo].[pr_DeleteSaionTest]    Script Date: 03/01/2016 16:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_DeleteSaionTest]
	@SaionTestID int	
AS
BEGIN
	DELETE FROM [dbo].[SaionTest]
	WHERE SaionTestID = @SaionTestID
END
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 03/01/2016 16:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUser]
      @PageIndex INT = 1
      ,@PageSize INT = 10
      ,@RecordCount INT OUTPUT
AS
BEGIN
      SET NOCOUNT ON;
      SELECT ROW_NUMBER() OVER
      (
            ORDER BY SaionTestID ASC
      )AS RowNumber
      ,SaionTestID
      ,FirstName
      ,Email
      ,Phone
      INTO #Results
      FROM SaionTest
     
      SELECT @RecordCount = COUNT(*)
      FROM #Results
           
      SELECT * FROM #Results
      WHERE RowNumber BETWEEN(@PageIndex -1) * @PageSize + 1 AND(((@PageIndex -1) * @PageSize + 1) + @PageSize) - 1
     
      DROP TABLE #Results
END
GO
