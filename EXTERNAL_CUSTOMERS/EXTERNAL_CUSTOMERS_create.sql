USE [DB211708020]
GO

/****** Object:  Table [dbo].[EXTERNAL_CUSTOMERS]    Script Date: 4/20/2022 8:59:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EXTERNAL_CUSTOMERS](
	[customer_id] [varchar](10) NOT NULL,
	[customer_name] [varchar](15) NOT NULL,
	[gender] [varchar](10) NOT NULL,
	[marital_status] [varchar](10) NOT NULL,
	[education] [varchar](20) NOT NULL,
	[credit_score] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

