USE [JobeetCSharp]
GO
/****** Object:  ForeignKey [FK_CategoryAffiliate_Affiliate]    Script Date: 03/22/2010 15:49:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryAffiliate_Affiliate]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]'))
ALTER TABLE [dbo].[CategoryAffiliate] DROP CONSTRAINT [FK_CategoryAffiliate_Affiliate]
GO
/****** Object:  ForeignKey [FK_CategoryAffiliate_Category]    Script Date: 03/22/2010 15:49:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryAffiliate_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]'))
ALTER TABLE [dbo].[CategoryAffiliate] DROP CONSTRAINT [FK_CategoryAffiliate_Category]
GO
/****** Object:  ForeignKey [FK_Job_Category]    Script Date: 03/22/2010 15:49:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Job_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Job]'))
ALTER TABLE [dbo].[Job] DROP CONSTRAINT [FK_Job_Category]
GO
/****** Object:  StoredProcedure [dbo].[ResetDefaultCategories]    Script Date: 03/22/2010 15:49:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResetDefaultCategories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ResetDefaultCategories]
GO
/****** Object:  Table [dbo].[CategoryAffiliate]    Script Date: 03/22/2010 15:49:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryAffiliate_Affiliate]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]'))
ALTER TABLE [dbo].[CategoryAffiliate] DROP CONSTRAINT [FK_CategoryAffiliate_Affiliate]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryAffiliate_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]'))
ALTER TABLE [dbo].[CategoryAffiliate] DROP CONSTRAINT [FK_CategoryAffiliate_Category]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]') AND type in (N'U'))
DROP TABLE [dbo].[CategoryAffiliate]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 03/22/2010 15:49:30 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Job_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Job]'))
ALTER TABLE [dbo].[Job] DROP CONSTRAINT [FK_Job_Category]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_IsPublic]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Job] DROP CONSTRAINT [DF_Job_IsPublic]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_IsActivated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Job] DROP CONSTRAINT [DF_Job_IsActivated]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_ExpiresAt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Job] DROP CONSTRAINT [DF_Job_ExpiresAt]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_CreateAt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Job] DROP CONSTRAINT [DF_Job_CreateAt]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_UpdateAt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Job] DROP CONSTRAINT [DF_Job_UpdateAt]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Job]') AND type in (N'U'))
DROP TABLE [dbo].[Job]
GO
/****** Object:  Table [dbo].[Affiliate]    Script Date: 03/22/2010 15:49:29 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Affiliate_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Affiliate] DROP CONSTRAINT [DF_Affiliate_IsActive]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Affiliate]') AND type in (N'U'))
DROP TABLE [dbo].[Affiliate]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/22/2010 15:49:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/22/2010 15:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Slug] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND name = N'UIX_Categorie_Name')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Categorie_Name] ON [dbo].[Category] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND name = N'UIX_Category_Slug')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Category_Slug] ON [dbo].[Category] 
(
	[Slug] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Affiliate]    Script Date: 03/22/2010 15:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Affiliate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Affiliate](
	[AffiliateId] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Token] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Affiliate_IsActive]  DEFAULT ((0)),
 CONSTRAINT [PK_Affiliate] PRIMARY KEY CLUSTERED 
(
	[AffiliateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Affiliate]') AND name = N'UIX_Affiliate_Email')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Affiliate_Email] ON [dbo].[Affiliate] 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 03/22/2010 15:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Job]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Job](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[CateroryId] [int] NOT NULL,
	[Type] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NOT NULL,
	[Logo] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[Position] [nvarchar](255) NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
	[HowToApply] [ntext] NOT NULL,
	[Token] [nvarchar](255) NOT NULL,
	[IsPublic] [bit] NOT NULL CONSTRAINT [DF_Job_IsPublic]  DEFAULT ((1)),
	[IsActivated] [bit] NOT NULL CONSTRAINT [DF_Job_IsActivated]  DEFAULT ((0)),
	[Email] [nvarchar](255) NOT NULL,
	[ExpiresAt] [date] NOT NULL CONSTRAINT [DF_Job_ExpiresAt]  DEFAULT (getdate()),
	[CreateAt] [date] NOT NULL CONSTRAINT [DF_Job_CreateAt]  DEFAULT (getdate()),
	[UpdateAt] [date] NOT NULL CONSTRAINT [DF_Job_UpdateAt]  DEFAULT (getdate()),
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Job]') AND name = N'IX_Job_FK_Category')
CREATE NONCLUSTERED INDEX [IX_Job_FK_Category] ON [dbo].[Job] 
(
	[CateroryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Job]') AND name = N'UIX_Job_Token')
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Job_Token] ON [dbo].[Job] 
(
	[Token] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryAffiliate]    Script Date: 03/22/2010 15:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategoryAffiliate](
	[CategoryId] [int] NOT NULL,
	[AffiliateId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryAffiliate] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[AffiliateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]') AND name = N'IX_CategoryAffiliate_FK_Affiliate')
CREATE NONCLUSTERED INDEX [IX_CategoryAffiliate_FK_Affiliate] ON [dbo].[CategoryAffiliate] 
(
	[AffiliateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]') AND name = N'IX_CategoryAffiliate_FK_Category')
CREATE NONCLUSTERED INDEX [IX_CategoryAffiliate_FK_Category] ON [dbo].[CategoryAffiliate] 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ResetDefaultCategories]    Script Date: 03/22/2010 15:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResetDefaultCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Nicolas BAUHAIN
-- Create date: 09/03/2010
-- Description:	Créer les catagories par défaut
--              et efface toutes les données de la base.
-- =============================================
CREATE PROCEDURE [dbo].[ResetDefaultCategories] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM CategoryAffiliate;
	DELETE FROM Affiliate;
	DELETE FROM Job;
	DELETE FROM Category;
	
	-- Insertion des categories par defaut
INSERT INTO Category (Name, Slug) VALUES(''Design'',''design'');
INSERT INTO Category (Name, Slug) VALUES(''Programming'',''programming'');
INSERT INTO Category (Name, Slug) VALUES(''Manager'',''Manager'');
INSERT INTO Category (Name, Slug) VALUES(''Administrator'',''administrator'');
	
END
' 
END
GO
/****** Object:  ForeignKey [FK_CategoryAffiliate_Affiliate]    Script Date: 03/22/2010 15:49:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryAffiliate_Affiliate]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]'))
ALTER TABLE [dbo].[CategoryAffiliate]  WITH CHECK ADD  CONSTRAINT [FK_CategoryAffiliate_Affiliate] FOREIGN KEY([AffiliateId])
REFERENCES [dbo].[Affiliate] ([AffiliateId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryAffiliate_Affiliate]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]'))
ALTER TABLE [dbo].[CategoryAffiliate] CHECK CONSTRAINT [FK_CategoryAffiliate_Affiliate]
GO
/****** Object:  ForeignKey [FK_CategoryAffiliate_Category]    Script Date: 03/22/2010 15:49:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryAffiliate_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]'))
ALTER TABLE [dbo].[CategoryAffiliate]  WITH CHECK ADD  CONSTRAINT [FK_CategoryAffiliate_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CategoryAffiliate_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryAffiliate]'))
ALTER TABLE [dbo].[CategoryAffiliate] CHECK CONSTRAINT [FK_CategoryAffiliate_Category]
GO
/****** Object:  ForeignKey [FK_Job_Category]    Script Date: 03/22/2010 15:49:30 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Job_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Job]'))
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Category] FOREIGN KEY([CateroryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Job_Category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Job]'))
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_Category]
GO
