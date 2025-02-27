USE [master]
GO
/****** Object:  Database [store_management]    Script Date: 8/19/2024 7:34:15 PM ******/
CREATE DATABASE [store_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'store_management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\store_management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'store_management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\store_management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [store_management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [store_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [store_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [store_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [store_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [store_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [store_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [store_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [store_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [store_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [store_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [store_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [store_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [store_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [store_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [store_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [store_management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [store_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [store_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [store_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [store_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [store_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [store_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [store_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [store_management] SET RECOVERY FULL 
GO
ALTER DATABASE [store_management] SET  MULTI_USER 
GO
ALTER DATABASE [store_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [store_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [store_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [store_management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [store_management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [store_management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'store_management', N'ON'
GO
ALTER DATABASE [store_management] SET QUERY_STORE = OFF
GO
USE [store_management]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/19/2024 7:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/19/2024 7:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [char](12) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 8/19/2024 7:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[amount] [bigint] NULL,
	[totalAmount] [bigint] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[customerID] [int] NOT NULL,
	[userID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/19/2024 7:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[price] [bigint] NULL,
	[quantity] [int] NULL,
	[discount] [int] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/19/2024 7:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[stockOnHand] [int] NULL,
	[price] [bigint] NULL,
	[thumb] [varchar](100) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
	[categoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockIn]    Script Date: 8/19/2024 7:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockIn](
	[productID] [int] NOT NULL,
	[supplierID] [int] NOT NULL,
	[quantity] [int] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 8/19/2024 7:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplierID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/19/2024 7:34:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[password] [varchar](100) NULL,
	[role] [varchar](10) NULL,
	[fullname] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[position] [nvarchar](100) NULL,
	[phone] [char](12) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [name], [createdAt], [updatedAt]) VALUES (1, N'Đồ uống', CAST(N'2024-08-19T21:38:49.053' AS DateTime), CAST(N'2024-08-20T21:38:49.057' AS DateTime))
INSERT [dbo].[Category] ([categoryID], [name], [createdAt], [updatedAt]) VALUES (2, N'Đồ ăn nhanh', CAST(N'2024-08-19T21:38:49.053' AS DateTime), CAST(N'2024-08-20T21:38:49.057' AS DateTime))
INSERT [dbo].[Category] ([categoryID], [name], [createdAt], [updatedAt]) VALUES (3, N'Đồ ăn lạnh', CAST(N'2024-08-19T21:38:49.053' AS DateTime), CAST(N'2024-08-20T21:38:49.057' AS DateTime))
INSERT [dbo].[Category] ([categoryID], [name], [createdAt], [updatedAt]) VALUES (4, N'Thực phẩm khô', CAST(N'2024-08-19T21:38:49.053' AS DateTime), CAST(N'2024-08-20T21:38:49.057' AS DateTime))
INSERT [dbo].[Category] ([categoryID], [name], [createdAt], [updatedAt]) VALUES (5, N'Thực phẩm đóng hộp', CAST(N'2024-08-19T21:38:49.053' AS DateTime), CAST(N'2024-08-20T21:38:49.057' AS DateTime))
INSERT [dbo].[Category] ([categoryID], [name], [createdAt], [updatedAt]) VALUES (6, N'Gia vị', CAST(N'2024-08-19T21:38:49.053' AS DateTime), CAST(N'2021-05-18T21:41:03.520' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerID], [name], [address], [phone], [createdAt], [updatedAt]) VALUES (1, N'Phạm Trần châu Phi', N'Cà Mau', N'0832344555  ', CAST(N'2024-08-18T22:02:26.447' AS DateTime), CAST(N'2024-08-19T22:02:26.447' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [name], [address], [phone], [createdAt], [updatedAt]) VALUES (2, N'Nguyễn Phương Nhi', N'Cà Mau', N'0869246248  ', CAST(N'2024-08-18T22:02:26.447' AS DateTime), CAST(N'2024-08-19T22:02:26.447' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [name], [address], [phone], [createdAt], [updatedAt]) VALUES (3, N'Nguyễn Văn Tèo', N'Cà Mau', N'0963549898  ', CAST(N'2024-08-18T22:02:26.447' AS DateTime), CAST(N'2024-08-19T22:02:26.447' AS DateTime))
INSERT [dbo].[Customer] ([customerID], [name], [address], [phone], [createdAt], [updatedAt]) VALUES (4, N'Lưu Bá Ôn', N'Cà Mau', N'0987678987  ', CAST(N'2024-08-18T22:02:26.447' AS DateTime), CAST(N'2024-08-19T22:02:26.447' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [createdAt], [updatedAt], [customerID], [userID]) VALUES (1, 3440000, 3440000, CAST(N'2024-08-19T23:02:04.890' AS DateTime), CAST(N'2024-08-20T23:02:04.890' AS DateTime), 2, 2)
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [createdAt], [updatedAt], [customerID], [userID]) VALUES (2, 601000, 601000, CAST(N'2024-08-19T23:02:04.890' AS DateTime), CAST(N'2024-08-20T23:02:04.890' AS DateTime), 4, 2)
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [createdAt], [updatedAt], [customerID], [userID]) VALUES (3, 1023000, 1023000, CAST(N'2024-08-19T23:02:04.890' AS DateTime), CAST(N'2024-08-20T23:02:04.890' AS DateTime), 1, 2)
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [createdAt], [updatedAt], [customerID], [userID]) VALUES (4, 24000, 24000, CAST(N'2024-08-19T23:02:04.890' AS DateTime), CAST(N'2024-08-20T23:02:04.890' AS DateTime), 3, 2)
INSERT [dbo].[Order] ([orderID], [amount], [totalAmount], [createdAt], [updatedAt], [customerID], [userID]) VALUES (5, 500000, 454000, CAST(N'2024-08-19T23:02:04.890' AS DateTime), CAST(N'2021-05-18T23:49:05.330' AS DateTime), 2, 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (1, 1, 15000, 4, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (1, 3, 45000, 3, 0, CAST(N'2024-08-18T23:02:05.220' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (1, 4, 4000, 2, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (1, 5, 5000, 3, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (1, 6, 6000, 12, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (1, 7, 230000, 5, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (1, 8, 250000, 8, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (2, 3, 45000, 3, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (2, 6, 6000, 1, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (2, 7, 230000, 2, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (3, 2, 14000, 1, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (3, 3, 45000, 2, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (3, 4, 4000, 1, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (3, 5, 5000, 1, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (3, 8, 250000, 3, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (3, 9, 20000, 8, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (4, 4, 4000, 1, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (4, 9, 20000, 1, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (5, 2, 14000, 2, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (5, 4, 4000, 3, 0, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[OrderDetail] ([orderID], [productID], [price], [quantity], [discount], [createdAt], [updatedAt]) VALUES (5, 7, 230000, 2, 10, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [thumb], [createdAt], [updatedAt], [categoryID]) VALUES (1, N'Hạt nêm', 80, 20000, NULL, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T19:13:01.687' AS DateTime), 6)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [thumb], [createdAt], [updatedAt], [categoryID]) VALUES (2, N'Nước Pepsi', 97, 14000, NULL, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T18:22:50.333' AS DateTime), 1)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [thumb], [createdAt], [updatedAt], [categoryID]) VALUES (3, N'Xúc xích', 195, 45000, NULL, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T18:22:52.950' AS DateTime), 2)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [thumb], [createdAt], [updatedAt], [categoryID]) VALUES (4, N'Bột canh hải châu', 93, 4000, NULL, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T19:04:50.240' AS DateTime), 6)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [thumb], [createdAt], [updatedAt], [categoryID]) VALUES (5, N'Kem socola', 216, 5000, NULL, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T18:22:58.123' AS DateTime), 3)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [thumb], [createdAt], [updatedAt], [categoryID]) VALUES (6, N'Kem sữa chua', 309, 6000, NULL, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime), 3)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [thumb], [createdAt], [updatedAt], [categoryID]) VALUES (7, N'Cá hồi', 93, 20000, NULL, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T19:11:50.373' AS DateTime), 4)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [thumb], [createdAt], [updatedAt], [categoryID]) VALUES (8, N'Mực khô', 239, 250000, NULL, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T18:22:59.590' AS DateTime), 4)
INSERT [dbo].[Product] ([productID], [name], [stockOnHand], [price], [thumb], [createdAt], [updatedAt], [categoryID]) VALUES (9, N'Mắm nam ngư', 489, 20000, NULL, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt], [updatedAt]) VALUES (1, 7, 1344, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt], [updatedAt]) VALUES (3, 8, 206, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt], [updatedAt]) VALUES (5, 2, 240, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt], [updatedAt]) VALUES (6, 7, 444, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt], [updatedAt]) VALUES (8, 4, 300, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[StockIn] ([productID], [supplierID], [quantity], [createdAt], [updatedAt]) VALUES (9, 6, 796, CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([supplierID], [name], [address], [createdAt], [updatedAt]) VALUES (1, N'Hải Sản Làng Xưa', N'Tp.Hồ Chí Minh', CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[Supplier] ([supplierID], [name], [address], [createdAt], [updatedAt]) VALUES (2, N'TT-TM Sen City Cà Mau', N'Cà Mau', CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[Supplier] ([supplierID], [name], [address], [createdAt], [updatedAt]) VALUES (3, N'Hải Sản Hoàng Hổ', N'Cà Mau', CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[Supplier] ([supplierID], [name], [address], [createdAt], [updatedAt]) VALUES (4, N'Cữu Long Plaza Cà Mau', N'Cà Mau', CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[Supplier] ([supplierID], [name], [address], [createdAt], [updatedAt]) VALUES (5, N'Trung Tâm Mua Sắm Hoàng Gia', N'Cà Mau', CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[Supplier] ([supplierID], [name], [address], [createdAt], [updatedAt]) VALUES (6, N'VINMART Cà Mau', N'Cà Mau', CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[Supplier] ([supplierID], [name], [address], [createdAt], [updatedAt]) VALUES (7, N'Đại Lý Nước Uống Chiêu Hưng', N'Cà Mau', CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2024-08-19T23:02:05.210' AS DateTime))
INSERT [dbo].[Supplier] ([supplierID], [name], [address], [createdAt], [updatedAt]) VALUES (8, N'Coopmart Cà Mau', N'Cà Mau', CAST(N'2024-08-18T23:02:05.207' AS DateTime), CAST(N'2021-05-18T21:53:19.573' AS DateTime))
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userID], [username], [password], [role], [fullname], [address], [position], [phone], [createdAt], [updatedAt]) VALUES (1, N'admin', N'12345', N'admin', N'Quản Lý', N'Cà Mau', N'Tổng giám đốc', N'098765432   ', CAST(N'2024-08-19T21:57:02.167' AS DateTime), CAST(N'2021-08-19T22:00:09.650' AS DateTime))
INSERT [dbo].[User] ([userID], [username], [password], [role], [fullname], [address], [position], [phone], [createdAt], [updatedAt]) VALUES (2, N'adminpro', N'12345', N'user', N'Nhân Viên', N'Cà mau', N'Nhân viên', N'12345678    ', CAST(N'2024-08-19T21:59:05.250' AS DateTime), CAST(N'2021-08-19T21:59:05.250' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [stockOnHand]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD FOREIGN KEY([supplierID])
REFERENCES [dbo].[Supplier] ([supplierID])
GO
USE [master]
GO
ALTER DATABASE [store_management] SET  READ_WRITE 
GO
