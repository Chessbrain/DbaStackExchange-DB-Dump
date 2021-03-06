USE [master]
GO
/****** Object:  Database [dbaStackExchangeXML]    Script Date: 1/9/2019 9:14:20 PM ******/
CREATE DATABASE [dbaStackExchangeXML]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbaStackExchangeXML', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbaStackExchangeXML.mdf' , SIZE = 2105344KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbaStackExchangeXML_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbaStackExchangeXML_log.ldf' , SIZE = 22621184KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbaStackExchangeXML] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbaStackExchangeXML].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbaStackExchangeXML] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbaStackExchangeXML] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbaStackExchangeXML] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbaStackExchangeXML] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbaStackExchangeXML] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET RECOVERY FULL 
GO
ALTER DATABASE [dbaStackExchangeXML] SET  MULTI_USER 
GO
ALTER DATABASE [dbaStackExchangeXML] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbaStackExchangeXML] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbaStackExchangeXML] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbaStackExchangeXML] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbaStackExchangeXML] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbaStackExchangeXML', N'ON'
GO
ALTER DATABASE [dbaStackExchangeXML] SET QUERY_STORE = OFF
GO
USE [dbaStackExchangeXML]
GO
/****** Object:  Table [dbo].[Badges]    Script Date: 1/9/2019 9:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Badges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 1/9/2019 9:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostHistory]    Script Date: 1/9/2019 9:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostHistory](
	[Id] [int] NOT NULL,
	[PostHistoryTypeId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[RevisionGUID] [nvarchar](36) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[UserId] [int] NULL,
	[Text] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostLinks]    Script Date: 1/9/2019 9:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostLinks](
	[Id] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[PostId] [int] NOT NULL,
	[RelatedPostId] [int] NOT NULL,
	[LinkTypeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 1/9/2019 9:14:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Score] [int] NULL,
	[ViewCount] [int] NULL,
	[Body] [nvarchar](max) NOT NULL,
	[OwnerUserId] [int] NULL,
	[LastActivityDate] [datetime] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[AnswerCount] [int] NULL,
	[CommentCount] [int] NULL,
	[FavoriteCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 1/9/2019 9:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[PostId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_Tags_Posts_Id] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 1/9/2019 9:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](10) NOT NULL,
	[Count] [int] NOT NULL,
	[ExcerptPostId] [int] NULL,
	[WikiPostId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBadges]    Script Date: 1/9/2019 9:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBadges](
	[Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[BadgesId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Class] [int] NOT NULL,
	[TagBased] [nvarchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/9/2019 9:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[Reputation] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[LastAccessDate] [datetime] NOT NULL,
	[WebsiteUrl] [nvarchar](max) NULL,
	[Location] [nvarchar](50) NULL,
	[AboutMe] [nvarchar](max) NULL,
	[Views] [int] NOT NULL,
	[Upvotes] [int] NOT NULL,
	[DownVotes] [int] NOT NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 1/9/2019 9:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[Id] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[VoteTypeId] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [dbaStackExchangeXML] SET  READ_WRITE 
GO
