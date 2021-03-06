USE [master]
GO
/****** Object:  Database [Resturant]    Script Date: 6/10/2022 4:43:41 PM ******/
CREATE DATABASE [Resturant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Resturant', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Resturant.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Resturant_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Resturant_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Resturant] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Resturant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Resturant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Resturant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Resturant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Resturant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Resturant] SET ARITHABORT OFF 
GO
ALTER DATABASE [Resturant] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Resturant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Resturant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Resturant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Resturant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Resturant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Resturant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Resturant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Resturant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Resturant] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Resturant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Resturant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Resturant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Resturant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Resturant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Resturant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Resturant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Resturant] SET RECOVERY FULL 
GO
ALTER DATABASE [Resturant] SET  MULTI_USER 
GO
ALTER DATABASE [Resturant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Resturant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Resturant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Resturant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Resturant] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Resturant', N'ON'
GO
ALTER DATABASE [Resturant] SET QUERY_STORE = OFF
GO
USE [Resturant]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/10/2022 4:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 6/10/2022 4:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/10/2022 4:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](50) NULL,
	[CustomerID] [int] NULL,
	[PMethod] [varchar](50) NULL,
	[GTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 6/10/2022 4:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (1, N'Olivia Kathleen')
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (2, N'Liam Patrick')
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (3, N'Charlotte Rose')
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (4, N'Elijah Burke ')
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (5, N'Ayesha Ameer')
INSERT [dbo].[Customer] ([CustomerID], [Name]) VALUES (6, N'Eva Louis')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (1, N'Chicken Tenders', CAST(3.50 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (2, N'Chicken Tenders w/ Fries', CAST(4.99 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (3, N'Chicken Tenders w/ Onion', CAST(5.99 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (4, N'Grilled Cheese Sandwich', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (5, N'Grilled Cheese Sandwich w/ Fries', CAST(3.99 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (6, N'Grilled Cheese Sandwich w/ Onion', CAST(4.99 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (7, N'Lettuce and Tomato Burger', CAST(1.99 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (8, N'Soup', CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (9, N'Onion Rings', CAST(2.99 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (10, N'Fries', CAST(1.99 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (11, N'Sweet Potato Fries', CAST(2.49 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (12, N'Sweet Tea', CAST(1.79 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (13, N'Botttle Water', CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (14, N'Canned Drinks', CAST(1.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Item] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Item]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Order]
GO
USE [master]
GO
ALTER DATABASE [Resturant] SET  READ_WRITE 
GO
