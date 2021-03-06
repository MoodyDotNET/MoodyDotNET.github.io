USE [master]
GO
/****** Object:  Database [Moody]    Script Date: 7/1/2018 9:29:04 PM ******/
CREATE DATABASE [Moody]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Moody', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Moody.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Moody_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Moody_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Moody] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Moody].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Moody] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Moody] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Moody] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Moody] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Moody] SET ARITHABORT OFF 
GO
ALTER DATABASE [Moody] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Moody] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Moody] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Moody] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Moody] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Moody] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Moody] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Moody] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Moody] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Moody] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Moody] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Moody] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Moody] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Moody] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Moody] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Moody] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Moody] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Moody] SET RECOVERY FULL 
GO
ALTER DATABASE [Moody] SET  MULTI_USER 
GO
ALTER DATABASE [Moody] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Moody] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Moody] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Moody] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Moody] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Moody', N'ON'
GO
ALTER DATABASE [Moody] SET QUERY_STORE = OFF
GO
USE [Moody]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Moody]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/1/2018 9:29:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[LastModifyAt] [datetime] NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumName] [nvarchar](50) NOT NULL,
	[DateReleased] [datetime] NULL,
	[Genre] [varchar](20) NULL,
	[LastModifyAt] [datetime] NULL,
	[LastModifyBy] [int] NULL,
 CONSTRAINT [PK_Album_1] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistCode] [int] IDENTITY(1,1) NOT NULL,
	[Band] [int] NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Biography] [nvarchar](max) NULL,
	[BirthDate] [datetime] NULL,
	[Introduce] [nvarchar](max) NULL,
	[ProducerCode] [int] NULL,
	[LastModifyAt] [datetime] NULL,
	[LastModifyBy] [int] NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[TagCode] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](50) NOT NULL,
	[LastModifyAt] [datetime] NULL,
	[LastModifyBy] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[TagCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[LastModifyBy] [int] NULL,
	[LastModifyAt] [datetime] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[SongID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[SongID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ProducerCode] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Owner] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[LastModifyAt] [datetime] NULL,
	[LastModifyBy] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[ProducerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[UserID] [int] NOT NULL,
	[SongID] [int] NOT NULL,
	[Score] [float] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[SongCode] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Subtitle] [nvarchar](50) NOT NULL,
	[Rating] [float] NOT NULL,
	[ListeningFrequency] [int] NOT NULL,
	[ContributingArtist] [int] NOT NULL,
	[AlbumID] [int] NULL,
	[DateReleased] [datetime] NULL,
	[LastModifyAt] [datetime] NULL,
	[LastModifyBy] [int] NULL,
	[Composer] [int] NOT NULL,
	[Lyric] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[SongCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 7/1/2018 9:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagCode] [int] NOT NULL,
	[SongCode] [int] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagCode] ASC,
	[SongCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([UserID], [Username], [Password], [FirstName], [MiddleName], [LastName], [LastModifyAt]) VALUES (5, N'hongphat', N'hongphat', N'Phat', N' Hong', N'Nguyen', CAST(N'2018-06-21T15:07:33.803' AS DateTime))
INSERT [dbo].[Administrator] ([UserID], [Username], [Password], [FirstName], [MiddleName], [LastName], [LastModifyAt]) VALUES (6, N'hoangduong', N'hoangduong', N'Duong', N'Hoang', N'Phan Tran', CAST(N'2018-06-20T07:10:10.313' AS DateTime))
INSERT [dbo].[Administrator] ([UserID], [Username], [Password], [FirstName], [MiddleName], [LastName], [LastModifyAt]) VALUES (7, N'minhnhat', N'minhnhat', N'Nhat', N'Minh', N'Le', CAST(N'2018-06-20T07:10:10.313' AS DateTime))
SET IDENTITY_INSERT [dbo].[Administrator] OFF
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([AlbumID], [AlbumName], [DateReleased], [Genre], [LastModifyAt], [LastModifyBy]) VALUES (1, N'Duong''s Favorite', CAST(N'2018-07-30T17:00:00.000' AS DateTime), N'Mix', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [DateReleased], [Genre], [LastModifyAt], [LastModifyBy]) VALUES (5, N'Divide', CAST(N'2017-03-02T17:00:00.000' AS DateTime), N'Pop', CAST(N'2018-06-21T15:09:19.640' AS DateTime), 5)
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [DateReleased], [Genre], [LastModifyAt], [LastModifyBy]) VALUES (6, N'Jay Chou ''s Best Song', CAST(N'2018-06-26T16:16:14.073' AS DateTime), N'Chinese', CAST(N'2018-06-26T23:16:22.657' AS DateTime), 6)
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [DateReleased], [Genre], [LastModifyAt], [LastModifyBy]) VALUES (7, N'Your Lie in April (Shigatsu wa Kimi no Uso)', CAST(N'2014-06-26T16:18:51.160' AS DateTime), N'Japanese', CAST(N'2018-06-26T23:19:04.637' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Album] OFF
SET IDENTITY_INSERT [dbo].[Artist] ON 

INSERT [dbo].[Artist] ([ArtistCode], [Band], [FirstName], [LastName], [MiddleName], [Biography], [BirthDate], [Introduce], [ProducerCode], [LastModifyAt], [LastModifyBy]) VALUES (3, NULL, N'Jay', N'Chou', N' ', N' Chinese Singer', CAST(N'2018-06-20T07:10:10.313' AS DateTime), N'  Chinese Singer', 1, CAST(N'2018-06-26T23:04:35.357' AS DateTime), 6)
INSERT [dbo].[Artist] ([ArtistCode], [Band], [FirstName], [LastName], [MiddleName], [Biography], [BirthDate], [Introduce], [ProducerCode], [LastModifyAt], [LastModifyBy]) VALUES (4, NULL, N'Goose', N'House', N' ', N' Japanese Band', CAST(N'2018-06-20T07:10:10.313' AS DateTime), N'Japanses Band', 1, CAST(N'2018-06-26T23:05:57.427' AS DateTime), 6)
INSERT [dbo].[Artist] ([ArtistCode], [Band], [FirstName], [LastName], [MiddleName], [Biography], [BirthDate], [Introduce], [ProducerCode], [LastModifyAt], [LastModifyBy]) VALUES (5, NULL, N'Se7en', N'Eleven', N' ', N'Korea-Japan Artist', CAST(N'2018-06-20T07:10:10.313' AS DateTime), N' Korea-Japan Artist', 1, CAST(N'2018-06-26T23:07:19.450' AS DateTime), 6)
INSERT [dbo].[Artist] ([ArtistCode], [Band], [FirstName], [LastName], [MiddleName], [Biography], [BirthDate], [Introduce], [ProducerCode], [LastModifyAt], [LastModifyBy]) VALUES (6, NULL, N'Edward', N'Sheeran', N'Christopher ', N'Sheeran was born in Halifax, West Yorkshire, and raised in Framlingham, Suffolk. He attended the Academy of Contemporary Music in Guildford as an undergraduate from the age of 18 in 2009. In early 2011, Sheeran independently released the extended play, No. 5 Collaborations Project.', CAST(N'1991-02-16T17:00:00.000' AS DateTime), N'An English singer, songwriter, guitarist, record producer, and actor', 2, CAST(N'2018-06-21T15:17:31.360' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[Artist] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (1, N'Blue', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (2, N'Classical', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (3, N'Rock', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (4, N'Pop', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (5, N'VietNamese', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (6, N'US-UK', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (7, N'Japanese', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (8, N'France', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (9, N'Korea', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (10, N'Traditional', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (11, N'Dance', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (12, N'Remix', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (13, N'Rap', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (14, N'Hiphop', CAST(N'2018-06-20T07:10:10.313' AS DateTime), 6)
INSERT [dbo].[Category] ([TagCode], [TagName], [LastModifyAt], [LastModifyBy]) VALUES (15, N'Chinese', CAST(N'2018-07-01T20:57:59.933' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([UserID], [Username], [Password], [FirstName], [MiddleName], [LastName], [LastModifyBy], [LastModifyAt]) VALUES (1, N'dragneol', N'123', N'Duong', N'Hoang', N'Phan Tran', 6, CAST(N'2018-06-20T07:10:10.313' AS DateTime))
INSERT [dbo].[Member] ([UserID], [Username], [Password], [FirstName], [MiddleName], [LastName], [LastModifyBy], [LastModifyAt]) VALUES (2, N'nguyenhongphat0', N'123', N'Phat', N'Hong', N'Nguyen', 6, CAST(N'2018-06-20T07:10:10.313' AS DateTime))
INSERT [dbo].[Member] ([UserID], [Username], [Password], [FirstName], [MiddleName], [LastName], [LastModifyBy], [LastModifyAt]) VALUES (3, N'leminhnhat', N'123', N'Nhat', N'Minh', N'Le', 6, CAST(N'2018-06-20T07:10:10.313' AS DateTime))
SET IDENTITY_INSERT [dbo].[Member] OFF
INSERT [dbo].[Playlist] ([SongID], [UserID]) VALUES (13, 2)
INSERT [dbo].[Playlist] ([SongID], [UserID]) VALUES (15, 1)
INSERT [dbo].[Playlist] ([SongID], [UserID]) VALUES (1042, 1)
INSERT [dbo].[Playlist] ([SongID], [UserID]) VALUES (1044, 1)
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([ProducerCode], [CompanyName], [Owner], [Address], [LastModifyAt], [LastModifyBy]) VALUES (1, N'DuongProduction', N'Hoang Duong', N'TCH10', CAST(N'2018-06-21T15:16:56.000' AS DateTime), 6)
INSERT [dbo].[Producer] ([ProducerCode], [CompanyName], [Owner], [Address], [LastModifyAt], [LastModifyBy]) VALUES (2, N'Ed Sheeran', N'Ed Sheeran', N'Framlingham, Suffolk, England', CAST(N'2018-06-21T15:16:56.170' AS DateTime), 5)
INSERT [dbo].[Producer] ([ProducerCode], [CompanyName], [Owner], [Address], [LastModifyAt], [LastModifyBy]) VALUES (3, N'Toei Animation', N'Shinsha', N'Tokyo, Japan', CAST(N'2018-06-26T23:20:53.690' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Producer] OFF
INSERT [dbo].[Rating] ([UserID], [SongID], [Score]) VALUES (1, 7, 5)
INSERT [dbo].[Rating] ([UserID], [SongID], [Score]) VALUES (1, 13, 5)
INSERT [dbo].[Rating] ([UserID], [SongID], [Score]) VALUES (1, 15, 4)
INSERT [dbo].[Rating] ([UserID], [SongID], [Score]) VALUES (1, 1042, 5)
INSERT [dbo].[Rating] ([UserID], [SongID], [Score]) VALUES (1, 1044, 5)
INSERT [dbo].[Rating] ([UserID], [SongID], [Score]) VALUES (1, 1046, 4.4000000953674316)
SET IDENTITY_INSERT [dbo].[Song] ON 

INSERT [dbo].[Song] ([SongCode], [Title], [Subtitle], [Rating], [ListeningFrequency], [ContributingArtist], [AlbumID], [DateReleased], [LastModifyAt], [LastModifyBy], [Composer], [Lyric]) VALUES (7, N'Aitai', N'会いたい', 5, 501, 5, 1, CAST(N'2018-06-20T07:10:10.313' AS DateTime), CAST(N'2018-06-29T16:18:26.007' AS DateTime), 6, 5, N'"Tanoshikatta ne"
Chiisaku tsubuyaki hohoenda kimi
"Mada soba ni ite yo"
Komiageru yowane nomikonda boku

Narihibiku densha no BERU (Bell)
Mujou ni futari o hikisaku
Karamaseta yubi to yubi o hodoite
Betsubetsu no basho e tabidatsu

Aitai to omou aitai to negau
Ai dake ga kureru yorokobi ni furetai
Aitai to negau dakede hoteru karada
Samasu sube wa sono nukumori dake
Shitte iru noni

Fumikomanu youni tagai no kurashi o
Okasanai youni
Dakedo saikin wa MEERU (Mail) ya denwa ja
Kyori o umekirenai

Imamade no koi to wa chigau
Yodominai kimochi ga afureteku
Dokomademo toumei na sono hitomi
Mitsumetsudzukete oboretai

Aitai to omou aitai to negau
Futari deau basho de sakende iru kara
Soshite itsu no hi ka soshite towa no chikai o
Taterareru sono toki ga kuru koto shinjiteru kara
(Oh yeah...)

Nemurenai yoru de yami ni tsutsumarete
Kimi o motomete samayoitsudzukeru
Aishiteiru yo kowashitai hodo ni
Nakinurete asa o mukaeireru
(Oh...yeah...)

Aitai to omou aitai to negau
Ai dake ga kureru yorokobi ni furetai
Aitai to negau dakede hoteru karada
Samasu sube wa sono nukumori dake
Shitte iru noni')
INSERT [dbo].[Song] ([SongCode], [Title], [Subtitle], [Rating], [ListeningFrequency], [ContributingArtist], [AlbumID], [DateReleased], [LastModifyAt], [LastModifyBy], [Composer], [Lyric]) VALUES (13, N'Dive', N' ', 5, 1003, 6, 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2018-06-29T16:20:45.033' AS DateTime), 6, 6, N'Maybe I came on too strong
Maybe I waited too long
Maybe I played my cards wrong
Oh, just a little bit wrong
Baby I apologize for it
I could fall, or I could fly
Here in your aeroplane
And I could live, I could die
Hanging on the words you say
And I’ve been known to give my all
And jumping in harder than
Ten thousand rocks on the lake
So don’t call me baby
Unless you mean it
Don’t tell me you need me
If you don’t believe it
So let me know the truth
Before I dive right into you
You’re a mystery
I have travelled the world, there’s no other girl like you
No one, what’s your history?
Do you have a tendency to lead some people on?
''Cause I heard you do, mm
I could fall, or I could fly
Here in your aeroplane
And I could live, I could die
Hanging on the words you say
And I’ve been known to give my all
And lie awake, everyday don''t know how much I can take
So don’t call me baby
Unless you mean it
And don’t tell me you need me
If you don’t believe it
So let me know the truth
Before I dive right into you
I could fall, or I could fly
Here in your aeroplane
And I could live, I could die
Hanging on the words you say
And I’ve been known to give my all
Sitting back, looking at every messy that I made
So don’t call me baby
Unless you mean it
Don’t tell me you need me
If you don’t believe it
Let me know the truth
Before I dive right into you
Before I dive right into you
Before I dive right into you')
INSERT [dbo].[Song] ([SongCode], [Title], [Subtitle], [Rating], [ListeningFrequency], [ContributingArtist], [AlbumID], [DateReleased], [LastModifyAt], [LastModifyBy], [Composer], [Lyric]) VALUES (14, N'Perfect', N' ', 5, 10003, 6, 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2018-06-29T16:22:41.557' AS DateTime), 6, 6, N'I found a love for me
Darling just dive right in
And follow my lead
Well I found a girl beautiful and sweet
I never knew you were the someone waiting for me
''Cause we were just kids when we fell in love
Not knowing what it was
I will not give you up this time
But darling, just kiss me slow, your heart is all I own
And in your eyes you''re holding mine
Baby, I''m dancing in the dark with you between my arms
Barefoot on the grass, listening to our favorite song
When you said you looked a mess, I whispered underneath my breath
But you heard it, darling, you look perfect tonight
Well I found a woman, stronger than anyone I know
She shares my dreams, I hope that someday I''ll share her home
I found a love, to carry more than just my secrets
To carry love, to carry children of our own
We are still kids, but we''re so in love
Fighting against all odds
I know we''ll be alright this time
Darling, just hold my hand
Be my girl, I''ll be your man
I see my future in your eyes
Baby, I''m dancing in the dark, with you between my arms
Barefoot on the grass, listening to our favorite song
When I saw you in that dress, looking so beautiful
I don''t deserve this, darling, you look perfect tonight
Baby, I''m dancing in the dark, with you between my arms
Barefoot on the grass, listening to our favorite song
I have faith in what I see
Now I know I have met an angel in person
And she looks perfect
I don''t deserve this
You look perfect tonight')
INSERT [dbo].[Song] ([SongCode], [Title], [Subtitle], [Rating], [ListeningFrequency], [ContributingArtist], [AlbumID], [DateReleased], [LastModifyAt], [LastModifyBy], [Composer], [Lyric]) VALUES (15, N'How Would You Feel', N' ', 4.666666666666667, 5005, 6, 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2018-06-29T16:25:17.910' AS DateTime), 6, 6, N'You are the one girl
And you know that it''s true
I''m feeling younger
Every time that I''m alone with you
We were sitting in a parked car
Stealing kisses in the front yard
We got questions we should not ask but
How would you feel, if I told you I loved you?
It''s just something that I want to do
I''ll be taking my time, spending my life
Falling deeper in love with you
So tell me that you love me too
In the summer, as the lilacs bloom
Love flows deeper than the river
Every moment that I spend with you
We were sat upon our best friend''s roof
I had both of my arms round you
Watching the sunrise replace the moon
How would you feel, if I told you I loved you?
It''s just something that I want to do
I''ll be taking my time, spending my life
Falling deeper in love with you
So tell me that you love me too
We were sitting in a parked car
Stealing kisses in the front yard
We got questions we shouldn not ask
How would you feel, if I told you I loved you?
It''s just something that I want to do
I''ll be taking my time, spending my life
Falling deeper in love with you
So tell me that you love me too
Tell me that you love me too
Tell me that you love me too')
INSERT [dbo].[Song] ([SongCode], [Title], [Subtitle], [Rating], [ListeningFrequency], [ContributingArtist], [AlbumID], [DateReleased], [LastModifyAt], [LastModifyBy], [Composer], [Lyric]) VALUES (1042, N'Photograph', N' ', 4.7333333492279053, 6, 6, 5, CAST(N'2014-06-29T09:37:30.077' AS DateTime), CAST(N'2018-06-29T16:37:37.583' AS DateTime), 6, 6, N'You are the one girl
And you know that it''s true
I''m feeling younger
Every time that I''m alone with you
We were sitting in a parked car
Stealing kisses in the front yard
We got questions we should not ask but
How would you feel, if I told you I loved you?
It''s just something that I want to do
I''ll be taking my time, spending my life
Falling deeper in love with you
So tell me that you love me too
In the summer, as the lilacs bloom
Love flows deeper than the river
Every moment that I spend with you
We were sat upon our best friend''s roof
I had both of my arms round you
Watching the sunrise replace the moon
How would you feel, if I told you I loved you?
It''s just something that I want to do
I''ll be taking my time, spending my life
Falling deeper in love with you
So tell me that you love me too
We were sitting in a parked car
Stealing kisses in the front yard
We got questions we shouldn not ask
How would you feel, if I told you I loved you?
It''s just something that I want to do
I''ll be taking my time, spending my life
Falling deeper in love with you
So tell me that you love me too
Tell me that you love me too
Tell me that you love me too')
INSERT [dbo].[Song] ([SongCode], [Title], [Subtitle], [Rating], [ListeningFrequency], [ContributingArtist], [AlbumID], [DateReleased], [LastModifyAt], [LastModifyBy], [Composer], [Lyric]) VALUES (1043, N'Hair Like Snow', N'发如雪', 0, 2, 3, 6, CAST(N'2018-06-20T07:10:10.313' AS DateTime), CAST(N'2018-06-29T16:45:44.650' AS DateTime), 6, 3, N'狼牙月 伊人憔悴
lang ya yue / yi ren qiao cui
A wolf fang moon, my dear one is waned and sallow

我举杯 饮尽了风雪
wo ju bei / yin jin le feng xue
I raise a cup and drink in the wind and snow

是谁打翻前世柜
shi shui da fan qian shi gui
Who overturned the cupboard of past lives

惹尘埃是非
re chen ai shi fei
Provoking the dust to dispute


缘字诀 几番轮回
yuan zi jue / ji fan lun hui
A predestined formula for words, how many reincarnations?

你锁眉 哭红颜唤不回
ni suo mei / ku hong yan huan bu hui
You''re frowning, crying that a lover cannot be called back

纵然青史已经成灰
zong ran qing shi yi jing cheng hui
Even if the annals of history has already become dust

我爱不灭
wo ai bu mie
My love will not end


繁华如三千东流水
fan hua ru san qian dong liu shui
Grandeur is like three thousand waters flowing south

我只取一瓢爱了解
wo zhi qu yi piao ai liao jie
Yet I only choose a ladle of love to comprehend

只恋你化身的蝶
zhi lian ni hua shen de die
Only long for your butterfly incarnation


你发如雪 凄美了离别
ni fa ru xue / qi mei le li bie
Your hair is like snow, beautifully chilling the parting

我焚香感动了谁
wo fen xiang gan dong le shui
Who is touched by my incense?

邀明月让回忆皎洁
yao ming yue rang hui yi jiao jie
Invite the bright moon to make my memories bright and clear

爱在月光下完美
ai zai yue guang xia wan mei
Love becomes immaculate underneath the moonlight


你发如雪 纷飞了眼泪
ni fa ru xue / fen fei le yan lei
Your hair is like snow, a mess of flying tears

我等待苍老了谁
wo deng dai cang lao le shui
Who has been made old by my waiting?

红尘醉 微醺的岁月
hong chen zui / wei xun de sui yue
The word of mortals are intoxicated, slightly drunken eras

我用无悔 刻永世爱你的碑
wo yong wu hui / ke yong shi ai ni de bei
I use my lack of regret to carve out a stone tablet that represents my eternal love for you


(Rap)
你发如雪 凄美了离别
ni fa ru xue / qi mei le li bie
Your hair is like snow, beautifully chilling the parting

我焚香感动了谁
wo fen xiang gan dong le shui
Who is touched by my incense?

邀明月让回忆皎洁
yao ming yue rang hui yi jiao jie
Invite the bright moon to make my memories bright and clear

爱在月光下完美
ai zai yue guang xia wan mei
Love becomes immaculate underneath the moonlight

你发如雪 纷飞了眼泪
ni fa ru xue / fen fei le yan lei
Your hair is like snow, a mess of flying tears

我等待苍老了谁
wo deng dai cang lao le shui
Who has been made old by my waiting?

红尘醉 微醺的岁月
hong chen zui / wei xun de sui yue
The word of mortals are intoxicated, slightly drunken eras

啦儿啦 ~
la er la ~
La er la~

铜镜映无邪 扎马尾
tong jing ying wu xie / zha mai wei
There is nothing wicked reflected in the bronze mirror; tie a ponytail

你若撒野 今生我把酒奉陪
ni ruo sa ye / jin sheng wo ba jiu feng pei
If you act wildly, in this life I will pour a cup of wine and keep you company ')
INSERT [dbo].[Song] ([SongCode], [Title], [Subtitle], [Rating], [ListeningFrequency], [ContributingArtist], [AlbumID], [DateReleased], [LastModifyAt], [LastModifyBy], [Composer], [Lyric]) VALUES (1044, N'Green Vase', N'发如雪', 4.6800000190734865, 2, 3, 6, CAST(N'2018-06-20T07:10:10.313' AS DateTime), CAST(N'2018-06-29T16:56:34.207' AS DateTime), 6, 3, N'狼牙月 伊人憔悴
lang ya yue / yi ren qiao cui
A wolf fang moon, my dear one is waned and sallow

我举杯 饮尽了风雪
wo ju bei / yin jin le feng xue
I raise a cup and drink in the wind and snow

是谁打翻前世柜
shi shui da fan qian shi gui
Who overturned the cupboard of past lives

惹尘埃是非
re chen ai shi fei
Provoking the dust to dispute


缘字诀 几番轮回
yuan zi jue / ji fan lun hui
A predestined formula for words, how many reincarnations?

你锁眉 哭红颜唤不回
ni suo mei / ku hong yan huan bu hui
You''re frowning, crying that a lover cannot be called back

纵然青史已经成灰
zong ran qing shi yi jing cheng hui
Even if the annals of history has already become dust

我爱不灭
wo ai bu mie
My love will not end


繁华如三千东流水
fan hua ru san qian dong liu shui
Grandeur is like three thousand waters flowing south

我只取一瓢爱了解
wo zhi qu yi piao ai liao jie
Yet I only choose a ladle of love to comprehend

只恋你化身的蝶
zhi lian ni hua shen de die
Only long for your butterfly incarnation


你发如雪 凄美了离别
ni fa ru xue / qi mei le li bie
Your hair is like snow, beautifully chilling the parting

我焚香感动了谁
wo fen xiang gan dong le shui
Who is touched by my incense?

邀明月让回忆皎洁
yao ming yue rang hui yi jiao jie
Invite the bright moon to make my memories bright and clear

爱在月光下完美
ai zai yue guang xia wan mei
Love becomes immaculate underneath the moonlight


你发如雪 纷飞了眼泪
ni fa ru xue / fen fei le yan lei
Your hair is like snow, a mess of flying tears

我等待苍老了谁
wo deng dai cang lao le shui
Who has been made old by my waiting?

红尘醉 微醺的岁月
hong chen zui / wei xun de sui yue
The word of mortals are intoxicated, slightly drunken eras

我用无悔 刻永世爱你的碑
wo yong wu hui / ke yong shi ai ni de bei
I use my lack of regret to carve out a stone tablet that represents my eternal love for you


(Rap)
你发如雪 凄美了离别
ni fa ru xue / qi mei le li bie
Your hair is like snow, beautifully chilling the parting

我焚香感动了谁
wo fen xiang gan dong le shui
Who is touched by my incense?

邀明月让回忆皎洁
yao ming yue rang hui yi jiao jie
Invite the bright moon to make my memories bright and clear

爱在月光下完美
ai zai yue guang xia wan mei
Love becomes immaculate underneath the moonlight

你发如雪 纷飞了眼泪
ni fa ru xue / fen fei le yan lei
Your hair is like snow, a mess of flying tears

我等待苍老了谁
wo deng dai cang lao le shui
Who has been made old by my waiting?

红尘醉 微醺的岁月
hong chen zui / wei xun de sui yue
The word of mortals are intoxicated, slightly drunken eras

啦儿啦 ~
la er la ~
La er la~

铜镜映无邪 扎马尾
tong jing ying wu xie / zha mai wei
There is nothing wicked reflected in the bronze mirror; tie a ponytail

你若撒野 今生我把酒奉陪
ni ruo sa ye / jin sheng wo ba jiu feng pei
If you act wildly, in this life I will pour a cup of wine and keep you company ')
INSERT [dbo].[Song] ([SongCode], [Title], [Subtitle], [Rating], [ListeningFrequency], [ContributingArtist], [AlbumID], [DateReleased], [LastModifyAt], [LastModifyBy], [Composer], [Lyric]) VALUES (1046, N'Shape Of You', N' ', 4.6000000238418579, 6, 6, 5, CAST(N'2018-06-29T10:09:27.997' AS DateTime), CAST(N'2018-06-29T17:09:44.857' AS DateTime), 6, 6, N'')
SET IDENTITY_INSERT [dbo].[Song] OFF
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (1, 13)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (1, 14)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (1, 15)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (1, 1042)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (4, 7)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (4, 13)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (4, 14)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (4, 15)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (4, 1042)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (4, 1043)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (4, 1044)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (4, 1046)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (6, 13)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (6, 14)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (6, 15)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (6, 1042)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (6, 1046)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (7, 7)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (10, 1043)
INSERT [dbo].[Tag] ([TagCode], [SongCode]) VALUES (10, 1044)
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Table_1]    Script Date: 7/1/2018 9:29:06 PM ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [UK_Table_1] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Song] ADD  CONSTRAINT [DF_Song_Rating]  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[Song] ADD  CONSTRAINT [DF_Song_ListeningFrequency]  DEFAULT ((0)) FOR [ListeningFrequency]
GO
ALTER TABLE [dbo].[Song] ADD  CONSTRAINT [DF_Song_DateReleased]  DEFAULT (((1)/(1))/(1900)) FOR [DateReleased]
GO
ALTER TABLE [dbo].[Song] ADD  CONSTRAINT [DF_Song_Lyric]  DEFAULT ('N/A') FOR [Lyric]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Administrator] FOREIGN KEY([LastModifyBy])
REFERENCES [dbo].[Administrator] ([UserID])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Administrator]
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Administrator] FOREIGN KEY([LastModifyBy])
REFERENCES [dbo].[Administrator] ([UserID])
GO
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [FK_Artist_Administrator]
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Artist] FOREIGN KEY([Band])
REFERENCES [dbo].[Artist] ([ArtistCode])
GO
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [FK_Artist_Artist]
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Producer] FOREIGN KEY([ProducerCode])
REFERENCES [dbo].[Producer] ([ProducerCode])
GO
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [FK_Artist_Producer]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Administrator] FOREIGN KEY([LastModifyBy])
REFERENCES [dbo].[Administrator] ([UserID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Administrator]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Administrator] FOREIGN KEY([LastModifyBy])
REFERENCES [dbo].[Administrator] ([UserID])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Administrator]
GO
ALTER TABLE [dbo].[Playlist]  WITH CHECK ADD  CONSTRAINT [FK_Playlist_Member] FOREIGN KEY([UserID])
REFERENCES [dbo].[Member] ([UserID])
GO
ALTER TABLE [dbo].[Playlist] CHECK CONSTRAINT [FK_Playlist_Member]
GO
ALTER TABLE [dbo].[Playlist]  WITH CHECK ADD  CONSTRAINT [FK_Playlist_Song] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongCode])
GO
ALTER TABLE [dbo].[Playlist] CHECK CONSTRAINT [FK_Playlist_Song]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Administrator] FOREIGN KEY([LastModifyBy])
REFERENCES [dbo].[Administrator] ([UserID])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Administrator]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Member] FOREIGN KEY([UserID])
REFERENCES [dbo].[Member] ([UserID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Member]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Song] FOREIGN KEY([SongID])
REFERENCES [dbo].[Song] ([SongCode])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Song]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_Song_Administrator] FOREIGN KEY([LastModifyBy])
REFERENCES [dbo].[Administrator] ([UserID])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_Song_Administrator]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_Song_Album] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_Song_Album]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_Song_Artist] FOREIGN KEY([Composer])
REFERENCES [dbo].[Artist] ([ArtistCode])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_Song_Artist]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_Song_Artist1] FOREIGN KEY([ContributingArtist])
REFERENCES [dbo].[Artist] ([ArtistCode])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_Song_Artist1]
GO
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Category] FOREIGN KEY([TagCode])
REFERENCES [dbo].[Category] ([TagCode])
GO
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_Category]
GO
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Song] FOREIGN KEY([SongCode])
REFERENCES [dbo].[Song] ([SongCode])
GO
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_Song]
GO
USE [master]
GO
ALTER DATABASE [Moody] SET  READ_WRITE 
GO
