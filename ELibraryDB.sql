USE [master]
GO
/****** Object:  Database [ELibraryDB]    Script Date: 4/4/2023 2:29:58 AM ******/
CREATE DATABASE [ELibraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELibraryDB', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ELibraryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ELibraryDB_log', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ELibraryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ELibraryDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ELibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ELibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ELibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ELibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ELibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ELibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ELibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ELibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ELibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ELibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ELibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ELibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ELibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ELibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ELibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ELibraryDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ELibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ELibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ELibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ELibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ELibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ELibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ELibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ELibraryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ELibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [ELibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ELibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ELibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ELibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ELibraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ELibraryDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ELibraryDB', N'ON'
GO
ALTER DATABASE [ELibraryDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ELibraryDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ELibraryDB]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Publisher] [int] NULL,
	[Publication Date] [date] NULL,
	[ISBN] [varchar](20) NOT NULL,
	[Pages] [int] NULL,
	[Avaliable] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK__Books__3DE0C20734F0D389] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unique_ISBN] UNIQUE NONCLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthors]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthors](
	[BookId] [int] NOT NULL,
	[Authorid] [int] NOT NULL,
 CONSTRAINT [PK_BookAuthors] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[Authorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ContactId] [int] NOT NULL,
	[Bio] [nvarchar](250) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AuthorsView]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AuthorsView] AS
WITH CTE AS (
SELECT AuthorId,COUNT(BookId) ctn FROM BookAuthors GROUP BY AuthorId
)
SELECT FirstName , MiddleName, Lastname , STRING_AGG(Title,',') [Titles Worked On] FROM Authors LEFT JOIN CTE ON Authors.AuthorId = CTE.AuthorId 
LEFT JOIN BookAuthors ON Authors.AuthorId = BookAuthors.AuthorId LEFT JOIN Books ON BookAuthors.BookId = Books.BookId
GROUP BY FirstName,MiddleName,LastName
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](255) NOT NULL,
 CONSTRAINT [PK_BookCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BooksView]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BooksView] AS
