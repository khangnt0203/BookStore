USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 18/08/2021 3:15:04 CH ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStore', N'ON'
GO
ALTER DATABASE [BookStore] SET QUERY_STORE = OFF
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 18/08/2021 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[discountID] [varchar](10) NOT NULL,
	[discountDescription] [varchar](50) NULL,
	[percentDiscount] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblDiscount] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 18/08/2021 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [nchar](10) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 18/08/2021 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nchar](30) NOT NULL,
	[discountID] [varchar](10) NULL,
	[date] [date] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 18/08/2021 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nchar](10) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[productImg] [varchar](max) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[categoryID] [nchar](10) NOT NULL,
	[description] [nvarchar](200) NULL,
	[author] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 18/08/2021 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 18/08/2021 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nchar](30) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tlbCategories]    Script Date: 18/08/2021 3:15:04 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tlbCategories](
	[categoryID] [nchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tlbCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'D10', N'Discount 10%', 0.10000000149011612, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'OUT', N'giam gia 50 phan tram', 0.5, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'P30', N'Discount 30%', 0.30000001192092896, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'P40', N'discount 40', 0.4, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'P50', N'Discount 50%', 0.5, 0)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SPRING', N'giam gia 15 phan tram', 0.15, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SUM', N'giam gia 20 phan tram', 0.2, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'SUMM', N'giam gia 50', 0.5, 1)
INSERT [dbo].[tblDiscount] ([discountID], [discountDescription], [percentDiscount], [status]) VALUES (N'VND', N'giam gia 50', 0.5, 1)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (32, 18, N'P01       ', 180, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (33, 18, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (34, 19, N'P01       ', 180, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (35, 19, N'P04       ', 400, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (36, 20, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (37, 20, N'P02       ', 222, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (38, 21, N'P11       ', 14, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (39, 21, N'P04       ', 400, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (40, 21, N'P10       ', 14, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (41, 22, N'P11       ', 14, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (42, 23, N'P12       ', 399, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (43, 23, N'P03       ', 300, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (44, 24, N'P05       ', 500, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (45, 24, N'P09       ', 119, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (46, 25, N'P01       ', 180, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (47, 25, N'P06       ', 430, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (48, 26, N'P13       ', 28, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (18, N'user                          ', N'P50', CAST(N'2021-08-18' AS Date), 201)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (19, N'user                          ', NULL, CAST(N'2021-08-18' AS Date), 980)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (20, N'user                          ', NULL, CAST(N'2021-08-18' AS Date), 522)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (21, N'user                          ', NULL, CAST(N'2021-08-18' AS Date), 428)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (22, N'vy                            ', NULL, CAST(N'2021-08-18' AS Date), 14)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (23, N'long                          ', N'P40', CAST(N'2021-08-18' AS Date), 419.39999389648438)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (24, N'huy                           ', NULL, CAST(N'2021-08-18' AS Date), 619)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (25, N'user                          ', N'P30', CAST(N'2021-08-18' AS Date), 427)
INSERT [dbo].[tblOrders] ([orderID], [userID], [discountID], [date], [total]) VALUES (26, N'vy                            ', N'D10', CAST(N'2021-08-18' AS Date), 25.200000762939453)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P01       ', N'Conan', N'conan.jpg', 180, 1, N'C02       ', N'New secrect case', N'Aoyama Gosho')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P02       ', N'Harry Potter', N'harrypotter.jpg', 222, 3, N'C01       ', N'Harry Potter and the stone', N'J.K.Rolling')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P03       ', N'IELTS 15 Acedemic', N'ielts15.jpg', 300, 2, N'C03       ', N'Practice Ielts 15', N'Roger')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P04       ', N'Dekiru Nihongo', N'dekiru.jpg', 400, 7, N'C03       ', N'Use for the beginner', N'Minamoto ')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P05       ', N'Java For Beginner', N'java.jpg', 500, 24, N'C04       ', N'This book use for the beginner', N'John Thomson')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P06       ', N'Diary of a Cricket', N'cricket.jpg', 430, 12, N'C01       ', N'A story about a adventure of a cricket', N'To Hoai')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P07       ', N'C# for Beginner', N'csharp.jpg', 513, 7, N'C04       ', N'New guide', N'Ryan Turner')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P08       ', N'Marvel Studio Book', N'marvel.jpg', 99, 10, N'C05       ', N'Studio book art', N'Marvel')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P09       ', N'Software Testing', N'tester.jpg', 119, 16, N'C04       ', N'Tester Book', N'Paul')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P10       ', N'Doraemon st.2', N'doremon2.jpg', 14, 5, N'C02       ', N'Doraemon Series', N'Fujiko')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P11       ', N'Doraemon st.35', N'doremon35.jpg', 14, 7, N'C02       ', N'Doraemon Series', N'Fujiko')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P12       ', N'Doctor Sleep', N'doctorsleep.jpg', 399, 22, N'C01       ', N'Stephen King series', N'Stephen King')
INSERT [dbo].[tblProducts] ([productID], [productName], [productImg], [price], [quantity], [categoryID], [description], [author]) VALUES (N'P13       ', N'Vouge Fashion', N'fashion.jpg', 28, 14, N'C05       ', N'Magazine for fashionistar', N'Vouge')
GO
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'GU', N'guest')
GO
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'admin                         ', N'Khang', N'Quan Binh Thanh', N'1234567890', N'AD', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'huy                           ', N'Huy', N'Quan 7', N'1234455643', N'GU', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'long                          ', N'Long', N'Quan 8', N'0182927392', N'GU', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'user                          ', N'Minh', N'Quan 6', N'1234567890', N'GU', N'123')
INSERT [dbo].[tblUsers] ([userID], [name], [address], [phone], [roleID], [password]) VALUES (N'vy                            ', N'Vy', N'Binh Duong', N'0127389463', N'GU', N'123')
GO
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C01       ', N'Novel')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C02       ', N'Comic')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C03       ', N'Language')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C04       ', N'Computer Science')
INSERT [dbo].[tlbCategories] ([categoryID], [categoryName]) VALUES (N'C05       ', N'Magazine')
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblDiscount] FOREIGN KEY([discountID])
REFERENCES [dbo].[tblDiscount] ([discountID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblDiscount]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tlbCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tlbCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tlbCategories]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
