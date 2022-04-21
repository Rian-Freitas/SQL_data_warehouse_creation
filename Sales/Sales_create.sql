USE [DB211708020]
GO

/****** ZAGI Sales Database Tables    Script Date: 4/20/2022 9:02:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[s_customer](
	[customerid] [char](7) NOT NULL,
	[customername] [varchar](15) NOT NULL,
	[customerzip] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[s_region](
	[regionid] [char](1) NOT NULL,
	[regionname] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[regionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[s_store](
	[storeid] [varchar](3) NOT NULL,
	[storezip] [char](5) NOT NULL,
	[regionid] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[storeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[s_store]  WITH CHECK ADD FOREIGN KEY([regionid])
REFERENCES [dbo].[s_region] ([regionid])
GO

CREATE TABLE [dbo].[s_vendor](
	[vendorid] [char](2) NOT NULL,
	[vendorname] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[vendorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[s_category](
	[categoryid] [char](2) NOT NULL,
	[categoryname] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[s_product](
	[productid] [char](3) NOT NULL,
	[productname] [varchar](25) NOT NULL,
	[productprice] [numeric](7, 2) NOT NULL,
	[vendorid] [char](2) NOT NULL,
	[categoryid] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[s_product]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[s_category] ([categoryid])
GO

ALTER TABLE [dbo].[s_product]  WITH CHECK ADD FOREIGN KEY([vendorid])
REFERENCES [dbo].[s_vendor] ([vendorid])
GO

CREATE TABLE [dbo].[s_salestransaction](
	[tid] [varchar](8) NOT NULL,
	[customerid] [char](7) NOT NULL,
	[storeid] [varchar](3) NOT NULL,
	[tdate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[s_salestransaction]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[s_customer] ([customerid])
GO

ALTER TABLE [dbo].[s_salestransaction]  WITH CHECK ADD FOREIGN KEY([storeid])
REFERENCES [dbo].[s_store] ([storeid])
GO

CREATE TABLE [dbo].[s_includes](
	[productid] [char](3) NOT NULL,
	[tid] [varchar](8) NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productid] ASC,
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[s_includes]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[s_product] ([productid])
GO

ALTER TABLE [dbo].[s_includes]  WITH CHECK ADD FOREIGN KEY([tid])
REFERENCES [dbo].[s_salestransaction] ([tid])
GO