WITH CTE AS(
SELECT 
    Books.BookId,
    STRING_AGG(Authors.FirstName + ' ' + Authors.LastName, ', ') AS Authors
FROM 
    Books
    JOIN BookAuthors ON Books.BookId = BookAuthors.BookId
    JOIN Authors ON BookAuthors.AuthorId = Authors.AuthorId
GROUP BY 
    Books.BookId
)
SELECT
Books.BookId [Id],
Title,
Year([Publication Date]) [Year Released],
Publisher,
ISBN,
CONCAT('$',Price) [Price],
CASE
WHEN Price >= 15 THEN 'Expensive'
WHEN Price >= 10 THEN 'Average'
ELSE 'Cheap' END [Price Range],
Pages,
CASE
WHEN Pages >= 450 THEN 'Large'
WHEN Pages >= 10 THEN 'Normal'
ELSE 'Small' END [Size],
CTE.Authors
FROM Books
LEFT JOIN CTE ON Books.BookId = CTE.BookId
LEFT JOIN Categories ON Books.CategoryId = Categories.CategoryId
GO
/****** Object:  Table [dbo].[Borrowings]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowings](
	[BorrowId] [int] IDENTITY(1,1) NOT NULL,
	[Borrow Date] [datetime] NOT NULL,
	[Return Date] [datetime] NULL,
	[Due Date] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[BorrowerId] [int] NOT NULL,
	[BorrowedBookId] [int] NOT NULL,
 CONSTRAINT [PK_Borrowings] PRIMARY KEY CLUSTERED 
(
	[BorrowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrowers]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowers](
	[BorrowerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ContactId] [int] NOT NULL,
 CONSTRAINT [PK_Borrowers] PRIMARY KEY CLUSTERED 
(
	[BorrowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactDetails]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactDetails](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Website] [varchar](50) NULL,
 CONSTRAINT [PK_ContactDetails] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[BorrowerId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](150) NULL,
	[ReviewDate] [datetime] NOT NULL,
	[BookId] [int] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BorrowersView]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BorrowersView] AS
WITH CTE1 AS(
SELECT BorrowerId , COUNT(ReviewId) c_reviews FROM Reviews GROUP BY BorrowerId
),
CTE2 AS (
SELECT BorrowerId, COUNT(BorrowId) c_borrows  FROM Borrowings GROUP BY BorrowerId
)
SELECT DISTINCT Borrowers.BorrowerId,Firstname , MiddleName , LastName , 
ISNULL(CTE1.c_reviews,0) [Number of Reviews], ISNULL(CTE2.c_borrows,0) [Number of Borrows],
Email , Website , PhoneNumber
FROM Borrowers LEFT JOIN Reviews ON Borrowers.BorrowerId = Reviews.BorrowerId
LEFT JOIN ContactDetails ON Borrowers.ContactId = ContactDetails.ContactId
LEFT JOIN Borrowings ON Borrowings.BorrowerId = Borrowers.BorrowerId
LEFT JOIN CTE1 ON Borrowers.BorrowerId = CTE1.BorrowerId 
LEFT JOIN CTE2 ON Borrowers.BorrowerId = CTE2.BorrowerId
GO
/****** Object:  View [dbo].[ActiveBorrowings]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ActiveBorrowings] AS
WITH CTE AS (
SELECT Firstname, BorrowerId FROM Borrowers
),
CTE2 AS (
SELECT Title, BookId FROM Books
)
SELECT 
CONCAT(Borrowers.FirstName,' ',LastName) [Fullname],
BorrowId,
CONVERT(Date,[Borrow Date]) [Borrow Date],
IIF([Return Date] IS NULL,'Not Returned',CAST(CONVERT(Date,[Return Date]) AS NVARCHAR(50))) [Return Date] ,
CONVERT(Date,[Due Date]) [Due Date],
CASE WHEN [Status] = 1 THEN 'Returned' ELSE 'Borrowed' END [Status],
Borrowers.BorrowerId,
Email,
PhoneNumber,
CTE2.Title
FROM Borrowings JOIN Borrowers ON Borrowers.BorrowerId = Borrowings.BorrowerId
JOIN CTE ON Borrowings.BorrowerId = CTE.BorrowerId
JOIN CTE2 ON Borrowings.BorrowedBookId = CTE2.BookId
JOIN ContactDetails ON Borrowers.BorrowerId = ContactDetails.ContactId
WHERE [Status] = 0
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherId] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](250) NOT NULL,
	[ContactId] [int] NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [DF_Avaliable_books]  DEFAULT ((0)) FOR [Avaliable]
GO
ALTER TABLE [dbo].[Authors]  WITH CHECK ADD  CONSTRAINT [FK_Authors_ContactDetails] FOREIGN KEY([ContactId])
REFERENCES [dbo].[ContactDetails] ([ContactId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authors] CHECK CONSTRAINT [FK_Authors_ContactDetails]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Authors] FOREIGN KEY([Authorid])
REFERENCES [dbo].[Authors] ([AuthorId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Authors]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_BookCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_BookCategory]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Publisher_FK] FOREIGN KEY([Publisher])
REFERENCES [dbo].[Publishers] ([PublisherId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Publisher_FK]
GO
ALTER TABLE [dbo].[Borrowers]  WITH CHECK ADD  CONSTRAINT [FK_Borrowers_ContactDetails] FOREIGN KEY([ContactId])
REFERENCES [dbo].[ContactDetails] ([ContactId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Borrowers] CHECK CONSTRAINT [FK_Borrowers_ContactDetails]
GO
ALTER TABLE [dbo].[Borrowings]  WITH CHECK ADD  CONSTRAINT [FK_Borrowings_Borrowers] FOREIGN KEY([BorrowerId])
REFERENCES [dbo].[Borrowers] ([BorrowerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Borrowings] CHECK CONSTRAINT [FK_Borrowings_Borrowers]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Books]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Borrowers] FOREIGN KEY([BorrowerId])
REFERENCES [dbo].[Borrowers] ([BorrowerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Borrowers]
GO
ALTER TABLE [dbo].[Authors]  WITH CHECK ADD  CONSTRAINT [names are valid] CHECK  ((case when [MiddleName] IS NULL then (3) else len([MiddleName]) end>=(3) AND (len([FirstName])>=(3) AND len([LastName])>=(3))))
GO
ALTER TABLE [dbo].[Authors] CHECK CONSTRAINT [names are valid]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK_Books] CHECK  ((len([ISBN])>=(7)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Pages have a number] CHECK  ((case when [Pages] IS NULL then (1) else [Pages] end>(0)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Pages have a number]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [Title is valid] CHECK  ((len([Title])>=(4)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [Title is valid]
GO
ALTER TABLE [dbo].[Borrowers]  WITH CHECK ADD  CONSTRAINT [Valid Names] CHECK  ((case when [MiddleName] IS NULL then (3) else len([MiddleName]) end>=(3) AND (len([FirstName])>=(3) AND len([LastName])>=(3))))
GO
ALTER TABLE [dbo].[Borrowers] CHECK CONSTRAINT [Valid Names]
GO
ALTER TABLE [dbo].[ContactDetails]  WITH CHECK ADD  CONSTRAINT [at least one way to contact] CHECK  (([Website] IS NOT NULL OR [Email] IS NOT NULL OR [Website] IS NOT NULL))
GO
ALTER TABLE [dbo].[ContactDetails] CHECK CONSTRAINT [at least one way to contact]
GO
ALTER TABLE [dbo].[ContactDetails]  WITH CHECK ADD  CONSTRAINT [Email_Is_Valid] CHECK  (([Email] like '%___@___%.%'))
GO
ALTER TABLE [dbo].[ContactDetails] CHECK CONSTRAINT [Email_Is_Valid]
GO
ALTER TABLE [dbo].[ContactDetails]  WITH CHECK ADD  CONSTRAINT [Phone_Is_Valid] CHECK  (([PhoneNumber] like '%[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%'))
GO
ALTER TABLE [dbo].[ContactDetails] CHECK CONSTRAINT [Phone_Is_Valid]
GO
ALTER TABLE [dbo].[ContactDetails]  WITH CHECK ADD  CONSTRAINT [Website URL is valid] CHECK  (([Website] like 'http%//%.%'))
GO
ALTER TABLE [dbo].[ContactDetails] CHECK CONSTRAINT [Website URL is valid]
GO
ALTER TABLE [dbo].[Publishers]  WITH CHECK ADD  CONSTRAINT [CK_Publishers] CHECK  ((len([PublisherName])>=(3)))
GO
ALTER TABLE [dbo].[Publishers] CHECK CONSTRAINT [CK_Publishers]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [Comment Is Valid] CHECK  ((case when [comment] IS NULL then (20) else len([comment]) end>=(20)))
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [Comment Is Valid]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [RatingIsValid] CHECK  (([Rating]>=(0) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [RatingIsValid]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [Review Date Not Impossible] CHECK  (([ReviewDate]<=getdate()))
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [Review Date Not Impossible]
GO
/****** Object:  StoredProcedure [dbo].[Borrow]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Borrow]
@BookId INT,
@BorrowerId INT,
@DueInDays INT = 30
AS
BEGIN
INSERT INTO Borrowings 
([Borrow Date],[Due Date],[Status],BorrowerId,BorrowedBookId)
VALUES
(
GETDATE(),
DATEADD(day,@DueInDays,GETDATE()),
0,
@BorrowerId,
@BookId
)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAuthor]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAuthor]
    @authorid INT
AS
BEGIN
DELETE FROM Authors WHERE AuthorId = @authorid;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBook]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBook]
@BookId int
AS
BEGIN
DELETE FROM Books WHERE BookId = @BookId;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBorrower]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBorrower]
@BorrowerId INT
AS
BEGIN
DELETE FROM Borrowers WHERE BorrowerId = @BorrowerId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetABookISBN]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetABookISBN]
@BookId INT
AS
BEGIN
SELECT ISBN FROM Books WHERE BookId = @BookId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllBooks]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllBooks]
AS
BEGIN
WITH CTE AS(
SELECT 
    Books.BookId,
    STRING_AGG(Authors.FirstName + ' ' + Authors.LastName, ', ') AS Authors
FROM 
    Books
    JOIN BookAuthors ON Books.BookId = BookAuthors.BookId
    JOIN Authors ON BookAuthors.AuthorId = Authors.AuthorId
GROUP BY 
    Books.BookId
)
SELECT
Books.BookId [Id],
Title,
Year([Publication Date]) [Year Released],
ISBN,
CONCAT('$',Price) [Price],
CASE
WHEN Price >= 15 THEN 'Expensive'
WHEN Price >= 10 THEN 'Average'
ELSE 'Cheap' END [Price Range],
Pages,
CASE
WHEN Pages >= 450 THEN 'Large'
WHEN Pages >= 10 THEN 'Normal'
ELSE 'Small' END [Size],
CTE.Authors
FROM Books
LEFT JOIN CTE ON Books.BookId = CTE.BookId
LEFT JOIN Categories ON Books.CategoryId = Categories.CategoryId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorContact]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAuthorContact]
@id INT
AS
BEGIN
SELECT
AuthorId,
Email,
PhoneNumber,
Website,
Bio
FROM Authors JOIN ContactDetails 
ON Authors.ContactId = ContactDetails.ContactId
WHERE AuthorId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAuthors]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAuthors]
AS
BEGIN
WITH CTE AS(
SELECT AuthorId , COUNT(BookId) ctn FROM BookAuthors GROUP BY Authorid)
SELECT 
Authors.AuthorId,
FirstName,
MiddleName,
LastName,
Email,
PhoneNumber,
CTE.ctn [Number of Books],
Website,
Bio
FROM Authors 
JOIN ContactDetails 
ON Authors.ContactId = ContactDetails.ContactId 
JOIN CTE ON Authors.AuthorId = CTE.Authorid
END
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorsWithBooks]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAuthorsWithBooks]
AS
BEGIN
SELECT
Authors.AuthorId,
FirstName,
MiddleName,
LastName,
COUNT(BookId) [Number Of Books]
FROM Authors JOIN BookAuthors
ON Authors.AuthorId = BookAuthors.Authorid
GROUP BY Authors.AuthorId,FirstName,MiddleName,LastName
ORDER BY [Number Of Books] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAvaliableBooks]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAvaliableBooks]
AS
BEGIN
SELECT Title , Price, Pages , IIF(Avaliable > 0 , 'Avaliable','Not Avaliable') [Avaliablility] FROM Books
ORDER BY Pages DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetBooksByCategory]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBooksByCategory]
AS
BEGIN
SELECT Title , Price, Category FROM Books JOIN Categories 
ON Books.CategoryId = Categories.CategoryId
ORDER BY Categories.CategoryId DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetBooksByPages]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBooksByPages]
AS
BEGIN
SELECT Title , Price, Pages , 
CASE 
WHEN Pages >= 400 THEN 'Large'
WHEN Pages >= 300 THEN 'Medium'
ELSE 'Small'
END [Book Size]
, DENSE_RANK() OVER (ORDER BY Pages DESC) [Pages Rank]  FROM Books
ORDER BY Pages DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetBooksByPrice]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBooksByPrice]
AS
BEGIN
SELECT Title , Price, Category, DENSE_RANK() OVER (PARTITION BY Books.CateGoryId Order By Price DESC) [Book Price Rank Within Category] FROM Books JOIN Categories 
ON Books.CategoryId = Categories.CategoryId
ORDER BY Categories.CategoryId DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetBooksByReviews]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBooksByReviews]
AS
BEGIN
WITH CTE AS(
SELECT Books.BookId,AVG(Rating) [Average Rating]
FROM Books JOIN Reviews
ON Books.BookId = Reviews.BookId
GROUP BY Books.BookId
)
SELECT Books.BookId, Title , Price , Pages  , CONCAT(CTE.[Average Rating],'/','5') [Rating] FROM CTE JOIN
Books ON Books.BookId = CTE.BookId
ORDER BY [Average Rating] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetBooksInACategory]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBooksInACategory]
@Category NVARCHAR(50)
AS
BEGIN
SELECT Title , Price , Category FROM Categories
JOIN Books ON Categories.CategoryId = Books.CategoryId
WHERE Category = @Category
END
GO
/****** Object:  StoredProcedure [dbo].[GetBooksInAYear]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBooksInAYear]
@Year INT
AS
BEGIN
SELECT Title , Price, Pages , YEAR([Publication Date]) [Year] ,  IIF(Avaliable > 0 , 'Avaliable','Not Avaliable') [Avaliablility] FROM Books
Where Year([Publication Date]) = @Year
ORDER BY Avaliable DESC , Price ASC
END
GO
/****** Object:  StoredProcedure [dbo].[GetBooksWithinAPriceRange]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBooksWithinAPriceRange]
@low MONEY,
@high MONEY
AS
BEGIN
SELECT Title , Price, Pages , IIF(Avaliable > 0 , 'Avaliable','Not Avaliable') [Avaliablility] FROM Books
Where Price BETWEEN @low AND @high
ORDER BY Avaliable DESC , Price ASC
END
GO
/****** Object:  StoredProcedure [dbo].[GetBorrowers]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBorrowers]
AS
BEGIN
WITH CTE1 AS(
SELECT BorrowerId , COUNT(ReviewId) c_reviews FROM Reviews GROUP BY BorrowerId
),
CTE2 AS (
SELECT BorrowerId, COUNT(BorrowId) c_borrows  FROM Borrowings GROUP BY BorrowerId
)
SELECT DISTINCT Borrowers.BorrowerId,Firstname , MiddleName , LastName , 
ISNULL(CTE1.c_reviews,0) [Number of Reviews], ISNULL(CTE2.c_borrows,0) [Number of Borrows],
Email , Website , PhoneNumber
FROM Borrowers LEFT JOIN Reviews ON Borrowers.BorrowerId = Reviews.BorrowerId
LEFT JOIN ContactDetails ON Borrowers.ContactId = ContactDetails.ContactId
LEFT JOIN Borrowings ON Borrowings.BorrowerId = Borrowers.BorrowerId
LEFT JOIN CTE1 ON Borrowers.BorrowerId = CTE1.BorrowerId 
LEFT JOIN CTE2 ON Borrowers.BorrowerId = CTE2.BorrowerId
END
GO
/****** Object:  StoredProcedure [dbo].[GetBorrowings]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBorrowings]
AS
BEGIN
WITH CTE AS (
SELECT Firstname, BorrowerId FROM Borrowers
),
CTE2 AS (
SELECT Title, BookId FROM Books
)
SELECT 
BorrowId,
CONVERT(Date,[Borrow Date]) [Borrow Date],
IIF([Return Date] IS NULL,'Not Returned',CAST(CONVERT(Date,[Return Date]) AS NVARCHAR(50))) [Return Date] ,
CONVERT(Date,[Due Date]) [Due Date],
CASE WHEN [Status] = 1 THEN 'Returned' ELSE 'Borrowed' END [Status],
Borrowers.BorrowerId,
CTE.FirstName,
CTE2.BookId,
CTE2.Title
FROM Borrowings JOIN Borrowers ON Borrowers.BorrowerId = Borrowings.BorrowerId
JOIN CTE ON Borrowings.BorrowerId = CTE.BorrowerId
JOIN CTE2 ON Borrowings.BorrowedBookId = CTE2.BookId
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategories]
AS
BEGIN
SELECT DISTINCT Category , COUNT(BookId) [Num of Books] FROM Categories
JOIN Books ON Categories.CategoryId = Books.CategoryId
GROUP BY Category
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAuthor]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAuthor]
    @firstname AS NVARCHAR(50),
    @middlename NVARCHAR(50) = NULL,
    @lastname NVARCHAR(50),
    @contactid INT,
    @bio NVARCHAR(250) = NULL
AS
BEGIN
    INSERT INTO Authors (FirstName, MiddleName, LastName, ContactId, Bio)
    VALUES (@firstname, @middlename, @lastname, @contactid, @bio)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBook]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBook]
@Title NVARCHAR(250),
@Publisher INT = NULL,
@Date DATE = NULL,
@ISBN VARCHAR(20),
@Pages INT = NULL,
@Avaliable INT,
@Price MONEY,
@CategoryId INT,
@Description NVARCHAR(500) = null
AS
BEGIN
INSERT INTO Books (
Title,Publisher,[Publication Date],ISBN,Pages,Avaliable,Price,CategoryId,[Description])
VALUES
(@Title,@Publisher,@Date,@ISBN,@Pages,@Avaliable,@Price,@CategoryId,@Description);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBorrower]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBorrower]
@Firstname nvarchar(50),
@MiddleName nvarchar(50) = NULL,
@LastName nvarchar(50),
@ContactId INT
AS
BEGIN
INSERT INTO Borrowers 
(FirstName,MiddleName,LastName,ContactId)
VALUES
(@Firstname,@MiddleName,@LastName,@ContactId)
END
GO
/****** Object:  StoredProcedure [dbo].[ReturnBook]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReturnBook]
@BookId INT,
@BorrowerId INT
AS
BEGIN
UPDATE Borrowings SET [Return Date] = GETDATE() , [Status] = 1 WHERE BorrowedBookId = @BookId AND BorrowerId = @BorrowerId;
END
GO
/****** Object:  StoredProcedure [dbo].[SearchBook]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchBook]
    @SearchInput NVARCHAR(300) = NULL,
    @Author NVARCHAR(90) = NULL,
    @Title NVARCHAR(250) = NULL,
    @ISBN NVARCHAR(20) = NULL,
    @Publisher NVARCHAR(60) = NULL
AS
BEGIN
WITH CTE AS(
SELECT 
    Books.BookId,
    STRING_AGG(Authors.FirstName + ' ' + Authors.LastName, ', ') AS Authors
FROM 
    Books
    JOIN BookAuthors ON Books.BookId = BookAuthors.BookId
    JOIN Authors ON Authors.AuthorId = BookAuthors.AuthorId
GROUP BY 
    Books.BookId
)
    SELECT DISTINCT
        Books.*, 
        CTE.Authors,
        Categories.Category,
        Publishers.PublisherName
    FROM Books 
	LEFT JOIN CTE ON CTE.BookId = Books.BookId
	JOIN BookAuthors ON BookAuthors.BookId = Books.BookId
    JOIN Authors ON BookAuthors.AuthorId = Authors.AuthorId 
    JOIN Categories ON Books.CategoryId = Categories.CategoryId
    LEFT JOIN Publishers ON Books.Publisher = Publishers.PublisherId
    WHERE 
        (@SearchInput IS NOT NULL AND (
            Books.Title LIKE '%' + @searchInput + '%' 
            OR Authors.FirstName LIKE '%' + @searchInput + '%' 
            OR Authors.MiddleName LIKE '%' + @searchInput + '%' 
            OR Authors.LastName LIKE '%' + @searchInput + '%' 
            OR CONCAT(Authors.FirstName, ' ', ISNULL(Authors.MiddleName + ' ', ''), Authors.LastName) LIKE '%' + @searchInput + '%'
            OR CAST(Books.[Publication Date] AS NVARCHAR(20)) LIKE '%' + @searchInput + '%' 
            OR Books.ISBN LIKE '%' + @searchInput + '%' 
            OR Categories.Category LIKE '%' + @searchInput + '%'
            OR Publishers.PublisherName LIKE '%' + @searchInput + '%'
        ))
        OR (@Author IS NOT NULL AND (
            Authors.FirstName LIKE '%' + @Author + '%' 
            OR Authors.MiddleName LIKE '%' + @Author + '%' 
            OR Authors.LastName LIKE '%' + @Author + '%' 
            OR CONCAT(Authors.FirstName, ' ', ISNULL(Authors.MiddleName + ' ', ''), Authors.LastName) LIKE '%' + @Author + '%'
        ))
        OR (@Title IS NOT NULL AND Books.Title LIKE '%' + @Title + '%')
        OR (@ISBN IS NOT NULL AND Books.ISBN LIKE '%' + @ISBN + '%')
        OR (@Publisher IS NOT NULL AND Publishers.PublisherName LIKE '%' + @Publisher + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAuthor]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAuthor]
@Field NVARCHAR(50),
@Value NVARCHAR(250),
@AuthorId int
AS
BEGIN
DECLARE @Sql NVARCHAR(MAX);
 SET @sql = 'UPDATE Authors SET [' + REPLACE(@Field, ']', ']]') + '] = ''' + REPLACE(@value, '''', '''''') + ''' WHERE AuthorId = ' + CAST(@AuthorId AS NVARCHAR);
EXEC(@Sql)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBook]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBook]
@Field NVARCHAR(50),
@Value NVARCHAR(250),
@bookId int
AS
BEGIN
DECLARE @Sql NVARCHAR(MAX);
 SET @sql = 'UPDATE Books SET [' + REPLACE(@Field, ']', ']]') + '] = ''' + REPLACE(@value, '''', '''''') + ''' WHERE BookId = ' + CAST(@bookId AS NVARCHAR);
EXEC(@Sql)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBorrower]    Script Date: 4/4/2023 2:29:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBorrower]
@Field NVARCHAR(50),
@Value NVARCHAR(50),
@BorrowerId INT
AS
BEGIN
DECLARE @sql NVARCHAR(MAX);
SET @sql = 'UPDATE Borrowers SET [' + REPLACE(@field, ']', ']]') + '] = ''' + REPLACE(@value, '''', '''''') + ''' WHERE BorrowerId = ' + CAST(@BorrowerId AS NVARCHAR);
EXEC(@sql)
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contact details for the authors' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Authors', @level2type=N'CONSTRAINT',@level2name=N'FK_Authors_ContactDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'makes sure that if a page number is entered it is above zero' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Books', @level2type=N'CONSTRAINT',@level2name=N'Pages have a number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contact details for borrower' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Borrowers', @level2type=N'CONSTRAINT',@level2name=N'FK_Borrowers_ContactDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'firstname and lastname are above 3 chars' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Borrowers', @level2type=N'CONSTRAINT',@level2name=N'Valid Names'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'makes sure there''s a way to contact a person' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContactDetails', @level2type=N'CONSTRAINT',@level2name=N'at least one way to contact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'makes sure the email has a @ and at least 3 characters before and after it' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContactDetails', @level2type=N'CONSTRAINT',@level2name=N'Email_Is_Valid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'make sure phonenumber is atleast 10 digits' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContactDetails', @level2type=N'CONSTRAINT',@level2name=N'Phone_Is_Valid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'website url contains http or https' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContactDetails', @level2type=N'CONSTRAINT',@level2name=N'Website URL is valid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'comment is at least 20 chars if exists' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reviews', @level2type=N'CONSTRAINT',@level2name=N'Comment Is Valid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rating is between 0 and 5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reviews', @level2type=N'CONSTRAINT',@level2name=N'RatingIsValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'review date isn''t in the future' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reviews', @level2type=N'CONSTRAINT',@level2name=N'Review Date Not Impossible'
GO
USE [master]
GO
ALTER DATABASE [ELibraryDB] SET  READ_WRITE 
GO
