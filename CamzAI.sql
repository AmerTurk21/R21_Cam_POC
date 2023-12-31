USE [master]
GO
/****** Object:  Database [CamsAI]    Script Date: 11/20/2022 10:36:24 PM ******/
CREATE DATABASE [CamsAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CamsAI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CamsAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CamsAI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CamsAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CamsAI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CamsAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CamsAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CamsAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CamsAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CamsAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CamsAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [CamsAI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CamsAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CamsAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CamsAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CamsAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CamsAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CamsAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CamsAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CamsAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CamsAI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CamsAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CamsAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CamsAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CamsAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CamsAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CamsAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CamsAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CamsAI] SET RECOVERY FULL 
GO
ALTER DATABASE [CamsAI] SET  MULTI_USER 
GO
ALTER DATABASE [CamsAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CamsAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CamsAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CamsAI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CamsAI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CamsAI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CamsAI', N'ON'
GO
ALTER DATABASE [CamsAI] SET QUERY_STORE = OFF
GO
USE [CamsAI]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 11/20/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserID] [nvarchar](100) NOT NULL,
	[FTP_Path] [nvarchar](max) NULL,
	[Date_Of_Subscription] [date] NOT NULL,
	[User_Notification_ID] [nvarchar](100) NULL,
	[Server_Number] [nvarchar](100) NULL,
	[Username] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[User_Password] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NOT NULL,
	[Cloud_Storage_Path] [nvarchar](max) NULL,
	[Last_Subscription_Renewal_Date] [date] NOT NULL,
	[First_Name] [nvarchar](100) NULL,
	[Last_Name] [nvarchar](100) NULL,
	[Last_Video_Date] [date] NULL,
	[FTP_Password] [nvarchar](100) NULL,
	[FTP_Username] [nvarchar](100) NULL,
	[Local_Dir] [nvarchar](100) NULL,
	[Conversion_Path] [nvarchar](100) NULL,
	[Big_Merged_Path] [nvarchar](100) NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Email_UNQ] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Mobile_UNQ] UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserVideos]    Script Date: 11/20/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVideos](
	[UserID] [nvarchar](max) NULL,
	[Is_Copied] [bit] NULL,
	[Is_Exist] [bit] NULL,
	[Is_Removed_From_FTP] [bit] NULL,
	[Is_Converted_Or_Generated] [bit] NULL,
	[Is_Uploaded] [bit] NULL,
	[Final_Video_Link] [nvarchar](max) NULL,
	[Is_Notified] [bit] NULL,
	[Video_Date] [datetime] NULL,
	[Number_OF_Transactions] [numeric](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserName_UNQ]    Script Date: 11/20/2022 10:36:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserName_UNQ] ON [dbo].[UserMaster]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 11/20/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewUser] (         
	@UserID	nvarchar(100),
	@FTP_Path	nvarchar(MAX),
	@Date_Of_Subscription	date,
	@User_Notification_ID	nvarchar(100),
	@Server_Number	nvarchar(100),
	@Username	nvarchar(100),
	@Email	nvarchar(100),
	@Password	nvarchar(100),
	@Mobile	nvarchar(100),
	@Cloud_Storage_Path	nvarchar(MAX),
	@Last_Subscription_Renewal_Date	date,
	@First_Name	nvarchar(100),
	@Last_Name	nvarchar(100),
	@FtpPass nvarchar(100),
	@FtpUse  nvarchar(100),
	@LocalDir  nvarchar(100),
	@ConversionPath  nvarchar(100),
	@BigMergedPath nvarchar(100)
	)
     
       AS  BEGIN
            INSERT INTO UserMaster
                        (
						UserID,
						FTP_Path,
						Date_Of_Subscription,
						User_Notification_ID,
						Server_Number,
						Username,
						Email,
						User_Password,
						Mobile,
						Cloud_Storage_Path,
						Last_Subscription_Renewal_Date,
						First_Name,
						Last_Name,
						Last_Video_Date,
						FTP_Password,
						FTP_Username,
						Local_Dir,
						Conversion_Path,
						Big_Merged_Path
						)
            VALUES     ( 
			@UserID,
			@FTP_Path,	
			@Date_Of_Subscription,	
			@User_Notification_ID,
			@Server_Number,
			@Username,	
			@Email,	
			@Password,	
			@Mobile,	
			@Cloud_Storage_Path,	
			@Last_Subscription_Renewal_Date,
			@First_Name	,
			@Last_Name,
			null,
			@FtpPass,
			@FtpUse,
			@LocalDir,
			@ConversionPath,
			@BigMergedPath
			)
      


	  END




	
GO
/****** Object:  StoredProcedure [dbo].[GETAllUsers]    Script Date: 11/20/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETAllUsers]
     
       AS  BEGIN
            Select TOP 100 *
			From 
			UserMaster
			ORDER BY Date_Of_Subscription

	  END
GO
/****** Object:  StoredProcedure [dbo].[GetUserDetails]    Script Date: 11/20/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetUserDetails] (         
	@UserID	nvarchar(100))
	
     
       AS  BEGIN
            Select * from UserMaster where UserID = @UserID
      


	  END


GO
/****** Object:  StoredProcedure [dbo].[MarkVideoAsConverted]    Script Date: 11/20/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MarkVideoAsConverted] (         
	@UserID	nvarchar(100),
	@Number_Of_Videos numeric(18, 0)
	)
     
       AS  BEGIN
            INSERT INTO UserVideos
                        (
						UserID,
						Is_Copied,
						Is_Exist,
						Is_Removed_From_FTP,
						Is_Converted_Or_Generated,
						Is_Uploaded,
						Final_Video_Link,
						Is_Notified,
						Video_Date,
						Number_OF_Transactions

						)
            VALUES     ( 
			@UserID,
			1,	
			1,	
			0,
			1,
			0,	
			null,	
			0,	
			null,	
			@Number_Of_Videos
			)
      


	  END




	
GO
/****** Object:  StoredProcedure [dbo].[MarkVideoAsCopied]    Script Date: 11/20/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MarkVideoAsCopied] (         
	@UserID	nvarchar(100),
	@Number_Of_Videos numeric(18, 0)
	)
     
       AS  BEGIN
            INSERT INTO UserVideos
                        (
						UserID,
						Is_Copied,
						Is_Exist,
						Is_Removed_From_FTP,
						Is_Converted_Or_Generated,
						Is_Uploaded,
						Final_Video_Link,
						Is_Notified,
						Video_Date,
						Number_OF_Transactions

						)
            VALUES     ( 
			@UserID,
			1,	
			1,	
			0,
			0,
			0,	
			null,	
			0,	
			null,	
			@Number_Of_Videos
			)
      


	  END




	
GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 11/20/2022 10:36:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLogin] (        
	@Username	nvarchar(100),
	@Password	nvarchar(100)
	)
     
       AS  BEGIN
            Select UserID
			From 
			UserMaster
			Where
			Username = @Username and User_Password = @Password;
			
             
      


	  END
GO
USE [master]
GO
ALTER DATABASE [CamsAI] SET  READ_WRITE 
GO
