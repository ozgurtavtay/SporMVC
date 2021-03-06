USE [master]
GO
/****** Object:  Database [SporO]    Script Date: 28.02.2019 14:32:32 ******/
CREATE DATABASE [SporO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SporO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SporO.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SporO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SporO_log.ldf' , SIZE = 7616KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SporO] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SporO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SporO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SporO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SporO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SporO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SporO] SET ARITHABORT OFF 
GO
ALTER DATABASE [SporO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SporO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SporO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SporO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SporO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SporO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SporO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SporO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SporO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SporO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SporO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SporO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SporO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SporO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SporO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SporO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SporO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SporO] SET RECOVERY FULL 
GO
ALTER DATABASE [SporO] SET  MULTI_USER 
GO
ALTER DATABASE [SporO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SporO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SporO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SporO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SporO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SporO', N'ON'
GO
USE [SporO]
GO
/****** Object:  Table [dbo].[Etkinlik]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etkinlik](
	[EtkinlikId] [int] IDENTITY(1,1) NOT NULL,
	[EtkinlikAdi] [nvarchar](50) NULL,
	[TipId] [int] NOT NULL,
	[MekanID] [int] NOT NULL,
	[EtkinlikTarihi] [datetime] NULL,
	[Kontenjan] [int] NULL,
	[isActive] [int] NOT NULL CONSTRAINT [DF_Etkinlik_isActive]  DEFAULT ((1)),
	[Sid] [int] NOT NULL,
	[Kurucu] [int] NULL,
 CONSTRAINT [PK_Etkinlik] PRIMARY KEY CLUSTERED 
(
	[EtkinlikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EtkinlikTipi]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtkinlikTipi](
	[TipId] [int] IDENTITY(1,1) NOT NULL,
	[Tip] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](max) NULL,
 CONSTRAINT [PK_EtkinlikTipi] PRIMARY KEY CLUSTERED 
(
	[TipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HataLoglari]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HataLoglari](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DosyaAdi] [nvarchar](max) NULL,
	[MethodAdi] [varchar](max) NULL,
	[LineNumber] [int] NULL,
	[ColumnNumber] [int] NULL,
	[Message] [varchar](max) NULL,
	[trh] [datetime] NULL CONSTRAINT [DF_HataLoglari_trh]  DEFAULT (getdate()),
 CONSTRAINT [PK_HataLoglari] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ilceler]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilceler](
	[Id] [int] NOT NULL,
	[Ad] [nvarchar](255) NULL,
	[Sehir] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ilceler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Iller]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iller](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sehir] [nvarchar](255) NULL,
 CONSTRAINT [PK_iller] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Katilanlar]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Katilanlar](
	[Eid] [int] NOT NULL,
	[Kid] [int] NOT NULL,
 CONSTRAINT [PK_Katilanlar] PRIMARY KEY CLUSTERED 
(
	[Eid] ASC,
	[Kid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kullanici](
	[Kid] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Sifre] [char](10) NULL,
	[Ilce] [nvarchar](50) NULL,
	[DogumTarihi] [datetime] NULL,
	[Cinsiyet] [int] NULL,
	[isLogin] [int] NOT NULL CONSTRAINT [DF_Kullanici_isLogin]  DEFAULT ((1)),
 CONSTRAINT [PK_Kullanıcı] PRIMARY KEY CLUSTERED 
(
	[Kid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KullaniciSpor]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciSpor](
	[Kid] [int] NOT NULL,
	[Sid] [int] NOT NULL,
 CONSTRAINT [PK_KullaniciSpor] PRIMARY KEY CLUSTERED 
(
	[Kid] ASC,
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mekan]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mekan](
	[Mid] [int] IDENTITY(1,1) NOT NULL,
	[MekanAdi] [nvarchar](50) NULL,
	[IlceId] [int] NULL,
 CONSTRAINT [PK_Mekan] PRIMARY KEY CLUSTERED 
(
	[Mid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sporlar]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sporlar](
	[SporId] [int] IDENTITY(1,1) NOT NULL,
	[SporAdi] [nvarchar](50) NULL,
	[SporcuSayisi] [int] NULL,
 CONSTRAINT [PK_Sporlar] PRIMARY KEY CLUSTERED 
(
	[SporId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Etkinlik] ON 

INSERT [dbo].[Etkinlik] ([EtkinlikId], [EtkinlikAdi], [TipId], [MekanID], [EtkinlikTarihi], [Kontenjan], [isActive], [Sid], [Kurucu]) VALUES (22, N'Yeni', 1, 7, CAST(N'1999-10-10 10:11:11.000' AS DateTime), 12, 2, 1, 1)
INSERT [dbo].[Etkinlik] ([EtkinlikId], [EtkinlikAdi], [TipId], [MekanID], [EtkinlikTarihi], [Kontenjan], [isActive], [Sid], [Kurucu]) VALUES (23, N'asdas', 1, 7, CAST(N'2222-10-10 10:11:11.000' AS DateTime), 123, 1, 1, 34)
SET IDENTITY_INSERT [dbo].[Etkinlik] OFF
SET IDENTITY_INSERT [dbo].[EtkinlikTipi] ON 

INSERT [dbo].[EtkinlikTipi] ([TipId], [Tip], [Aciklama]) VALUES (1, N'Maç', NULL)
INSERT [dbo].[EtkinlikTipi] ([TipId], [Tip], [Aciklama]) VALUES (2, N'Antrenman', NULL)
INSERT [dbo].[EtkinlikTipi] ([TipId], [Tip], [Aciklama]) VALUES (3, N'Birebir', NULL)
INSERT [dbo].[EtkinlikTipi] ([TipId], [Tip], [Aciklama]) VALUES (4, N'Sosyal', NULL)
SET IDENTITY_INSERT [dbo].[EtkinlikTipi] OFF
SET IDENTITY_INSERT [dbo].[HataLoglari] ON 

INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (1, N'DataAccess.cs', N'Void Hata(System.Exception)', 185, 13, N'There are more columns in the INSERT statement than values specified in the VALUES clause. The number of values in the VALUES clause must match the number of columns specified in the INSERT statement.', CAST(N'2019-01-16 14:20:33.213' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (2, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 99, 17, N'There are more columns in the INSERT statement than values specified in the VALUES clause. The number of values in the VALUES clause must match the number of columns specified in the INSERT statement.', CAST(N'2019-01-16 14:20:33.217' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (3, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 35, 17, N'There are more columns in the INSERT statement than values specified in the VALUES clause. The number of values in the VALUES clause must match the number of columns specified in the INSERT statement.', CAST(N'2019-01-16 14:20:33.240' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (4, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'There are more columns in the INSERT statement than values specified in the VALUES clause. The number of values in the VALUES clause must match the number of columns specified in the INSERT statement.', CAST(N'2019-01-16 14:20:33.277' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (5, N'Program.cs', N'Void Main()', 19, 13, N'There are more columns in the INSERT statement than values specified in the VALUES clause. The number of values in the VALUES clause must match the number of columns specified in the INSERT statement.', CAST(N'2019-01-16 14:20:33.277' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (6, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 85, 21, N'Bilgiler Hatali', CAST(N'2019-01-16 14:25:04.337' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (7, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 35, 17, N'Bilgiler Hatali', CAST(N'2019-01-16 14:25:10.090' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (8, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-16 14:25:15.407' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (9, N'Program.cs', N'Void Main()', 19, 13, N'Bilgiler Hatali', CAST(N'2019-01-16 14:25:46.077' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (10, N'DataAccess.cs', N'Void HataVar(System.String)', 190, 13, N'Bilgiler Hatali', CAST(N'2019-01-16 14:32:59.723' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (11, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 85, 21, N'Bilgiler Hatali', CAST(N'2019-01-16 14:32:59.747' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (12, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-16 14:32:59.747' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (13, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-16 14:32:59.747' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (14, N'Program.cs', N'Void Main()', 19, 13, N'Bilgiler Hatali', CAST(N'2019-01-16 14:32:59.747' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (15, N'DataAccess.cs', N'Void HataVar(System.String)', 190, 13, N'Uygun Email değil!!!', CAST(N'2019-01-16 14:34:22.860' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (16, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 44, 17, N'Uygun Email değil!!!', CAST(N'2019-01-16 14:34:22.863' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (17, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Uygun Email değil!!!', CAST(N'2019-01-16 14:34:22.903' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (18, N'Program.cs', N'Void Main()', 19, 13, N'Uygun Email değil!!!', CAST(N'2019-01-16 14:34:22.907' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (19, N'DataAccess.cs', N'Void Hata(System.Exception)', 179, 13, N'Incorrect syntax near the keyword ''where''.', CAST(N'2019-01-17 09:09:56.490' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (20, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 93, 17, N'Incorrect syntax near the keyword ''where''.', CAST(N'2019-01-17 09:09:56.493' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (21, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Incorrect syntax near the keyword ''where''.', CAST(N'2019-01-17 09:09:56.497' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (22, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near the keyword ''where''.', CAST(N'2019-01-17 09:09:56.497' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (23, N'Program.cs', N'Void Main()', 19, 13, N'Incorrect syntax near the keyword ''where''.', CAST(N'2019-01-17 09:09:56.500' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (24, N'DataAccess.cs', N'Void Hata(System.Exception)', 176, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:35.287' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (25, N'DataAccess.cs', N'Int32 MekanAc(DAL.Mekanlar)', 130, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:35.290' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (26, N'BusinessLogic.cs', N'Int32 MekanAc(System.String, Int32)', 115, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:35.290' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (27, N'Mekan.cs', N'Void btnEkle_Click(System.Object, System.EventArgs)', 59, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:35.293' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (28, N'Program.cs', N'Void Main()', 19, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:35.293' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (29, N'DataAccess.cs', N'Void Hata(System.Exception)', 176, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.710' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (30, N'DataAccess.cs', N'Int32 MekanAc(DAL.Mekanlar)', 130, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.710' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (31, N'BusinessLogic.cs', N'Int32 MekanAc(System.String, Int32)', 115, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.713' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (32, N'Mekan.cs', N'Void btnEkle_Click(System.Object, System.EventArgs)', 59, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.727' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (33, N'Program.cs', N'Void Main()', 19, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.730' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (34, N'DataAccess.cs', N'Void Hata(System.Exception)', 176, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.883' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (35, N'DataAccess.cs', N'Int32 MekanAc(DAL.Mekanlar)', 130, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.883' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (36, N'BusinessLogic.cs', N'Int32 MekanAc(System.String, Int32)', 115, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.887' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (37, N'Mekan.cs', N'Void btnEkle_Click(System.Object, System.EventArgs)', 59, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.887' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (38, N'Program.cs', N'Void Main()', 19, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:48.890' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (39, N'DataAccess.cs', N'Void Hata(System.Exception)', 176, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.157' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (40, N'DataAccess.cs', N'Int32 MekanAc(DAL.Mekanlar)', 130, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.160' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (41, N'BusinessLogic.cs', N'Int32 MekanAc(System.String, Int32)', 115, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.160' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (42, N'Mekan.cs', N'Void btnEkle_Click(System.Object, System.EventArgs)', 59, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.163' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (43, N'Program.cs', N'Void Main()', 19, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.167' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (44, N'DataAccess.cs', N'Void Hata(System.Exception)', 176, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.290' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (45, N'DataAccess.cs', N'Int32 MekanAc(DAL.Mekanlar)', 130, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.290' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (46, N'BusinessLogic.cs', N'Int32 MekanAc(System.String, Int32)', 115, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.293' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (47, N'Mekan.cs', N'Void btnEkle_Click(System.Object, System.EventArgs)', 59, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.293' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (48, N'Program.cs', N'Void Main()', 19, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.297' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (49, N'DataAccess.cs', N'Void Hata(System.Exception)', 176, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.450' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (50, N'DataAccess.cs', N'Int32 MekanAc(DAL.Mekanlar)', 130, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.450' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (51, N'BusinessLogic.cs', N'Int32 MekanAc(System.String, Int32)', 115, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.453' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (52, N'Mekan.cs', N'Void btnEkle_Click(System.Object, System.EventArgs)', 59, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.453' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (53, N'Program.cs', N'Void Main()', 19, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Mekan_Iller". The conflict occurred in database "SporO", table "dbo.Iller", column ''Id''.
The statement has been terminated.', CAST(N'2019-01-17 14:16:49.457' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (54, N'DataAccess.cs', N'Void Hata(System.Exception)', 197, 13, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:43:21.780' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (55, N'DataAccess.cs', N'Int32 KullaniciKaydet(DAL.Kullanici)', 40, 17, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:43:21.850' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (56, N'BusinessLogic.cs', N'Int32 KullaniciKaydet(System.String, System.String, System.String, System.String, System.String, System.String, System.DateTime, Int32)', 73, 17, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:43:21.850' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (57, N'Kaydol.cs', N'Void btnKaydol_Click(System.Object, System.EventArgs)', 41, 13, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:43:21.853' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (58, N'Program.cs', N'Void Main()', 19, 13, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:43:21.857' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (59, N'DataAccess.cs', N'Void Hata(System.Exception)', 197, 13, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:44:44.780' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (60, N'DataAccess.cs', N'Int32 KullaniciKaydet(DAL.Kullanici)', 40, 17, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:44:44.780' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (61, N'BusinessLogic.cs', N'Int32 KullaniciKaydet(System.String, System.String, System.String, System.String, System.String, System.String, System.DateTime, Int32)', 73, 17, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:44:44.780' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (62, N'Kaydol.cs', N'Void btnKaydol_Click(System.Object, System.EventArgs)', 41, 13, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:44:44.830' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (63, N'Program.cs', N'Void Main()', 19, 13, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:44:44.830' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (64, N'DataAccess.cs', N'Void Hata(System.Exception)', 197, 13, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:55:22.327' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (65, N'DataAccess.cs', N'Int32 KullaniciKaydet(DAL.Kullanici)', 40, 17, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:55:22.330' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (66, N'BusinessLogic.cs', N'Int32 KullaniciKaydet(System.String, System.String, System.String, System.String, System.String, System.String, System.DateTime, Int32)', 73, 17, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:55:22.397' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (67, N'Kaydol.cs', N'Void btnKaydol_Click(System.Object, System.EventArgs)', 41, 13, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:55:22.400' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (68, N'Program.cs', N'Void Main()', 19, 13, N'Invalid column name ''Ilce''.', CAST(N'2019-01-18 08:55:22.400' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (69, N'DataAccess.cs', N'Void Hata(System.Exception)', 197, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_KullaniciSpor_Kullanici". The conflict occurred in database "SporO", table "dbo.Kullanici", column ''Kid''.
The statement has been terminated.', CAST(N'2019-01-18 10:10:32.190' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (70, N'DataAccess.cs', N'Int32 KullaniciSpor(DAL.Kullanici, Int32[])', 65, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_KullaniciSpor_Kullanici". The conflict occurred in database "SporO", table "dbo.Kullanici", column ''Kid''.
The statement has been terminated.', CAST(N'2019-01-18 10:10:32.193' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (71, N'DataAccess.cs', N'Int32 KullaniciKaydet(DAL.Kullanici, Int32[])', 35, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_KullaniciSpor_Kullanici". The conflict occurred in database "SporO", table "dbo.Kullanici", column ''Kid''.
The statement has been terminated.', CAST(N'2019-01-18 10:10:32.193' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (72, N'BusinessLogic.cs', N'Int32 KullaniciKaydet(System.String, System.String, System.String, System.String, System.String, System.String, System.DateTime, Int32, Int32[])', 70, 17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_KullaniciSpor_Kullanici". The conflict occurred in database "SporO", table "dbo.Kullanici", column ''Kid''.
The statement has been terminated.', CAST(N'2019-01-18 10:10:32.197' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (73, N'Kaydol.cs', N'Void btnKaydol_Click(System.Object, System.EventArgs)', 50, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_KullaniciSpor_Kullanici". The conflict occurred in database "SporO", table "dbo.Kullanici", column ''Kid''.
The statement has been terminated.', CAST(N'2019-01-18 10:10:32.200' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (74, N'Program.cs', N'Void Main()', 19, 13, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_KullaniciSpor_Kullanici". The conflict occurred in database "SporO", table "dbo.Kullanici", column ''Kid''.
The statement has been terminated.', CAST(N'2019-01-18 10:10:32.200' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (75, N'DataAccess.cs', N'Void Hata(System.Exception)', 198, 13, N'No mapping exists from object type Dapper.SqlMapper+DapperRow to a known managed provider native type.', CAST(N'2019-01-18 10:36:10.043' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (76, N'DataAccess.cs', N'Int32 KullaniciSpor(Int32[])', 66, 17, N'No mapping exists from object type Dapper.SqlMapper+DapperRow to a known managed provider native type.', CAST(N'2019-01-18 10:36:10.047' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (77, N'DataAccess.cs', N'Int32 KullaniciKaydet(DAL.Kullanici, Int32[])', 35, 17, N'No mapping exists from object type Dapper.SqlMapper+DapperRow to a known managed provider native type.', CAST(N'2019-01-18 10:36:10.047' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (78, N'BusinessLogic.cs', N'Int32 KullaniciKaydet(System.String, System.String, System.String, System.String, System.String, System.String, System.DateTime, Int32, Int32[])', 70, 17, N'No mapping exists from object type Dapper.SqlMapper+DapperRow to a known managed provider native type.', CAST(N'2019-01-18 10:36:10.050' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (79, N'Kaydol.cs', N'Void btnKaydol_Click(System.Object, System.EventArgs)', 50, 13, N'No mapping exists from object type Dapper.SqlMapper+DapperRow to a known managed provider native type.', CAST(N'2019-01-18 10:36:10.050' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (80, N'Program.cs', N'Void Main()', 19, 13, N'No mapping exists from object type Dapper.SqlMapper+DapperRow to a known managed provider native type.', CAST(N'2019-01-18 10:36:10.053' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (81, N'DataAccess.cs', N'Void Hata(System.Exception)', 198, 13, N'Cannot perform runtime binding on a null reference', CAST(N'2019-01-18 10:56:17.847' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (82, N'DataAccess.cs', N'Int32 KullaniciSpor(Int32[])', 66, 17, N'Cannot perform runtime binding on a null reference', CAST(N'2019-01-18 10:56:17.850' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (83, N'DataAccess.cs', N'Int32 KullaniciKaydet(DAL.Kullanici, Int32[])', 35, 17, N'Cannot perform runtime binding on a null reference', CAST(N'2019-01-18 10:56:17.850' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (84, N'BusinessLogic.cs', N'Int32 KullaniciKaydet(System.String, System.String, System.String, System.String, System.String, System.String, System.DateTime, Int32, Int32[])', 70, 17, N'Cannot perform runtime binding on a null reference', CAST(N'2019-01-18 10:56:17.883' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (85, N'Kaydol.cs', N'Void btnKaydol_Click(System.Object, System.EventArgs)', 50, 13, N'Cannot perform runtime binding on a null reference', CAST(N'2019-01-18 10:56:17.883' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (86, N'Program.cs', N'Void Main()', 19, 13, N'Cannot perform runtime binding on a null reference', CAST(N'2019-01-18 10:56:17.887' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (87, N'DataAccess.cs', N'Void HataVar(System.String)', 211, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:15:47.580' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (88, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 44, 17, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:15:47.633' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (89, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:15:47.633' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (90, N'AnaEkran.cs', N'Void buttonGiris_Click(System.Object, System.EventArgs)', 29, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:15:47.637' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (91, N'Program.cs', N'Void Main()', 21, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:15:47.640' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (92, N'DataAccess.cs', N'Void HataVar(System.String)', 211, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:16:56.170' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (93, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 44, 17, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:16:56.177' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (94, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:16:56.193' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (95, N'AnaEkran.cs', N'Void buttonGiris_Click(System.Object, System.EventArgs)', 29, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:16:56.197' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (96, N'Program.cs', N'Void Main()', 21, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:16:56.240' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (97, N'DataAccess.cs', N'Void HataVar(System.String)', 236, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:58:28.630' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (98, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 44, 17, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:58:28.630' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (99, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:58:28.653' AS DateTime))
GO
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (100, N'AnaEkran.cs', N'Void buttonGiris_Click(System.Object, System.EventArgs)', 32, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:58:28.653' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (101, N'Program.cs', N'Void Main()', 21, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 11:58:28.703' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (102, N'DataAccess.cs', N'Void Hata(System.Exception)', 236, 13, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:11:11.497' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (103, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 90, 29, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:11:11.497' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (104, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:11:11.563' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (105, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:11:11.563' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (106, N'AnaEkran.cs', N'Void buttonGiris_Click(System.Object, System.EventArgs)', 32, 13, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:11:11.567' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (107, N'Program.cs', N'Void Main()', 21, 13, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:11:11.570' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (108, N'DataAccess.cs', N'Void Hata(System.Exception)', 237, 13, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:15:10.673' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (109, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 91, 29, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:15:10.677' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (110, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:15:10.697' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (111, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:15:10.747' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (112, N'AnaEkran.cs', N'Void buttonGiris_Click(System.Object, System.EventArgs)', 32, 13, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:15:10.747' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (113, N'Program.cs', N'Void Main()', 21, 13, N'Procedure or function ''IsLoginUser'' expects parameter ''@kid'', which was not supplied.', CAST(N'2019-01-18 12:15:10.750' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (114, N'DataAccess.cs', N'Void Hata(System.Exception)', 241, 13, N'Invalid column name ''Sid''.', CAST(N'2019-01-18 13:29:45.910' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (115, N'DataAccess.cs', N'Int32 EtkinlikAc(DAL.Etkinlikler)', 155, 17, N'Invalid column name ''Sid''.', CAST(N'2019-01-18 13:29:45.910' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (116, N'BusinessLogic.cs', N'Int32 EtkinlikAc(System.String, Int32, Int32, System.DateTime, Int32, Int32)', 97, 17, N'Invalid column name ''Sid''.', CAST(N'2019-01-18 13:29:45.983' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (117, N'Etkinlik.cs', N'Void btnAc_Click(System.Object, System.EventArgs)', 39, 13, N'Invalid column name ''Sid''.', CAST(N'2019-01-18 13:29:45.987' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (118, N'AnaEkran.cs', N'Void buttonEtkinlik_Click(System.Object, System.EventArgs)', 55, 13, N'Invalid column name ''Sid''.', CAST(N'2019-01-18 13:29:45.987' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (119, N'Program.cs', N'Void Main()', 21, 13, N'Invalid column name ''Sid''.', CAST(N'2019-01-18 13:29:45.990' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (120, N'DataAccess.cs', N'Void Hata(System.Exception)', 241, 13, N'Cannot insert the value NULL into column ''EtkinlikId'', table ''SporO.dbo.Etkinlik''; column does not allow nulls. INSERT fails.
The statement has been terminated.', CAST(N'2019-01-18 13:32:15.490' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (121, N'DataAccess.cs', N'Int32 EtkinlikAc(DAL.Etkinlikler)', 155, 17, N'Cannot insert the value NULL into column ''EtkinlikId'', table ''SporO.dbo.Etkinlik''; column does not allow nulls. INSERT fails.
The statement has been terminated.', CAST(N'2019-01-18 13:32:15.553' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (122, N'BusinessLogic.cs', N'Int32 EtkinlikAc(System.String, Int32, Int32, System.DateTime, Int32, Int32)', 97, 17, N'Cannot insert the value NULL into column ''EtkinlikId'', table ''SporO.dbo.Etkinlik''; column does not allow nulls. INSERT fails.
The statement has been terminated.', CAST(N'2019-01-18 13:32:15.557' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (123, N'Etkinlik.cs', N'Void btnAc_Click(System.Object, System.EventArgs)', 39, 13, N'Cannot insert the value NULL into column ''EtkinlikId'', table ''SporO.dbo.Etkinlik''; column does not allow nulls. INSERT fails.
The statement has been terminated.', CAST(N'2019-01-18 13:32:15.557' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (124, N'AnaEkran.cs', N'Void buttonEtkinlik_Click(System.Object, System.EventArgs)', 55, 13, N'Cannot insert the value NULL into column ''EtkinlikId'', table ''SporO.dbo.Etkinlik''; column does not allow nulls. INSERT fails.
The statement has been terminated.', CAST(N'2019-01-18 13:32:15.560' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (125, N'Program.cs', N'Void Main()', 21, 13, N'Cannot insert the value NULL into column ''EtkinlikId'', table ''SporO.dbo.Etkinlik''; column does not allow nulls. INSERT fails.
The statement has been terminated.', CAST(N'2019-01-18 13:32:15.560' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (126, N'DataAccess.cs', N'Void HataVar(System.String)', 260, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:40:50.930' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (127, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 48, 17, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:40:50.933' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (128, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:40:50.933' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (129, N'Program.cs', N'Void Main()', 21, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:40:50.937' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (130, N'DataAccess.cs', N'Void HataVar(System.String)', 260, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:41:34.483' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (131, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 48, 17, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:41:34.483' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (132, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:41:34.507' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (133, N'Program.cs', N'Void Main()', 21, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:41:34.507' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (134, N'DataAccess.cs', N'Void HataVar(System.String)', 260, 13, N'Bilgiler Hatali', CAST(N'2019-01-18 14:41:39.773' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (135, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 102, 21, N'Bilgiler Hatali', CAST(N'2019-01-18 14:41:39.777' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (136, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 41, 17, N'Bilgiler Hatali', CAST(N'2019-01-18 14:41:39.797' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (137, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-18 14:41:39.800' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (138, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-18 14:41:39.800' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (139, N'DataAccess.cs', N'Void HataVar(System.String)', 260, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:41:50.650' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (140, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 48, 17, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:41:50.653' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (141, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:41:50.677' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (142, N'Program.cs', N'Void Main()', 21, 13, N'Uygun Email değil!!!', CAST(N'2019-01-18 14:41:50.680' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (143, N'DataAccess.cs', N'Void HataVar(System.String)', 260, 13, N'Bilgiler Hatali', CAST(N'2019-01-21 11:07:25.277' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (144, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 102, 21, N'Bilgiler Hatali', CAST(N'2019-01-21 11:07:25.280' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (145, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 41, 17, N'Bilgiler Hatali', CAST(N'2019-01-21 11:07:25.280' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (146, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-21 11:07:25.283' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (147, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-21 11:07:25.283' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (148, N'DataAccess.cs', N'Void HataVar(System.String)', 239, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:47.617' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (149, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 102, 21, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:47.620' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (150, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:47.640' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (151, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:47.643' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (152, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:47.643' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (153, N'DataAccess.cs', N'Void HataVar(System.String)', 239, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:52.117' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (154, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 102, 21, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:52.120' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (155, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:52.140' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (156, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:52.143' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (157, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:52.143' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (158, N'DataAccess.cs', N'Void HataVar(System.String)', 239, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:57.450' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (159, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 102, 21, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:57.450' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (160, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:57.473' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (161, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:57.477' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (162, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 11:14:57.477' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (163, N'DataAccess.cs', N'Void Hata(System.Exception)', 233, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:17:25.483' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (164, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 208, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:17:25.483' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (165, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:17:25.507' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (166, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:17:25.510' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (167, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:17:25.510' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (168, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:17:25.513' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (169, N'DataAccess.cs', N'Void Hata(System.Exception)', 234, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:19:30.230' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (170, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:19:30.233' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (171, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:19:30.253' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (172, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:19:30.263' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (173, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:19:30.267' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (174, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:19:30.267' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (175, N'DataAccess.cs', N'Void Hata(System.Exception)', 234, 13, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 11:20:05.583' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (176, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 11:20:05.620' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (177, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 11:20:05.693' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (178, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 11:20:05.693' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (179, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 11:20:05.777' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (180, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 11:20:05.843' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (181, N'DataAccess.cs', N'Void Hata(System.Exception)', 234, 13, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:23:25.807' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (182, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:23:25.810' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (183, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:23:25.810' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (184, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:23:25.810' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (185, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:23:25.813' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (186, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:23:25.817' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (187, N'DataAccess.cs', N'Void Hata(System.Exception)', 235, 13, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:25:32.827' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (188, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:25:32.830' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (189, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:25:32.850' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (190, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:25:32.853' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (191, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:25:32.853' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (192, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near ''Etkinlik''.', CAST(N'2019-01-22 11:25:32.857' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (193, N'DataAccess.cs', N'Void Hata(System.Exception)', 234, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:27:44.853' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (194, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:27:44.857' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (195, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:27:44.880' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (196, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:27:44.880' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (197, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:27:44.883' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (198, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:27:44.883' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (199, N'DataAccess.cs', N'Void Hata(System.Exception)', 234, 13, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:38:35.800' AS DateTime))
GO
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (200, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:38:35.800' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (201, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:38:35.823' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (202, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:38:35.827' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (203, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:38:35.827' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (204, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:38:35.830' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (205, N'DataAccess.cs', N'Void Hata(System.Exception)', 233, 13, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:39:16.270' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (206, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 208, 17, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:39:16.270' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (207, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:39:16.293' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (208, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:39:16.293' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (209, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:39:16.297' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (210, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near the keyword ''as''.', CAST(N'2019-01-22 11:39:16.297' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (211, N'DataAccess.cs', N'Void Hata(System.Exception)', 232, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:44:51.877' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (212, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:44:51.880' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (213, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:44:51.900' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (214, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:44:51.903' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (215, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:44:51.903' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (216, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 11:44:51.907' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (217, N'DataAccess.cs', N'Void Hata(System.Exception)', 232, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 11:58:57.600' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (218, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 11:58:57.600' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (219, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 11:58:57.623' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (220, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 11:58:57.623' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (221, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 11:58:57.623' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (222, N'Program.cs', N'Void Main()', 21, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 11:58:57.627' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (223, N'DataAccess.cs', N'Void HataVar(System.String)', 245, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:27.487' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (224, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 102, 21, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:27.487' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (225, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:27.490' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (226, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:27.490' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (227, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:27.490' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (228, N'DataAccess.cs', N'Void HataVar(System.String)', 245, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:31.870' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (229, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 102, 21, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:31.950' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (230, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:31.953' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (231, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:31.953' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (232, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:31.957' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (233, N'DataAccess.cs', N'Void HataVar(System.String)', 245, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:36.553' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (234, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 102, 21, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:36.577' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (235, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:36.580' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (236, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:36.583' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (237, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:03:36.587' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (238, N'DataAccess.cs', N'Void Hata(System.Exception)', 232, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:03:42.547' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (239, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:03:42.550' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (240, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:03:42.573' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (241, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:03:42.577' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (242, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:03:42.577' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (243, N'Program.cs', N'Void Main()', 21, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:03:42.580' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (244, N'DataAccess.cs', N'Void Hata(System.Exception)', 232, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:06:15.987' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (245, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 209, 17, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:06:16.097' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (246, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:06:16.100' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (247, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:06:16.100' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (248, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:06:16.103' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (249, N'Program.cs', N'Void Main()', 21, 13, N'The multi-part identifier "e.Sid" could not be bound.
The multi-part identifier "e.MekanID" could not be bound.
The multi-part identifier "e.TipId" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "e.EtkinlikId" could not be bound.
The multi-part identifier "e.Kontenjan" could not be bound.
The multi-part identifier "k.Kid" could not be bound.', CAST(N'2019-01-22 12:06:16.107' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (250, N'DataAccess.cs', N'Void HataVar(System.String)', 246, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:08:33.027' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (251, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 102, 21, N'Bilgiler Hatali', CAST(N'2019-01-22 12:08:33.030' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (252, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-22 12:08:33.030' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (253, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:08:33.030' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (254, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-22 12:08:33.033' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (255, N'DataAccess.cs', N'Void Hata(System.Exception)', 233, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:08:37.320' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (256, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 210, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:08:37.323' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (257, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:08:37.323' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (258, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:08:37.327' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (259, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:08:37.327' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (260, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:08:37.330' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (261, N'DataAccess.cs', N'Void Hata(System.Exception)', 233, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:13:03.143' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (262, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 210, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:13:03.147' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (263, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:13:03.150' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (264, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:13:03.150' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (265, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:13:03.153' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (266, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:13:03.153' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (267, N'DataAccess.cs', N'Void Hata(System.Exception)', 233, 13, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 12:15:13.203' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (268, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 210, 17, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 12:15:13.203' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (269, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 12:15:13.233' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (270, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 12:15:13.237' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (271, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 12:15:13.237' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (272, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near the keyword ''by''.', CAST(N'2019-01-22 12:15:13.240' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (273, N'DataAccess.cs', N'Void Hata(System.Exception)', 235, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:18:25.360' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (274, N'DataAccess.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 212, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:18:25.363' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (275, N'BusinessLogic.cs', N'System.Collections.Generic.List`1[DAL.EtkinlikGoster] EtkinlikAl()', 141, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:18:25.363' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (276, N'AnaEkran.cs', N'Void AnaEkran_Load(System.Object, System.EventArgs)', 30, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:18:25.367' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (277, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:18:25.367' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (278, N'Program.cs', N'Void Main()', 21, 13, N'Incorrect syntax near ''isActive''.', CAST(N'2019-01-22 12:18:25.367' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (279, N'DataAccess.cs', N'Void Hata(System.Exception)', 246, 13, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:24.237' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (280, N'DataAccess.cs', N'Int32 Cikis(Int32, Int32)', 308, 17, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:24.237' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (281, N'BusinessLogic.cs', N'Int32 Cikis(Int32, Int32)', 167, 13, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:24.240' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (282, N'AnaEkran.cs', N'Void buttonEtkinlikCik_Click(System.Object, System.EventArgs)', 95, 13, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:24.240' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (283, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:24.240' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (284, N'Program.cs', N'Void Main()', 21, 13, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:24.243' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (285, N'DataAccess.cs', N'Void Hata(System.Exception)', 246, 13, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:35.947' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (286, N'DataAccess.cs', N'Int32 Cikis(Int32, Int32)', 308, 17, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:35.950' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (287, N'BusinessLogic.cs', N'Int32 Cikis(Int32, Int32)', 167, 13, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:35.950' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (288, N'AnaEkran.cs', N'Void buttonEtkinlikCik_Click(System.Object, System.EventArgs)', 95, 13, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:35.950' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (289, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 17, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:35.953' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (290, N'Program.cs', N'Void Main()', 21, 13, N'Invalid object name ''Katilan''.', CAST(N'2019-01-23 11:06:35.953' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (291, N'DataAccessLinq.cs', N'Void Hata(System.Exception)', 169, 13, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (292, N'DataAccessLinq.cs', N'Int32 Katil(Int32, Int32)', 157, 17, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (293, N'AnaEkran.cs', N'Void buttonKatil_Click(System.Object, System.EventArgs)', 75, 13, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (294, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 55, 17, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (295, N'Program.cs', N'Void Main()', 21, 13, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (296, N'DataAccessLinq.cs', N'Void Hata(System.Exception)', 169, 13, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (297, N'DataAccessLinq.cs', N'Int32 Katil(Int32, Int32)', 157, 17, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (298, N'AnaEkran.cs', N'Void buttonKatil_Click(System.Object, System.EventArgs)', 75, 13, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (299, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 55, 17, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
GO
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (300, N'Program.cs', N'Void Main()', 21, 13, N'Can''t perform Create, Update, or Delete operations on ''Table(Katilanlar)'' because it has no primary key.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (301, N'DataAccess.cs', N'Void Hata(System.Exception)', 247, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:33:20.727' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (302, N'DataAccess.cs', N'Int32 Katil(Int32, Int32)', 283, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:33:20.730' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (303, N'BusinessLogic.cs', N'Int32 Katil(Int32, Int32)', 173, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:33:20.750' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (304, N'AnaEkran.cs', N'Void buttonKatil_Click(System.Object, System.EventArgs)', 63, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:33:20.750' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (305, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 55, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:33:20.753' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (306, N'Program.cs', N'Void Main()', 21, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:33:20.753' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (307, N'DataAccess.cs', N'Void Hata(System.Exception)', 247, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:35:01.333' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (308, N'DataAccess.cs', N'Int32 Katil(Int32, Int32)', 283, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:35:01.333' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (309, N'BusinessLogic.cs', N'Int32 Katil(Int32, Int32)', 173, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:35:01.337' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (310, N'AnaEkran.cs', N'Void buttonKatil_Click(System.Object, System.EventArgs)', 63, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:35:01.337' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (311, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 55, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:35:01.337' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (312, N'Program.cs', N'Void Main()', 21, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:35:01.340' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (313, N'DataAccess.cs', N'Void Hata(System.Exception)', 247, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:36:26.670' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (314, N'DataAccess.cs', N'Int32 Katil(Int32, Int32)', 283, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:36:26.673' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (315, N'BusinessLogic.cs', N'Int32 Katil(Int32, Int32)', 173, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:36:26.673' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (316, N'AnaEkran.cs', N'Void buttonKatil_Click(System.Object, System.EventArgs)', 63, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:36:26.677' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (317, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 55, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:36:26.677' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (318, N'Program.cs', N'Void Main()', 21, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:36:26.680' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (319, N'DataAccess.cs', N'Void Hata(System.Exception)', 247, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:38:26.377' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (320, N'DataAccess.cs', N'Int32 Katil(Int32, Int32)', 283, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:38:26.377' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (321, N'BusinessLogic.cs', N'Int32 Katil(Int32, Int32)', 173, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:38:26.460' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (322, N'AnaEkran.cs', N'Void buttonKatil_Click(System.Object, System.EventArgs)', 60, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:38:26.460' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (323, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 55, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:38:26.463' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (324, N'Program.cs', N'Void Main()', 21, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:38:26.467' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (325, N'DataAccess.cs', N'Void Hata(System.Exception)', 247, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:39:37.897' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (326, N'DataAccess.cs', N'Int32 Katil(Int32, Int32)', 283, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:39:37.900' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (327, N'BusinessLogic.cs', N'Int32 Katil(Int32, Int32)', 173, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:39:38.170' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (328, N'AnaEkran.cs', N'Void buttonKatil_Click(System.Object, System.EventArgs)', 60, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:39:38.170' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (329, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 55, 17, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:39:38.173' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (330, N'Program.cs', N'Void Main()', 21, 13, N'Violation of PRIMARY KEY constraint ''PK_Katilanlar''. Cannot insert duplicate key in object ''dbo.Katilanlar''. The duplicate key value is (10, 1).
The statement has been terminated.', CAST(N'2019-01-24 11:39:38.173' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (331, N'DataAccess.cs', N'Void HataVar(System.String)', 259, 13, N'Uygun Email değil!!!', CAST(N'2019-01-25 12:54:38.480' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (332, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 43, 17, N'Uygun Email değil!!!', CAST(N'2019-01-25 12:54:38.527' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (333, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Uygun Email değil!!!', CAST(N'2019-01-25 12:54:38.530' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (334, N'Program.cs', N'Void Main()', 21, 13, N'Uygun Email değil!!!', CAST(N'2019-01-25 12:54:38.583' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (335, N'DataAccess.cs', N'Void HataVar(System.String)', 259, 13, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:19.300' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (336, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 111, 21, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:19.307' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (337, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:19.310' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (338, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:19.310' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (339, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:19.313' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (340, N'DataAccess.cs', N'Void HataVar(System.String)', 259, 13, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:21.303' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (341, N'DataAccess.cs', N'Int32 LoginKontrol(DAL.Kullanici)', 111, 21, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:21.307' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (342, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:21.307' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (343, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:21.310' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (344, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', CAST(N'2019-01-25 12:59:21.313' AS DateTime))
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (345, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (346, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (347, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (348, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (349, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (350, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (351, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (352, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (353, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (354, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (355, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (356, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (357, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (358, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (359, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (360, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (361, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (362, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (363, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (364, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (365, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (366, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (367, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (368, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (369, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (370, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (371, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (372, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (373, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (374, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (375, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (376, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (377, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (378, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (379, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (380, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (381, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (382, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (383, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (384, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (385, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (386, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (387, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (388, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (389, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (390, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (391, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (392, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (393, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (394, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (395, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (396, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (397, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (398, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (399, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
GO
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (400, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (401, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (402, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (403, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (404, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (405, N'Linq.cs', N'Void HataVar(System.String)', 466, 13, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (406, N'Linq.cs', N'Int32 LoginKontrol(System.String, System.String)', 125, 21, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (407, N'Giris.cs', N'Void LinqLoginKontrol()', 109, 13, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (408, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 13, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (409, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (410, N'Linq.cs', N'Void HataVar(System.String)', 466, 13, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (411, N'Linq.cs', N'Int32 LoginKontrol(System.String, System.String)', 125, 21, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (412, N'Giris.cs', N'Void LinqLoginKontrol()', 109, 13, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (413, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 37, 13, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (414, N'Program.cs', N'Void Main()', 21, 13, N'Bilgiler Hatali', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (415, N'DataAccessLayer.cs', N'Void HataVar(System.String)', 313, 13, N'Uygun Email değil!!!', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (416, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 43, 17, N'Uygun Email değil!!!', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (417, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'Uygun Email değil!!!', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (418, N'Program.cs', N'Void Main()', 21, 13, N'Uygun Email değil!!!', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (419, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (420, N'DataAccessLayer.cs', N'Void Hata(System.Exception)', 293, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (421, N'DataAccessLayer.cs', N'Int32 LoginKontrol(DalEntity.Kullanici)', 67, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (422, N'BusinessLogic.cs', N'Int32 LoginKontrol(System.String, System.String)', 39, 17, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (423, N'Giris.cs', N'Void btnGiris_Click(System.Object, System.EventArgs)', 30, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
INSERT [dbo].[HataLoglari] ([id], [DosyaAdi], [MethodAdi], [LineNumber], [ColumnNumber], [Message], [trh]) VALUES (424, N'Program.cs', N'Void Main()', 21, 13, N'An error occurred while starting a transaction on the provider connection. See the inner exception for details.', NULL)
SET IDENTITY_INSERT [dbo].[HataLoglari] OFF
SET IDENTITY_INSERT [dbo].[Ilceler] ON 

INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (1, N'SEYHAN', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (2, N'CEYHAN', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (3, N'FEKE', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (4, N'KARAİSALI', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (5, N'KARATAŞ', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (6, N'KOZAN', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (7, N'POZANTI', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (8, N'SAİMBEYLİ', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (9, N'TUFANBEYLİ', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (10, N'YUMURTALIK', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (11, N'YÜREĞİR', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (12, N'ALADAĞ', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (13, N'İMAMOĞLU', 1)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (14, N'ADIYAMAN MERKEZ', 2)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (15, N'BESNİ', 2)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (16, N'ÇELİKHAN', 2)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (17, N'GERGER', 2)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (18, N'GÖLBAŞI', 2)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (19, N'KAHTA', 2)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (20, N'SAMSAT', 2)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (21, N'SİNCİK', 2)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (22, N'TUT', 2)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (23, N'AFYONMERKEZ', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (24, N'BOLVADİN', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (25, N'ÇAY', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (26, N'DAZKIRI', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (27, N'DİNAR', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (28, N'EMİRDAĞ', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (29, N'İHSANİYE', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (30, N'SANDIKLI', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (31, N'SİNANPAŞA', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (32, N'SULDANDAĞI', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (33, N'ŞUHUT', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (34, N'BAŞMAKÇI', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (35, N'BAYAT', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (36, N'İŞCEHİSAR', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (37, N'ÇOBANLAR', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (38, N'EVCİLER', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (39, N'HOCALAR', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (40, N'KIZILÖREN', 3)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (41, N'AKSARAY MERKEZ', 68)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (42, N'ORTAKÖY', 68)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (43, N'AĞAÇÖREN', 68)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (44, N'GÜZELYURT', 68)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (45, N'SARIYAHŞİ', 68)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (46, N'ESKİL', 68)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (47, N'GÜLAĞAÇ', 68)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (48, N'AMASYA MERKEZ', 5)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (49, N'GÖYNÜÇEK', 5)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (50, N'GÜMÜŞHACIKÖYÜ', 5)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (51, N'MERZİFON', 5)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (52, N'SULUOVA', 5)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (53, N'TAŞOVA', 5)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (54, N'HAMAMÖZÜ', 5)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (55, N'ALTINDAĞ', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (56, N'AYAS', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (57, N'BALA', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (58, N'BEYPAZARI', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (59, N'ÇAMLIDERE', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (60, N'ÇANKAYA', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (61, N'ÇUBUK', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (62, N'ELMADAĞ', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (63, N'GÜDÜL', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (64, N'HAYMANA', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (65, N'KALECİK', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (66, N'KIZILCAHAMAM', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (67, N'NALLIHAN', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (68, N'POLATLI', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (69, N'ŞEREFLİKOÇHİSAR', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (70, N'YENİMAHALLE', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (71, N'GÖLBAŞI', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (72, N'KEÇİÖREN', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (73, N'MAMAK', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (74, N'SİNCAN', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (75, N'KAZAN', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (76, N'AKYURT', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (77, N'ETİMESGUT', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (78, N'EVREN', 6)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (79, N'ANSEKİ', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (80, N'ALANYA', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (81, N'ANTALYA MERKEZİ', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (82, N'ELMALI', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (83, N'FİNİKE', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (84, N'GAZİPAŞA', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (85, N'GÜNDOĞMUŞ', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (86, N'KAŞ', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (87, N'KORKUTELİ', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (88, N'KUMLUCA', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (89, N'MANAVGAT', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (90, N'SERİK', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (91, N'DEMRE', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (92, N'İBRADI', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (93, N'KEMER', 7)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (94, N'ARDAHAN MERKEZ', 75)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (95, N'GÖLE', 75)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (96, N'ÇILDIR', 75)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (97, N'HANAK', 75)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (98, N'POSOF', 75)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (99, N'DAMAL', 75)
GO
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (100, N'ARDANUÇ', 8)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (101, N'ARHAVİ', 8)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (102, N'ARTVİN MERKEZ', 8)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (103, N'BORÇKA', 8)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (104, N'HOPA', 8)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (105, N'ŞAVŞAT', 8)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (106, N'YUSUFELİ', 8)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (107, N'MURGUL', 8)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (108, N'AYDIN MERKEZ', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (109, N'BOZDOĞAN', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (110, N'ÇİNE', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (111, N'GERMENCİK', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (112, N'KARACASU', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (113, N'KOÇARLI', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (114, N'KUŞADASI', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (115, N'KUYUCAK', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (116, N'NAZİLLİ', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (117, N'SÖKE', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (118, N'SULTANHİSAR', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (119, N'YENİPAZAR', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (120, N'BUHARKENT', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (121, N'İNCİRLİOVA', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (122, N'KARPUZLU', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (123, N'KÖŞK', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (124, N'DİDİM', 9)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (125, N'AĞRI MERKEZ', 4)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (126, N'DİYADİN', 4)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (127, N'DOĞUBEYAZIT', 4)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (128, N'ELEŞKİRT', 4)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (129, N'HAMUR', 4)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (130, N'PATNOS', 4)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (131, N'TAŞLIÇAY', 4)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (132, N'TUTAK', 4)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (133, N'AYVALIK', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (134, N'BALIKESİR MERKEZ', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (135, N'BALYA', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (136, N'BANDIRMA', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (137, N'BİGADİÇ', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (138, N'BURHANİYE', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (139, N'DURSUNBEY', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (140, N'EDREMİT', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (141, N'ERDEK', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (142, N'GÖNEN', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (143, N'HAVRAN', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (144, N'İVRİNDİ', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (145, N'KEPSUT', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (146, N'MANYAS', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (147, N'SAVAŞTEPE', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (148, N'SINDIRGI', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (149, N'SUSURLUK', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (150, N'MARMARA', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (151, N'GÖMEÇ', 10)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (152, N'BARTIN MERKEZ', 74)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (153, N'KURUCAŞİLE', 74)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (154, N'ULUS', 74)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (155, N'AMASRA', 74)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (156, N'BATMAN MERKEZ', 72)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (157, N'BEŞİRİ', 72)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (158, N'GERCÜŞ', 72)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (159, N'KOZLUK', 72)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (160, N'SASON', 72)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (161, N'HASANKEYF', 72)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (162, N'BAYBURT MERKEZ', 69)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (163, N'AYDINTEPE', 69)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (164, N'DEMİRÖZÜ', 69)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (165, N'BOLU MERKEZ', 14)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (166, N'GEREDE', 14)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (167, N'GÖYNÜK', 14)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (168, N'KIBRISCIK', 14)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (169, N'MENGEN', 14)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (170, N'MUDURNU', 14)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (171, N'SEBEN', 14)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (172, N'DÖRTDİVAN', 14)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (173, N'YENİÇAĞA', 14)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (174, N'AĞLASUN', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (175, N'BUCAK', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (176, N'BURDUR MERKEZ', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (177, N'GÖLHİSAR', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (178, N'TEFENNİ', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (179, N'YEŞİLOVA', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (180, N'KARAMANLI', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (181, N'KEMER', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (182, N'ALTINYAYLA', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (183, N'ÇAVDIR', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (184, N'ÇELTİKÇİ', 15)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (185, N'GEMLİK', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (186, N'İNEGÖL', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (187, N'İZNİK', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (188, N'KARACABEY', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (189, N'KELES', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (190, N'MUDANYA', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (191, N'MUSTAFA K. PAŞA', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (192, N'ORHANELİ', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (193, N'ORHANGAZİ', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (194, N'YENİŞEHİR', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (195, N'BÜYÜK ORHAN', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (196, N'HARMANCIK', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (197, N'NÜLİFER', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (198, N'OSMAN GAZİ', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (199, N'YILDIRIM', 16)
GO
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (200, N'GÜRSU', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (201, N'KESTEL', 16)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (202, N'BİLECİK MERKEZ', 11)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (203, N'BOZÜYÜK', 11)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (204, N'GÖLPAZARI', 11)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (205, N'OSMANELİ', 11)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (206, N'PAZARYERİ', 11)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (207, N'SÖĞÜT', 11)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (208, N'YENİPAZAR', 11)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (209, N'İNHİSAR', 11)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (210, N'BİNGÖL MERKEZ', 12)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (211, N'GENÇ', 12)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (212, N'KARLIOVA', 12)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (213, N'KİGI', 12)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (214, N'SOLHAN', 12)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (215, N'ADAKLI', 12)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (216, N'YAYLADERE', 12)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (217, N'YEDİSU', 12)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (218, N'ADİLCEVAZ', 13)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (219, N'AHLAT', 13)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (220, N'BİTLİS MERKEZ', 13)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (221, N'HİZAN', 13)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (222, N'MUTKİ', 13)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (223, N'TATVAN', 13)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (224, N'GÜROYMAK', 13)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (225, N'DENİZLİ MERKEZ', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (226, N'ACIPAYAM', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (227, N'BULDAN', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (228, N'ÇAL', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (229, N'ÇAMELİ', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (230, N'ÇARDAK', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (231, N'ÇİVRİL', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (232, N'GÜNEY', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (233, N'KALE', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (234, N'SARAYKÖY', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (235, N'TAVAS', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (236, N'BABADAĞ', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (237, N'BEKİLLİ', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (238, N'HONAZ', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (239, N'SERİNHİSAR', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (240, N'AKKÖY', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (241, N'BAKLAN', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (242, N'BEYAĞAÇ', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (243, N'BOZKURT', 20)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (244, N'DÜZCE MERKEZ', 81)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (245, N'AKÇAKOCA', 81)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (246, N'YIĞILCA', 81)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (247, N'CUMAYERİ', 81)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (248, N'GÖLYAKA', 81)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (249, N'ÇİLİMLİ', 81)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (250, N'GÜMÜŞOVA', 81)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (251, N'KAYNAŞLI', 81)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (252, N'DİYARBAKIR MERKEZ', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (253, N'BİSMİL', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (254, N'ÇERMİK', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (255, N'ÇINAR', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (256, N'ÇÜNGÜŞ', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (257, N'DİCLE', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (258, N'ERGANİ', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (259, N'HANİ', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (260, N'HAZRO', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (261, N'KULP', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (262, N'LİCE', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (263, N'SİLVAN', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (264, N'EĞİL', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (265, N'KOCAKÖY', 21)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (266, N'EDİRNE MERKEZ', 22)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (267, N'ENEZ', 22)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (268, N'HAVSA', 22)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (269, N'İPSALA', 22)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (270, N'KEŞAN', 22)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (271, N'LALAPAŞA', 22)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (272, N'MERİÇ', 22)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (273, N'UZUNKÖPRÜ', 22)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (274, N'SÜLOĞLU', 22)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (275, N'ELAZIĞ MERKEZ', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (276, N'AĞIN', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (277, N'BASKİL', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (278, N'KARAKOÇAN', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (279, N'KEBAN', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (280, N'MADEN', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (281, N'PALU', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (282, N'SİVRİCE', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (283, N'ARICAK', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (284, N'KOVANCILAR', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (285, N'ALACAKAYA', 23)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (286, N'ERZURUM MERKEZ', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (287, N'PALANDÖKEN', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (288, N'AŞKALE', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (289, N'ÇAT', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (290, N'HINIS', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (291, N'HORASAN', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (292, N'OLTU', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (293, N'İSPİR', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (294, N'KARAYAZI', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (295, N'NARMAN', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (296, N'OLUR', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (297, N'PASİNLER', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (298, N'ŞENKAYA', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (299, N'TEKMAN', 25)
GO
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (300, N'TORTUM', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (301, N'KARAÇOBAN', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (302, N'UZUNDERE', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (303, N'PAZARYOLU', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (304, N'ILICA', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (305, N'KÖPRÜKÖY', 25)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (306, N'ÇAYIRLI', 24)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (307, N'ERZİNCAN MERKEZ', 24)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (308, N'İLİÇ', 24)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (309, N'KEMAH', 24)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (310, N'KEMALİYE', 24)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (311, N'REFAHİYE', 24)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (312, N'TERCAN', 24)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (313, N'OTLUKBELİ', 24)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (314, N'ESKİŞEHİR MERKEZ', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (315, N'ÇİFTELER', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (316, N'MAHMUDİYE', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (317, N'MİHALIÇLIK', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (318, N'SARICAKAYA', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (319, N'SEYİTGAZİ', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (320, N'SİVRİHİSAR', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (321, N'ALPU', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (322, N'BEYLİKOVA', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (323, N'İNÖNÜ', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (324, N'GÜNYÜZÜ', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (325, N'HAN', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (326, N'MİHALGAZİ', 26)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (327, N'ARABAN', 27)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (328, N'İSLAHİYE', 27)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (329, N'NİZİP', 27)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (330, N'OĞUZELİ', 27)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (331, N'YAVUZELİ', 27)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (332, N'ŞAHİNBEY', 27)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (333, N'ŞEHİT KAMİL', 27)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (334, N'KARKAMIŞ', 27)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (335, N'NURDAĞI', 27)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (336, N'GÜMÜŞHANE MERKEZ', 29)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (337, N'KELKİT', 29)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (338, N'ŞİRAN', 29)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (339, N'TORUL', 29)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (340, N'KÖSE', 29)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (341, N'KÜRTÜN', 29)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (342, N'ALUCRA', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (343, N'BULANCAK', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (344, N'DERELİ', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (345, N'ESPİYE', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (346, N'EYNESİL', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (347, N'GİRESUN MERKEZ', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (348, N'GÖRELE', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (349, N'KEŞAP', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (350, N'ŞEBİNKARAHİSAR', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (351, N'TİREBOLU', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (352, N'PİPAZİZ', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (353, N'YAĞLIDERE', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (354, N'ÇAMOLUK', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (355, N'ÇANAKÇI', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (356, N'DOĞANKENT', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (357, N'GÜCE', 28)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (358, N'HAKKARİ MERKEZ', 30)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (359, N'ÇUKURCA', 30)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (360, N'ŞEMDİNLİ', 30)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (361, N'YÜKSEKOVA', 30)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (362, N'ALTINÖZÜ', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (363, N'DÖRTYOL', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (364, N'HATAY MERKEZ', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (365, N'HASSA', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (366, N'İSKENDERUN', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (367, N'KIRIKHAN', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (368, N'REYHANLI', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (369, N'SAMANDAĞ', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (370, N'YAYLADAĞ', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (371, N'ERZİN', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (372, N'BELEN', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (373, N'KUMLU', 31)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (374, N'ISPARTA MERKEZ', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (375, N'ATABEY', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (376, N'KEÇİBORLU', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (377, N'EĞİRDİR', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (378, N'GELENDOST', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (379, N'SİNİRKENT', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (380, N'ULUBORLU', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (381, N'YALVAÇ', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (382, N'AKSU', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (383, N'GÖNEN', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (384, N'YENİŞAR BADEMLİ', 32)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (385, N'IĞDIR MERKEZ', 76)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (386, N'ARALIK', 76)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (387, N'TUZLUCA', 76)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (388, N'KARAKOYUNLU', 76)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (389, N'AFŞİN', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (390, N'ANDIRIN', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (391, N'ELBİSTAN', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (392, N'GÖKSUN', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (393, N'KAHRAMANMARAŞ MERKEZ', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (394, N'PAZARCIK', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (395, N'TÜRKOĞLU', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (396, N'ÇAĞLAYANCERİT', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (397, N'EKİNÖZÜ', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (398, N'NURHAK', 46)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (399, N'EFLANİ', 78)
GO
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (400, N'ESKİPAZAR', 78)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (401, N'KARABÜK MERKEZ', 78)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (402, N'OVACIK', 78)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (403, N'SAFRANBOLU', 78)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (404, N'YENİCE', 78)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (405, N'ERMENEK', 70)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (406, N'KARAMAN MERKEZ', 70)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (407, N'AYRANCI', 70)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (408, N'KAZIMKARABEKİR', 70)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (409, N'BAŞYAYLA', 70)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (410, N'SARIVELİLER', 70)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (411, N'KARS MERKEZ', 36)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (412, N'ARPAÇAY', 36)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (413, N'DİGOR', 36)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (414, N'KAĞIZMAN', 36)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (415, N'SARIKAMIŞ', 36)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (416, N'SELİM', 36)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (417, N'SUSUZ', 36)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (418, N'AKYAKA', 36)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (419, N'ABANA', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (420, N'KASTAMONU MERKEZ', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (421, N'ARAÇ', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (422, N'AZDAVAY', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (423, N'BOZKURT', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (424, N'CİDE', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (425, N'ÇATALZEYTİN', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (426, N'DADAY', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (427, N'DEVREKANİ', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (428, N'İNEBOLU', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (429, N'KÜRE', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (430, N'TAŞKÖPRÜ', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (431, N'TOSYA', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (432, N'İHSANGAZİ', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (433, N'PINARBAŞI', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (434, N'ŞENPAZAR', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (435, N'AĞLI', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (436, N'DOĞANYURT', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (437, N'HANÖNÜ', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (438, N'SEYDİLER', 37)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (439, N'BÜNYAN', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (440, N'DEVELİ', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (441, N'FELAHİYE', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (442, N'İNCESU', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (443, N'PINARBAŞI', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (444, N'SARIOĞLAN', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (445, N'SARIZ', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (446, N'TOMARZA', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (447, N'YAHYALI', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (448, N'YEŞİLHİSAR', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (449, N'AKKIŞLA', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (450, N'TALAS', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (451, N'KOCASİNAN', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (452, N'MELİKGAZİ', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (453, N'HACILAR', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (454, N'ÖZVATAN', 38)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (455, N'DERİCE', 71)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (456, N'KESKİN', 71)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (457, N'KIRIKKALE MERKEZ', 71)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (458, N'SALAK YURT', 71)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (459, N'BAHŞİLİ', 71)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (460, N'BALIŞEYH', 71)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (461, N'ÇELEBİ', 71)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (462, N'KARAKEÇİLİ', 71)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (463, N'YAHŞİHAN', 71)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (464, N'KIRKKLARELİ MERKEZ', 39)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (465, N'BABAESKİ', 39)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (466, N'DEMİRKÖY', 39)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (467, N'KOFÇAY', 39)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (468, N'LÜLEBURGAZ', 39)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (469, N'VİZE', 39)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (470, N'KIRŞEHİR MERKEZ', 40)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (471, N'ÇİÇEKDAĞI', 40)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (472, N'KAMAN', 40)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (473, N'MUCUR', 40)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (474, N'AKPINAR', 40)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (475, N'AKÇAKENT', 40)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (476, N'BOZTEPE', 40)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (477, N'KOCAELİ MERKEZ', 41)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (478, N'GEBZE', 41)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (479, N'GÖLCÜK', 41)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (480, N'KANDIRA', 41)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (481, N'KARAMÜRSEL', 41)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (482, N'KÖRFEZ', 41)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (483, N'DERİNCE', 41)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (484, N'KONYA MERKEZ', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (485, N'AKŞEHİR', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (486, N'BEYŞEHİR', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (487, N'BOZKIR', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (488, N'CİHANBEYLİ', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (489, N'ÇUMRA', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (490, N'DOĞANHİSAR', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (491, N'EREĞLİ', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (492, N'HADİM', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (493, N'ILGIN', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (494, N'KADINHANI', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (495, N'KARAPINAR', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (496, N'KULU', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (497, N'SARAYÖNÜ', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (498, N'SEYDİŞEHİR', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (499, N'YUNAK', 42)
GO
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (500, N'AKÖREN', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (501, N'ALTINEKİN', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (502, N'DEREBUCAK', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (503, N'HÜYÜK', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (504, N'KARATAY', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (505, N'MERAM', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (506, N'SELÇUKLU', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (507, N'TAŞKENT', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (508, N'AHIRLI', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (509, N'ÇELTİK', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (510, N'DERBENT', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (511, N'EMİRGAZİ', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (512, N'GÜNEYSINIR', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (513, N'HALKAPINAR', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (514, N'TUZLUKÇU', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (515, N'YALIHÜYÜK', 42)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (516, N'KÜTAHYA  MERKEZ', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (517, N'ALTINTAŞ', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (518, N'DOMANİÇ', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (519, N'EMET', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (520, N'GEDİZ', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (521, N'SİMAV', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (522, N'TAVŞANLI', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (523, N'ASLANAPA', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (524, N'DUMLUPINAR', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (525, N'HİSARCIK', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (526, N'ŞAPHANE', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (527, N'ÇAVDARHİSAR', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (528, N'PAZARLAR', 43)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (529, N'KİLİS MERKEZ', 79)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (530, N'ELBEYLİ', 79)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (531, N'MUSABEYLİ', 79)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (532, N'POLATELİ', 79)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (533, N'MALATYA MERKEZ', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (534, N'AKÇADAĞ', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (535, N'ARAPGİR', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (536, N'ARGUVAN', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (537, N'DARENDE', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (538, N'DOĞANŞEHİR', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (539, N'HEKİMHAN', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (540, N'PÜTÜRGE', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (541, N'YEŞİLYURT', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (542, N'BATTALGAZİ', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (543, N'DOĞANYOL', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (544, N'KALE', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (545, N'KULUNCAK', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (546, N'YAZIHAN', 44)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (547, N'AKHİSAR', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (548, N'ALAŞEHİR', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (549, N'DEMİRCİ', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (550, N'GÖRDES', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (551, N'KIRKAĞAÇ', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (552, N'KULA', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (553, N'MANİSA MERKEZ', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (554, N'SALİHLİ', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (555, N'SARIGÖL', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (556, N'SARUHANLI', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (557, N'SELENDİ', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (558, N'SOMA', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (559, N'TURGUTLU', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (560, N'AHMETLİ', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (561, N'GÖLMARMARA', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (562, N'KÖPRÜBAŞI', 45)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (563, N'DERİK', 47)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (564, N'KIZILTEPE', 47)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (565, N'MARDİN MERKEZ', 47)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (566, N'MAZIDAĞI', 47)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (567, N'MİDYAT', 47)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (568, N'NUSAYBİN', 47)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (569, N'ÖMERLİ', 47)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (570, N'SAVUR', 47)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (571, N'YEŞİLLİ', 47)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (572, N'MERSİN MERKEZ', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (573, N'ANAMUR', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (574, N'ERDEMLİ', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (575, N'GÜLNAR', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (576, N'MUT', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (577, N'SİLİFKE', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (578, N'TARSUS', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (579, N'AYDINCIK', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (580, N'BOZYAZI', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (581, N'ÇAMLIYAYLA', 33)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (582, N'BODRUM', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (583, N'DATÇA', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (584, N'FETHİYE', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (585, N'KÖYCEĞİZ', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (586, N'MARMARİS', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (587, N'MİLAS', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (588, N'MUĞLA MERKEZ', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (589, N'ULA', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (590, N'YATAĞAN', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (591, N'DALAMAN', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (592, N'KAVAKLI DERE', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (593, N'ORTACA', 48)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (594, N'BULANIK', 49)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (595, N'MALAZGİRT', 49)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (596, N'MUŞ MERKEZ', 49)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (597, N'VARTO', 49)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (598, N'HASKÖY', 49)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (599, N'KORKUT', 49)
GO
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (600, N'NEVŞEHİR MERKEZ', 50)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (601, N'AVANOS', 50)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (602, N'DERİNKUYU', 50)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (603, N'GÜLŞEHİR', 50)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (604, N'HACIBEKTAŞ', 50)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (605, N'KOZAKLI', 50)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (606, N'ÜRGÜP', 50)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (607, N'ACIGÖL', 50)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (608, N'NİĞDE MERKEZ', 51)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (609, N'BOR', 51)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (610, N'ÇAMARDI', 51)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (611, N'ULUKIŞLA', 51)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (612, N'ALTUNHİSAR', 51)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (613, N'ÇİFTLİK', 51)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (614, N'AKKUŞ', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (615, N'AYBASTI', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (616, N'FATSA', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (617, N'GÖLKÖY', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (618, N'KORGAN', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (619, N'KUMRU', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (620, N'MESUDİYE', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (621, N'ORDU MERKEZ', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (622, N'PERŞEMBE', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (623, N'ULUBEY', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (624, N'ÜNYE', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (625, N'GÜLYALI', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (626, N'GÜRGENTEPE', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (627, N'ÇAMAŞ', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (628, N'ÇATALPINAR', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (629, N'ÇAYBAŞI', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (630, N'İKİZCE', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (631, N'KABADÜZ', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (632, N'KABATAŞ', 52)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (633, N'BAHÇE', 80)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (634, N'KADİRLİ', 80)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (635, N'OSMANİYE MERKEZ', 80)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (636, N'DÜZİÇİ', 80)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (637, N'HASANBEYLİ', 80)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (638, N'SUMBAŞ', 80)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (639, N'TOPRAKKALE', 80)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (640, N'RİZE MERKEZ', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (641, N'ARDEŞEN', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (642, N'ÇAMLIHEMŞİN', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (643, N'ÇAYELİ', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (644, N'FINDIKLI', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (645, N'İKİZDERE', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (646, N'KALKANDERE', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (647, N'PAZAR', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (648, N'GÜNEYSU', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (649, N'DEREPAZARI', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (650, N'HEMŞİN', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (651, N'İYİDERE', 53)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (652, N'AKYAZI', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (653, N'GEYVE', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (654, N'HENDEK', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (655, N'KARASU', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (656, N'KAYNARCA', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (657, N'SAKARYA MERKEZ', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (658, N'PAMUKOVA', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (659, N'TARAKLI', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (660, N'FERİZLİ', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (661, N'KARAPÜRÇEK', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (662, N'SÖĞÜTLÜ', 54)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (663, N'ALAÇAM', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (664, N'BAFRA', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (665, N'ÇARŞAMBA', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (666, N'HAVZA', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (667, N'KAVAK', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (668, N'LADİK', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (669, N'SAMSUN MERKEZ', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (670, N'TERME', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (671, N'VEZİRKÖPRÜ', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (672, N'ASARCIK', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (673, N'ONDOKUZMAYIS', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (674, N'SALIPAZARI', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (675, N'TEKKEKÖY', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (676, N'AYVACIK', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (677, N'YAKAKENT', 55)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (678, N'AYANCIK', 57)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (679, N'BOYABAT', 57)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (680, N'SİNOP MERKEZ', 57)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (681, N'DURAĞAN', 57)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (682, N'ERGELEK', 57)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (683, N'GERZE', 57)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (684, N'TÜRKELİ', 57)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (685, N'DİKMEN', 57)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (686, N'SARAYDÜZÜ', 57)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (687, N'DİVRİĞİ', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (688, N'GEMEREK', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (689, N'GÜRÜN', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (690, N'HAFİK', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (691, N'İMRANLI', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (692, N'KANGAL', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (693, N'KOYUL HİSAR', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (694, N'SİVAS MERKEZ', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (695, N'SU ŞEHRİ', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (696, N'ŞARKIŞLA', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (697, N'YILDIZELİ', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (698, N'ZARA', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (699, N'AKINCILAR', 58)
GO
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (700, N'ALTINYAYLA', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (701, N'DOĞANŞAR', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (702, N'GÜLOVA', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (703, N'ULAŞ', 58)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (704, N'BAYKAN', 56)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (705, N'ERUH', 56)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (706, N'KURTALAN', 56)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (707, N'PERVARİ', 56)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (708, N'SİİRT MERKEZ', 56)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (709, N'ŞİRVARİ', 56)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (710, N'AYDINLAR', 56)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (711, N'TEKİRDAĞ MERKEZ', 59)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (712, N'ÇERKEZKÖY', 59)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (713, N'ÇORLU', 59)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (714, N'HAYRABOLU', 59)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (715, N'MALKARA', 59)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (716, N'MURATLI', 59)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (717, N'SARAY', 59)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (718, N'ŞARKÖY', 59)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (719, N'MARAMARAEREĞLİSİ', 59)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (720, N'ALMUS', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (721, N'ARTOVA', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (722, N'TOKAT MERKEZ', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (723, N'ERBAA', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (724, N'NİKSAR', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (725, N'REŞADİYE', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (726, N'TURHAL', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (727, N'ZİLE', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (728, N'PAZAR', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (729, N'YEŞİLYURT', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (730, N'BAŞÇİFTLİK', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (731, N'SULUSARAY', 60)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (732, N'TRABZON MERKEZ', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (733, N'AKÇAABAT', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (734, N'ARAKLI', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (735, N'ARŞİN', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (736, N'ÇAYKARA', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (737, N'MAÇKA', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (738, N'OF', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (739, N'SÜRMENE', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (740, N'TONYA', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (741, N'VAKFIKEBİR', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (742, N'YOMRA', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (743, N'BEŞİKDÜZÜ', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (744, N'ŞALPAZARI', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (745, N'ÇARŞIBAŞI', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (746, N'DERNEKPAZARI', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (747, N'DÜZKÖY', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (748, N'HAYRAT', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (749, N'KÖPRÜBAŞI', 61)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (750, N'TUNCELİ MERKEZ', 62)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (751, N'ÇEMİŞGEZEK', 62)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (752, N'HOZAT', 62)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (753, N'MAZGİRT', 62)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (754, N'NAZİMİYE', 62)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (755, N'OVACIK', 62)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (756, N'PERTEK', 62)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (757, N'PÜLÜMÜR', 62)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (758, N'BANAZ', 64)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (759, N'EŞME', 64)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (760, N'KARAHALLI', 64)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (761, N'SİVASLI', 64)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (762, N'ULUBEY', 64)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (763, N'UŞAK MERKEZ', 64)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (764, N'BAŞKALE', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (765, N'VAN MERKEZ', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (766, N'EDREMİT', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (767, N'ÇATAK', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (768, N'ERCİŞ', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (769, N'GEVAŞ', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (770, N'GÜRPINAR', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (771, N'MURADİYE', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (772, N'ÖZALP', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (773, N'BAHÇESARAY', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (774, N'ÇALDIRAN', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (775, N'SARAY', 65)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (776, N'YALOVA MERKEZ', 77)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (777, N'ALTINOVA', 77)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (778, N'ARMUTLU', 77)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (779, N'ÇINARCIK', 77)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (780, N'ÇİFTLİKKÖY', 77)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (781, N'TERMAL', 77)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (782, N'AKDAĞMADENİ', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (783, N'BOĞAZLIYAN', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (784, N'YOZGAT MERKEZ', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (785, N'ÇAYIRALAN', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (786, N'ÇEKEREK', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (787, N'SARIKAYA', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (788, N'SORGUN', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (789, N'ŞEFAATLI', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (790, N'YERKÖY', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (791, N'KADIŞEHRİ', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (792, N'SARAYKENT', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (793, N'YENİFAKILI', 66)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (794, N'ÇAYCUMA', 67)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (795, N'DEVREK', 67)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (796, N'ZONGULDAK MERKEZ', 67)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (797, N'EREĞLİ', 67)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (798, N'ALAPLI', 67)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (799, N'GÖKÇEBEY', 67)
GO
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (800, N'ÇANAKKALE MERKEZ', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (801, N'AYVACIK', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (802, N'BAYRAMİÇ', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (803, N'BİGA', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (804, N'BOZCAADA', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (805, N'ÇAN', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (806, N'ECEABAT', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (807, N'EZİNE', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (808, N'LAPSEKİ', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (809, N'YENİCE', 17)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (810, N'ÇANKIRI MERKEZ', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (811, N'ÇERKEŞ', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (812, N'ELDİVAN', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (813, N'ILGAZ', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (814, N'KURŞUNLU', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (815, N'ORTA', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (816, N'ŞABANÖZÜ', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (817, N'YAPRAKLI', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (818, N'ATKARACALAR', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (819, N'KIZILIRMAK', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (820, N'BAYRAMÖREN', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (821, N'KORGUN', 18)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (822, N'ALACA', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (823, N'BAYAT', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (824, N'ÇORUM MERKEZ', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (825, N'İKSİPLİ', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (826, N'KARGI', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (827, N'MECİTÖZÜ', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (828, N'ORTAKÖY', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (829, N'OSMANCIK', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (830, N'SUNGURLU', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (831, N'DODURGA', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (832, N'LAÇİN', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (833, N'OĞUZLAR', 19)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (834, N'ADALAR', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (835, N'BAKIRKÖY', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (836, N'BEŞİKTAŞ', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (837, N'BEYKOZ', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (838, N'BEYOĞLU', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (839, N'ÇATALCA', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (840, N'EMİNÖNÜ', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (841, N'EYÜP', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (842, N'FATİH', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (843, N'GAZİOSMANPAŞA', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (844, N'KADIKÖY', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (845, N'KARTAL', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (846, N'SARIYER', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (847, N'SİLİVRİ', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (848, N'ŞİLE', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (849, N'ŞİŞLİ', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (850, N'ÜSKÜDAR', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (851, N'ZEYTİNBURNU', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (852, N'BÜYÜKÇEKMECE', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (853, N'KAĞITHANE', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (854, N'KÜÇÜKÇEKMECE', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (855, N'PENDİK', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (856, N'ÜMRANİYE', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (857, N'BAYRAMPAŞA', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (858, N'AVCILAR', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (859, N'BAĞCILAR', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (860, N'BAHÇELİEVLER', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (861, N'GÜNGÖREN', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (862, N'MALTEPE', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (863, N'SULTANBEYLİ', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (864, N'TUZLA', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (865, N'ESENLER', 34)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (866, N'ALİAĞA', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (867, N'BAYINDIR', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (868, N'BERGAMA', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (869, N'BORNOVA', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (870, N'ÇEŞME', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (871, N'DİKİLİ', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (872, N'FOÇA', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (873, N'KARABURUN', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (874, N'KARŞIYAKA', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (875, N'KEMALPAŞA', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (876, N'KINIK', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (877, N'KİRAZ', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (878, N'MENEMEN', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (879, N'ÖDEMİŞ', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (880, N'SEFERİHİSAR', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (881, N'SELÇUK', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (882, N'TİRE', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (883, N'TORBALI', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (884, N'URLA', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (885, N'BEYDAĞ', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (886, N'BUCA', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (887, N'KONAK', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (888, N'MENDERES', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (889, N'BALÇOVA', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (890, N'ÇİGLİ', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (891, N'GAZİEMİR', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (892, N'NARLIDERE', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (893, N'GÜZELBAHÇE', 35)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (894, N'ŞANLIURFA MERKEZ', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (895, N'AKÇAKALE', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (896, N'BİRECİK', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (897, N'BOZOVA', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (898, N'CEYLANPINAR', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (899, N'HALFETİ', 63)
GO
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (900, N'HİLVAN', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (901, N'SİVEREK', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (902, N'SURUÇ', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (903, N'VİRANŞEHİR', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (904, N'HARRAN', 63)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (905, N'BEYTÜŞŞEBAP', 73)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (906, N'ŞIRNAK MERKEZ', 73)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (907, N'CİZRE', 73)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (908, N'İDİL', 73)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (909, N'SİLOPİ', 73)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (910, N'ULUDERE', 73)
INSERT [dbo].[Ilceler] ([Id], [Ad], [Sehir]) VALUES (911, N'GÜÇLÜKONAK', 73)
SET IDENTITY_INSERT [dbo].[Ilceler] OFF
SET IDENTITY_INSERT [dbo].[Iller] ON 

INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (1, N'ADANA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (2, N'ADIYAMAN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (3, N'AFYON')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (4, N'AĞRI')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (5, N'AMASYA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (6, N'ANKARA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (7, N'ANTALYA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (8, N'ARTVİN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (9, N'AYDIN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (10, N'BALIKESİR')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (11, N'BİLECİK')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (12, N'BİNGÖL')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (13, N'BİTLİS')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (14, N'BOLU')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (15, N'BURDUR')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (16, N'BURSA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (17, N'ÇANAKKALE')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (18, N'ÇANKIRI')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (19, N'ÇORUM')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (20, N'DENİZLİ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (21, N'DİYARBAKIR')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (22, N'EDİRNE')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (23, N'ELAZIĞ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (24, N'ERZİNCAN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (25, N'ERZURUM')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (26, N'ESKİŞEHİR')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (27, N'GAZİANTEP')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (28, N'GİRESUN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (29, N'GÜMÜŞHANE')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (30, N'HAKKARİ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (31, N'HATAY')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (32, N'ISPARTA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (33, N'İÇEL')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (34, N'İSTANBUL')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (35, N'İZMİR')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (36, N'KARS')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (37, N'KASTAMONU')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (38, N'KAYSERİ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (39, N'KIRKLARELİ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (40, N'KIRŞEHİR')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (41, N'KOCAELİ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (42, N'KONYA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (43, N'KÜTAHYA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (44, N'MALATYA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (45, N'MANİSA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (46, N'KAHRAMANMARAŞ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (47, N'MARDİN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (48, N'MUĞLA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (49, N'MUŞ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (50, N'NEVŞEHİR')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (51, N'NİĞDE')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (52, N'ORDU')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (53, N'RİZE')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (54, N'SAKARYA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (55, N'SAMSUN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (56, N'SİİRT')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (57, N'SİNOP')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (58, N'SİVAS')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (59, N'TEKİRDAĞ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (60, N'TOKAT')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (61, N'TRABZON')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (62, N'TUNCELİ')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (63, N'ŞANLIURFA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (64, N'UŞAK')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (65, N'VAN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (66, N'YOZGAT')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (67, N'ZONGULDAK')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (68, N'AKSARAY')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (69, N'BAYBURT')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (70, N'KARAMAN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (71, N'KIRIKKALE')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (72, N'BATMAN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (73, N'ŞIRNAK')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (74, N'BARTIN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (75, N'ARDAHAN')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (76, N'IĞDIR')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (77, N'YALOVA')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (78, N'KARABÜK')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (79, N'KİLİS')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (80, N'OSMANİYE')
INSERT [dbo].[Iller] ([Id], [Sehir]) VALUES (81, N'DÜZCE')
SET IDENTITY_INSERT [dbo].[Iller] OFF
INSERT [dbo].[Katilanlar] ([Eid], [Kid]) VALUES (22, 1)
INSERT [dbo].[Katilanlar] ([Eid], [Kid]) VALUES (23, 34)
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([Kid], [Ad], [Soyad], [Email], [Telefon], [Sifre], [Ilce], [DogumTarihi], [Cinsiyet], [isLogin]) VALUES (1, N'Denem', N'Yanılma', N'a@a.com', N'123123123', N'123       ', N'deneme', NULL, 1, 1)
INSERT [dbo].[Kullanici] ([Kid], [Ad], [Soyad], [Email], [Telefon], [Sifre], [Ilce], [DogumTarihi], [Cinsiyet], [isLogin]) VALUES (31, N'yeni', N'kullanici', N'as@a.com', N'(484) 844-8646', N'aewq      ', N'ada', CAST(N'2019-01-23 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Kullanici] ([Kid], [Ad], [Soyad], [Email], [Telefon], [Sifre], [Ilce], [DogumTarihi], [Cinsiyet], [isLogin]) VALUES (34, N'Özgür', N'Tavtay', N'o@o.com', N'(123) 123-1231', N'ooo       ', N'Maltepe', CAST(N'2019-01-28 00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Kullanici] ([Kid], [Ad], [Soyad], [Email], [Telefon], [Sifre], [Ilce], [DogumTarihi], [Cinsiyet], [isLogin]) VALUES (35, N'Berkay', N'asd', N'denem@deneme.com', N'(111) 111-1111', N'111       ', N'111', CAST(N'2019-02-20 00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[Kullanici] ([Kid], [Ad], [Soyad], [Email], [Telefon], [Sifre], [Ilce], [DogumTarihi], [Cinsiyet], [isLogin]) VALUES (1035, N'deneme', N'deneme', N'qwe@asd.com', N'45', N'123       ', N'eyüp', CAST(N'2019-02-13 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Kullanici] ([Kid], [Ad], [Soyad], [Email], [Telefon], [Sifre], [Ilce], [DogumTarihi], [Cinsiyet], [isLogin]) VALUES (1036, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Kullanici] ([Kid], [Ad], [Soyad], [Email], [Telefon], [Sifre], [Ilce], [DogumTarihi], [Cinsiyet], [isLogin]) VALUES (1037, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Kullanici] ([Kid], [Ad], [Soyad], [Email], [Telefon], [Sifre], [Ilce], [DogumTarihi], [Cinsiyet], [isLogin]) VALUES (1038, N'ded', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Kullanici] ([Kid], [Ad], [Soyad], [Email], [Telefon], [Sifre], [Ilce], [DogumTarihi], [Cinsiyet], [isLogin]) VALUES (1039, NULL, N'R', N'qwe@asd.com', NULL, N'12        ', N'DF', CAST(N'2019-01-31 00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1, 1)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (31, 2)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (31, 4)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (31, 7)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (34, 1)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (34, 2)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (34, 3)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (34, 4)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (34, 5)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (34, 6)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (34, 7)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (34, 9)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (34, 10)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (35, 1)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (35, 2)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (35, 3)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (35, 4)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1036, 1)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1036, 3)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1036, 6)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1037, 2)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1037, 5)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1037, 7)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1037, 9)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1038, 1)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1038, 2)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1039, 2)
INSERT [dbo].[KullaniciSpor] ([Kid], [Sid]) VALUES (1039, 4)
SET IDENTITY_INSERT [dbo].[Mekan] ON 

INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (7, N'AltınayTesis', 842)
INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (8, N'AltınayTesis2', 846)
INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (9, N'bakırsaha', 835)
INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (10, N'dqdqd', 141)
INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (11, N'SC-202', 842)
INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (12, N'Ayvansaray Uni. Kantin', 862)
INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (13, N'Adana Playgrounds', 1)
INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (14, N'Bahariye', 841)
INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (15, N'nadnl', 133)
INSERT [dbo].[Mekan] ([Mid], [MekanAdi], [IlceId]) VALUES (16, N'Deneme', 872)
SET IDENTITY_INSERT [dbo].[Mekan] OFF
SET IDENTITY_INSERT [dbo].[Sporlar] ON 

INSERT [dbo].[Sporlar] ([SporId], [SporAdi], [SporcuSayisi]) VALUES (1, N'Futbol', 22)
INSERT [dbo].[Sporlar] ([SporId], [SporAdi], [SporcuSayisi]) VALUES (2, N'Basketbol', 10)
INSERT [dbo].[Sporlar] ([SporId], [SporAdi], [SporcuSayisi]) VALUES (3, N'Voleybol', 12)
INSERT [dbo].[Sporlar] ([SporId], [SporAdi], [SporcuSayisi]) VALUES (4, N'Masa Tenisi', 4)
INSERT [dbo].[Sporlar] ([SporId], [SporAdi], [SporcuSayisi]) VALUES (5, N'Tenis', 4)
INSERT [dbo].[Sporlar] ([SporId], [SporAdi], [SporcuSayisi]) VALUES (6, N'Badminton', 4)
INSERT [dbo].[Sporlar] ([SporId], [SporAdi], [SporcuSayisi]) VALUES (7, N'Plaj Voleybolu', 6)
INSERT [dbo].[Sporlar] ([SporId], [SporAdi], [SporcuSayisi]) VALUES (9, N'kantır', 123)
INSERT [dbo].[Sporlar] ([SporId], [SporAdi], [SporcuSayisi]) VALUES (10, N'Langırt', 4)
SET IDENTITY_INSERT [dbo].[Sporlar] OFF
ALTER TABLE [dbo].[Etkinlik]  WITH CHECK ADD  CONSTRAINT [FK_Etkinlik_EtkinlikTipi] FOREIGN KEY([TipId])
REFERENCES [dbo].[EtkinlikTipi] ([TipId])
GO
ALTER TABLE [dbo].[Etkinlik] CHECK CONSTRAINT [FK_Etkinlik_EtkinlikTipi]
GO
ALTER TABLE [dbo].[Etkinlik]  WITH CHECK ADD  CONSTRAINT [FK_Etkinlik_Kullanici] FOREIGN KEY([Kurucu])
REFERENCES [dbo].[Kullanici] ([Kid])
GO
ALTER TABLE [dbo].[Etkinlik] CHECK CONSTRAINT [FK_Etkinlik_Kullanici]
GO
ALTER TABLE [dbo].[Etkinlik]  WITH CHECK ADD  CONSTRAINT [FK_Etkinlik_Mekan] FOREIGN KEY([MekanID])
REFERENCES [dbo].[Mekan] ([Mid])
GO
ALTER TABLE [dbo].[Etkinlik] CHECK CONSTRAINT [FK_Etkinlik_Mekan]
GO
ALTER TABLE [dbo].[Etkinlik]  WITH CHECK ADD  CONSTRAINT [FK_Etkinlik_Sporlar] FOREIGN KEY([Sid])
REFERENCES [dbo].[Sporlar] ([SporId])
GO
ALTER TABLE [dbo].[Etkinlik] CHECK CONSTRAINT [FK_Etkinlik_Sporlar]
GO
ALTER TABLE [dbo].[Ilceler]  WITH CHECK ADD  CONSTRAINT [FK_Ilceler_Iller] FOREIGN KEY([Sehir])
REFERENCES [dbo].[Iller] ([Id])
GO
ALTER TABLE [dbo].[Ilceler] CHECK CONSTRAINT [FK_Ilceler_Iller]
GO
ALTER TABLE [dbo].[Katilanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_Katilanlar_Etkinlik] FOREIGN KEY([Eid])
REFERENCES [dbo].[Etkinlik] ([EtkinlikId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Katilanlar] CHECK CONSTRAINT [FK_Katilanlar_Etkinlik]
GO
ALTER TABLE [dbo].[Katilanlar]  WITH NOCHECK ADD  CONSTRAINT [FK_Katilanlar_Kullanici] FOREIGN KEY([Kid])
REFERENCES [dbo].[Kullanici] ([Kid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Katilanlar] CHECK CONSTRAINT [FK_Katilanlar_Kullanici]
GO
ALTER TABLE [dbo].[KullaniciSpor]  WITH CHECK ADD  CONSTRAINT [FK_KullaniciSpor_Kullanici] FOREIGN KEY([Kid])
REFERENCES [dbo].[Kullanici] ([Kid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KullaniciSpor] CHECK CONSTRAINT [FK_KullaniciSpor_Kullanici]
GO
ALTER TABLE [dbo].[KullaniciSpor]  WITH NOCHECK ADD  CONSTRAINT [FK_KullaniciSpor_Sporlar] FOREIGN KEY([Sid])
REFERENCES [dbo].[Sporlar] ([SporId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KullaniciSpor] NOCHECK CONSTRAINT [FK_KullaniciSpor_Sporlar]
GO
ALTER TABLE [dbo].[Mekan]  WITH CHECK ADD  CONSTRAINT [FK_Mekan_Ilceler] FOREIGN KEY([IlceId])
REFERENCES [dbo].[Ilceler] ([Id])
GO
ALTER TABLE [dbo].[Mekan] CHECK CONSTRAINT [FK_Mekan_Ilceler]
GO
/****** Object:  StoredProcedure [dbo].[EtkinlikAl]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EtkinlikAl] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	exec [dbo].[EtkinlikTarihKontrol]

	select e.EtkinlikId, EtkinlikAdi, SporAdi, et.Tip,EtkinlikTarihi,m.MekanAdi,ilce.Ad,il.Sehir, e.Kontenjan, count(k.Kid) as Katilanlar  
	from Etkinlik as e
	inner join Sporlar as s on e.Sid = s.SporId 
	inner join Mekan as m on e.MekanID = m.Mid
	inner join EtkinlikTipi as et on e.TipId = et.TipId
	inner join Ilceler as ilce on m.IlceId = ilce.Id
	inner join Iller as il on ilce.Sehir = il.Id
	left join Katilanlar as k on k.Eid = e.EtkinlikId
	where isActive = 1
	group by e.EtkinlikId, EtkinlikAdi, SporAdi, et.Tip,EtkinlikTarihi,m.MekanAdi,ilce.ad,il.Sehir,e.Kontenjan

END


GO
/****** Object:  StoredProcedure [dbo].[EtkinlikTarihKontrol]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EtkinlikTarihKontrol]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Etkinlik set isActive = 2 where EtkinlikTarihi < GETDATE()
END


GO
/****** Object:  StoredProcedure [dbo].[IsLoginUser]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IsLoginUser] 
	-- Add the parameters for the stored procedure here
	@kid as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Kullanici set isLogin = 2 where Kid = @kid
END


GO
/****** Object:  StoredProcedure [dbo].[KullaniciSporEkle]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KullaniciSporEkle]
	-- Add the parameters for the stored procedure here
	@kid as int,
	@sid as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into KullaniciSpor Values(@kid, @sid)
END


GO
/****** Object:  StoredProcedure [dbo].[SonKullanici]    Script Date: 28.02.2019 14:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SonKullanici]
AS
BEGIN
DECLARE @Ret INT
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @Ret = IDENT_CURRENT('Kullanici')

	return @ret
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 ise Aktif 2 ise Bitmiş' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Etkinlik', @level2type=N'COLUMN',@level2name=N'isActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 Erkek 1 Kadın' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kullanici', @level2type=N'COLUMN',@level2name=N'Cinsiyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 Çıkış  2 Giriş' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Kullanici', @level2type=N'COLUMN',@level2name=N'isLogin'
GO
USE [master]
GO
ALTER DATABASE [SporO] SET  READ_WRITE 
GO
