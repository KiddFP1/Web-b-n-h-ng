USE [master]
GO
/****** Object:  Database [GoalShop]    Script Date: 4/16/2024 6:02:55 PM ******/
CREATE DATABASE [GoalShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GoalShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GoalShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GoalShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GoalShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GoalShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GoalShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GoalShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GoalShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GoalShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GoalShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GoalShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [GoalShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GoalShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GoalShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GoalShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GoalShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GoalShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GoalShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GoalShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GoalShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GoalShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GoalShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GoalShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GoalShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GoalShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GoalShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GoalShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GoalShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GoalShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GoalShop] SET  MULTI_USER 
GO
ALTER DATABASE [GoalShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GoalShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GoalShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GoalShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GoalShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GoalShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GoalShop', N'ON'
GO
ALTER DATABASE [GoalShop] SET QUERY_STORE = OFF
GO
USE [GoalShop]
GO
/****** Object:  User [java]    Script Date: 4/16/2024 6:02:55 PM ******/
CREATE USER [java] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[java]
GO
/****** Object:  Schema [java]    Script Date: 4/16/2024 6:02:55 PM ******/
CREATE SCHEMA [java]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](20) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Authorize_id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Role_id] [varchar](10) NULL,
 CONSTRAINT [PK_Authorize] PRIMARY KEY CLUSTERED 
