USE [master]
GO
/****** Object:  Database [Nm_Common]    Script Date: 2019/11/24 22:17:39 ******/
CREATE DATABASE [Nm_Common]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_Common', FILENAME = N'D:\Database\SqlServer\Nm_Common.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nm_Common_log', FILENAME = N'D:\Database\SqlServer\Nm_Common_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nm_Common] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_Common].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_Common] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_Common] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_Common] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_Common] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_Common] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_Common] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_Common] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_Common] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_Common] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_Common] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_Common] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_Common] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_Common] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_Common] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_Common] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Nm_Common] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_Common] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_Common] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_Common] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_Common] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_Common] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_Common] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_Common] SET RECOVERY FULL 
GO
ALTER DATABASE [Nm_Common] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_Common] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_Common] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_Common] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_Common] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nm_Common] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_Common', N'ON'
GO
ALTER DATABASE [Nm_Common] SET QUERY_STORE = OFF
GO
USE [Nm_Common]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 2019/11/24 22:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Pinyin] [nvarchar](400) NOT NULL,
	[Jianpin] [nvarchar](50) NULL,
	[AreaCode] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
 CONSTRAINT [PK__Area__3214EC07B3FBB433] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 2019/11/24 22:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[Id] [uniqueidentifier] NOT NULL,
	[Module] [nvarchar](50) NOT NULL,
	[Group] [nvarchar](100) NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[SaveName] [nvarchar](50) NOT NULL,
	[Ext] [nvarchar](50) NOT NULL,
	[Size] [bigint] NOT NULL,
	[SizeCn] [nvarchar](20) NOT NULL,
	[Md5] [nvarchar](50) NOT NULL,
	[Path] [nvarchar](200) NOT NULL,
	[FullPath] [nvarchar](300) NOT NULL,
	[Auth] [bit] NOT NULL,
	[MediaType] [nvarchar](100) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachment_Owner]    Script Date: 2019/11/24 22:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment_Owner](
	[Id] [uniqueidentifier] NOT NULL,
	[AttachmentId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dict]    Script Date: 2019/11/24 22:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dict](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dict_Group]    Script Date: 2019/11/24 22:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dict_Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Icon] [nvarchar](50) NULL,
	[Sort] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dict_Item]    Script Date: 2019/11/24 22:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dict_Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](50) NOT NULL,
	[DictCode] [nvarchar](50) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
	[Extend] [nvarchar](400) NULL,
	[Icon] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media_Type]    Script Date: 2019/11/24 22:17:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media_Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ext] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK__Media_Ty__3214EC07F5F03266] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Area] ADD  CONSTRAINT [DF__Area__ParentId__4BAC3F29]  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[Area] ADD  CONSTRAINT [DF__Area__Level__4CA06362]  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[Attachment] ADD  DEFAULT ((0)) FOR [Size]
GO
ALTER TABLE [dbo].[Attachment] ADD  DEFAULT ((0)) FOR [Auth]
GO
ALTER TABLE [dbo].[Attachment] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Attachment] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Attachment] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Attachment] ADD  DEFAULT (getdate()) FOR [DeletedTime]
GO
ALTER TABLE [dbo].[Dict] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Dict] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Dict] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Dict_Group] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Dict_Group] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Dict_Group] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Dict_Item] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[Dict_Item] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Dict_Item] ADD  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[Dict_Item] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Dict_Item] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
USE [master]
GO
ALTER DATABASE [Nm_Common] SET  READ_WRITE 
GO
