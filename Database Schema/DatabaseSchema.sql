USE [dbaStackExchangeXML]
GO
/****** Object:  Table [dbo].[Badges]    Script Date: 1/9/2019 8:47:06 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 1/9/2019 8:47:07 PM ******/
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
/****** Object:  Table [dbo].[PostHistory]    Script Date: 1/9/2019 8:47:07 PM ******/
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
/****** Object:  Table [dbo].[PostLinks]    Script Date: 1/9/2019 8:47:07 PM ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 1/9/2019 8:47:07 PM ******/
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
/****** Object:  Table [dbo].[PostTags]    Script Date: 1/9/2019 8:47:07 PM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 1/9/2019 8:47:07 PM ******/
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
/****** Object:  Table [dbo].[UserBadges]    Script Date: 1/9/2019 8:47:07 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 1/9/2019 8:47:07 PM ******/
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
/****** Object:  Table [dbo].[Votes]    Script Date: 1/9/2019 8:47:07 PM ******/
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
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Comments] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Posts_Comments]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Users_Comments] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Users_Comments]
GO
ALTER TABLE [dbo].[PostHistory]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostHistory] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostHistory] CHECK CONSTRAINT [FK_Posts_PostHistory]
GO
ALTER TABLE [dbo].[PostHistory]  WITH CHECK ADD  CONSTRAINT [FK_Users_PostHistory] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[PostHistory] CHECK CONSTRAINT [FK_Users_PostHistory]
GO
ALTER TABLE [dbo].[PostLinks]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostLinks] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostLinks] CHECK CONSTRAINT [FK_Posts_PostLinks]
GO
ALTER TABLE [dbo].[PostLinks]  WITH CHECK ADD  CONSTRAINT [FK_RelatedPosts_PostLinks] FOREIGN KEY([RelatedPostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostLinks] CHECK CONSTRAINT [FK_RelatedPosts_PostLinks]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostTags] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_Posts_PostTags]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_PostTags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_Tags_PostTags]
GO
ALTER TABLE [dbo].[UserBadges]  WITH CHECK ADD  CONSTRAINT [FK_UserBadges_Badges] FOREIGN KEY([BadgesId])
REFERENCES [dbo].[Badges] ([Id])
GO
ALTER TABLE [dbo].[UserBadges] CHECK CONSTRAINT [FK_UserBadges_Badges]
GO
ALTER TABLE [dbo].[UserBadges]  WITH CHECK ADD  CONSTRAINT [FK_UserBadges_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserBadges] CHECK CONSTRAINT [FK_UserBadges_Users]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Votes] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Posts_Votes]
GO