(
	[Authorize_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cartdetails]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cartdetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Cart_id] [int] NULL,
	[Product_id] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Cartdetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username_id] [varchar](50) NULL,
	[Createdate] [date] NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Category_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Comment_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Comment_Content] [nvarchar](max) NULL,
	[Comment_Date] [datetime] NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Favorite_id] [int] IDENTITY(1,1) NOT NULL,
	[Favorite_date] [date] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Favorite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[Order_id] [int] NULL,
	[Product_id] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
	[Status] [int] NULL,
	[Phone] [char](11) NULL,
	[Description] [nvarchar](50) NULL,
	[Intent] [nvarchar](50) NULL,
	[Method] [nvarchar](50) NULL,
	[Currency] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[Ship] [float] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Image1] [varchar](max) NULL,
	[Image2] [varchar](max) NULL,
	[Image3] [varchar](max) NULL,
	[Name] [nvarchar](50) NULL,
	[Unit_price] [float] NULL,
	[Quantity] [int] NULL,
	[Product_date] [date] NULL,
	[Category_id] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Distcount] [float] NULL,
	[Special] [bit] NULL,
	[Lastest] [bit] NULL,
	[Status] [bit] NULL,
	[Detail] [nvarchar](max) NULL,
	[Trademark_id] [int] NOT NULL,
	[Color] [nvarchar](50) NULL,
	[Material] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trademarks]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trademarks](
	[Trademark_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Trademarks] PRIMARY KEY CLUSTERED 
(
	[Trademark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Votes]    Script Date: 4/16/2024 6:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Votes](
	[Vote_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Vote_Date] [datetime] NULL,
	[Vote] [int] NULL,
	[Image] [varchar](50) NULL,
	[Vote_content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[Vote_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'112792886592478504726', N'123456', N'A', N'dangnhpc03881@fpt.edu.vn', N'avata.jpg', N'0783975742', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'118398358639987702987', N'gXIc6SxxE2', N'Vu The Phong (FPL CT)', N'phongvtpc03804@fpt.edu.vn', N'avata.jpg', NULL, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'1650653785454809', N'omSC19wyxS', N'Vu Phong', N'vuthephongkg2003@gmail.com', N'avata.jpg', NULL, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'admin', N'123', N'Nguyễn Thanh Hải', N'hai@gmail.com', N'canbo.png', N'0123456789', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'gunnyfp1', N'123456', N'A', N'killerduyfp1@gmail.com', N'avata.jpg', N'01655097790', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'gunnyfp3', N'123456', N'Bui Quynh', N'killerduyfp1@gmail.com', N'avata.jpg', N'113', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'NTT', N'123', N'Đặng Minh Đăng', N'mr.dang112310@gmail.com', N'avata.jpg', N'0782921113', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Active]) VALUES (N'Ð?ng Van A', N'123456', N'Đặng Văn A', N'killerduyfp1@gmail.com', N'avata.jpg', N'06879467784', 0)
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (20, N'admin', N'STAF')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (28, N'112792886592478504726', N'CUST')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (29, N'118398358639987702987', N'CUST')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (30, N'1650653785454809', N'CUST')
INSERT [dbo].[Authorities] ([Authorize_id], [Username], [Role_id]) VALUES (31, N'NTT', N'STAF')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (1, N'Đèn', N'Đèn chi tiết')
INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (2, N'Bàn', N'Bàn chi tiết')
INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (3, N'Thảm', N'1231213')
INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (4, N'Ghế', N'')
INSERT [dbo].[Categories] ([Category_id], [Name], [Detail]) VALUES (14, N'Sofa', N'adsdadasd')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Comment_id], [Product_id], [Username], [Comment_Content], [Comment_Date], [Image]) VALUES (60, 111, N'112792886592478504726', N'Sản phẩm chất lượng', CAST(N'2023-08-15T23:05:34.637' AS DateTime), NULL)
INSERT [dbo].[Comments] ([Comment_id], [Product_id], [Username], [Comment_Content], [Comment_Date], [Image]) VALUES (61, 111, N'admin', N'có sản phẩm ở cần thơ không', CAST(N'2023-10-30T18:33:46.130' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Favorite_id], [Favorite_date], [Product_id], [Username]) VALUES (46, CAST(N'2023-08-15' AS Date), 111, N'112792886592478504726')
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (308, 141, 112, 2000000, 3)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (309, 142, 111, 1000000, 6)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (311, 144, 113, 500000, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (312, 145, 113, 500000, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (313, 146, 113, 500000, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (314, 147, 113, 500000, 3)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (315, 147, 112, 2000000, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (316, 148, 111, 1000000, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (317, 148, 112, 2000000, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (318, 148, 113, 500000, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (319, 149, 111, 1000000, 1)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (320, 150, 116, 500000, 5)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (321, 150, 112, 2000000, 10)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (322, 151, 111, 1000000, 2)
INSERT [dbo].[OrderDetails] ([OrderDetail_id], [Order_id], [Product_id], [Price], [Quantity]) VALUES (323, 152, 111, 1000000, 2)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (141, N'112792886592478504726', CAST(N'2023-08-15T23:01:19.250' AS DateTime), N'cà mau', 0, N'0839489440 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 5760000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (142, N'112792886592478504726', CAST(N'2023-08-15T23:02:00.000' AS DateTime), N'Cần thơ', 3, N'0839489440 ', N'Đã thanh toán', N'Sale', N'Trả sau', N'VND', 3000000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (144, N'admin', CAST(N'2023-08-16T01:08:22.647' AS DateTime), N'can tho', 0, N'0123456789 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 500000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (145, N'admin', CAST(N'2023-08-16T01:08:55.607' AS DateTime), N'', 0, N'           ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 500000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (146, N'admin', CAST(N'2023-08-16T01:09:00.000' AS DateTime), N'', 4, N'           ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 500000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (147, N'admin', CAST(N'2023-08-16T01:10:00.000' AS DateTime), N'u', 3, N'0123456789 ', N'Đã thanh toán', N'Sale', N'Trả sau', N'VND', 3420000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (148, N'admin', CAST(N'2023-08-16T13:03:59.620' AS DateTime), N'sdsdsdsds', 0, N'0839489440 ', N'Đã thanh toán', N'sale', N'Paypal', N'USD', 3420000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (149, N'NTT', CAST(N'2023-10-12T16:44:27.877' AS DateTime), N'aaa', 4, N'0123456789 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 1000000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (150, N'admin', CAST(N'2023-10-30T18:38:04.070' AS DateTime), N'', 0, N'           ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 21675000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (151, N'112792886592478504726', CAST(N'2023-10-30T18:41:00.000' AS DateTime), N'ấp phú mĩ', 4, N'0839489440 ', N'Chưa thanh toán', N'Sale', N'Trả sau', N'VND', 2000000, NULL)
INSERT [dbo].[Orders] ([Order_id], [Username], [CreateDate], [Address], [Status], [Phone], [Description], [Intent], [Method], [Currency], [Price], [Ship]) VALUES (152, N'gunnyfp1', CAST(N'2024-04-14T22:11:00.000' AS DateTime), N'A', 3, N'098347781  ', N'Đã thanh toán', N'Sale', N'Trả sau', N'VND', 2000000, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Product_id], [Image1], [Image2], [Image3], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Description], [Distcount], [Special], [Lastest], [Status], [Detail], [Trademark_id], [Color], [Material], [Size]) VALUES (111, N'den1.jpg', N'den2.jpg', N'den3.jpg', N'Đèn zi', 1000000, 9994, CAST(N'2023-08-12' AS Date), 1, N'Đèn tai thỏ', 0, 1, 1, 1, N'', 1, N'Trắng', N'Gỗ', N'40-80')
INSERT [dbo].[Products] ([Product_id], [Image1], [Image2], [Image3], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Description], [Distcount], [Special], [Lastest], [Status], [Detail], [Trademark_id], [Color], [Material], [Size]) VALUES (112, N'den4.jpg', N'den5.jpg', N'den6.jpg', N'Đèn LED', 2000000, 100, CAST(N'2023-08-15' AS Date), 1, N'Đèn phát sáng', 4, 1, 0, 1, N'Đèn là 1 loại chiếu sáng', 1, N'Trắng', N'Nhôm', N'20-60')
INSERT [dbo].[Products] ([Product_id], [Image1], [Image2], [Image3], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Description], [Distcount], [Special], [Lastest], [Status], [Detail], [Trademark_id], [Color], [Material], [Size]) VALUES (113, N'ghe1 - Copy.jpg', N'ghe1.jpg', N'ghe2.jpg', N'Ghế AZ', 500000, 100, CAST(N'2023-08-15' AS Date), 4, N'Ghế được sản xuất ở việt nam', 0, 1, 1, 1, N'Ghế được sản xuất ở việt nam', 2, N'Trắng', N'Gỗ', N'40-80')
INSERT [dbo].[Products] ([Product_id], [Image1], [Image2], [Image3], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Description], [Distcount], [Special], [Lastest], [Status], [Detail], [Trademark_id], [Color], [Material], [Size]) VALUES (114, N'ghe3.jpg', N'ghe4.jpg', N'ghe5.jpg', N'Ghế ETH', 700000, 50, CAST(N'2023-08-15' AS Date), 4, N'Ghế được sản xuất từ Mỹ', 2, 1, 1, 1, N'Ghế được sản xuất từ Mỹ', 4, N'Đen', N'Nhôm', N'40-80')
INSERT [dbo].[Products] ([Product_id], [Image1], [Image2], [Image3], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Description], [Distcount], [Special], [Lastest], [Status], [Detail], [Trademark_id], [Color], [Material], [Size]) VALUES (115, N'sofa1.jpg', N'sofa2.jpg', N'sofa3.jpg', N'Sofa Legend', 5000000, 20, CAST(N'2023-08-15' AS Date), 14, N'Sofa được sản xuất ở Việt Nam', 1, 1, 1, 1, N'<p>Là sản đến từ Việt Nam</p>
', 1, N'Trắng', N'Nhôm', N'20-60')
INSERT [dbo].[Products] ([Product_id], [Image1], [Image2], [Image3], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Description], [Distcount], [Special], [Lastest], [Status], [Detail], [Trademark_id], [Color], [Material], [Size]) VALUES (116, N'sofa5.jpg', N'sofa6.jpg', N'sofa7.jpg', N'Sofa Gỗ óc chó', 500000, 30, CAST(N'2023-08-16' AS Date), 14, N'Sofa được sản xuất ở Việt Nam', 1, 1, 1, 1, N'<p>Sofa chất lượng cao</p>
', 5, N'Đen', N'Gỗ', N'40-80')
INSERT [dbo].[Products] ([Product_id], [Image1], [Image2], [Image3], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Description], [Distcount], [Special], [Lastest], [Status], [Detail], [Trademark_id], [Color], [Material], [Size]) VALUES (117, N'tham5.jpg', N'tham6.jpg', N'tham7.jpg', N'Thảm Polyester', 200000, 30, CAST(N'2023-08-15' AS Date), 3, N'Thảm đến từ Đức', 5, 1, 1, 1, N'Thảm đến từ Đức', 5, N'Trắng', N'Nhôm', N'20-60')
INSERT [dbo].[Products] ([Product_id], [Image1], [Image2], [Image3], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Description], [Distcount], [Special], [Lastest], [Status], [Detail], [Trademark_id], [Color], [Material], [Size]) VALUES (118, N'tham3.jpg', N'tham4.jpg', N'tham16.jpg', N'Thảm sợi Nylon', 100000, 30, CAST(N'2023-08-15' AS Date), 3, N'Thảm đến từ Đức', 0, 1, 1, 1, N'<p>Thảm đến từ Đức</p>
', 3, N'Đen', N'Gỗ', N'40-80')
INSERT [dbo].[Products] ([Product_id], [Image1], [Image2], [Image3], [Name], [Unit_price], [Quantity], [Product_date], [Category_id], [Description], [Distcount], [Special], [Lastest], [Status], [Detail], [Trademark_id], [Color], [Material], [Size]) VALUES (122, N'iPhone-11.jpg', N'iphone-12-pro.jpg', N'iphone-12-pro-max.jpg', N'Test', 11, 12, CAST(N'2023-10-11' AS Date), 1, N'Test', 100, 1, 1, 1, N'Test', 1, N'Đỏ', N'Gỗ', N'1')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Role_id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Role_id], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET IDENTITY_INSERT [dbo].[Trademarks] ON 

INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (1, N'Luxury Light', N'là 1 thương hiệu đến từ hàn quốc')
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (2, N'Kenza Sofa', NULL)
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (3, N'Metawood', NULL)
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (4, N'UMA', NULL)
INSERT [dbo].[Trademarks] ([Trademark_id], [Name], [Detail]) VALUES (5, N'EVERON', NULL)
SET IDENTITY_INSERT [dbo].[Trademarks] OFF
GO
SET IDENTITY_INSERT [dbo].[Votes] ON 

INSERT [dbo].[Votes] ([Vote_id], [Product_id], [Username], [Vote_Date], [Vote], [Image], [Vote_content]) VALUES (16, 111, N'112792886592478504726', CAST(N'2023-08-15T23:15:02.270' AS DateTime), 5, N'', N'Sản phẩm quá chất lượng')
SET IDENTITY_INSERT [dbo].[Votes] OFF
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorize_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorize_Account]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorize_Role] FOREIGN KEY([Role_id])
REFERENCES [dbo].[Roles] ([Role_id])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorize_Role]
GO
ALTER TABLE [dbo].[Cartdetails]  WITH CHECK ADD  CONSTRAINT [FK_Cartdetails_Carts] FOREIGN KEY([Cart_id])
REFERENCES [dbo].[Carts] ([Id])
GO
ALTER TABLE [dbo].[Cartdetails] CHECK CONSTRAINT [FK_Cartdetails_Carts]
GO
ALTER TABLE [dbo].[Cartdetails]  WITH CHECK ADD  CONSTRAINT [FK_Cartdetails_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Cartdetails] CHECK CONSTRAINT [FK_Cartdetails_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Accounts] FOREIGN KEY([Username_id])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Accounts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Accounts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Accounts]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([Order_id])
REFERENCES [dbo].[Orders] ([Order_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Categories] ([Category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Trademarks] FOREIGN KEY([Trademark_id])
REFERENCES [dbo].[Trademarks] ([Trademark_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Trademarks]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Accounts]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Products]
GO
USE [master]
GO
ALTER DATABASE [GoalShop] SET  READ_WRITE 
GO
