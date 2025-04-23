USE [Again]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 5/26/2024 3:01:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[F_name] [varchar](50) NOT NULL,
	[L_name] [varchar](50) NULL,
	[age] [int] SPARSE  NULL,
	[e_address] [varchar](50) NULL,
	[hire_date] [date] NULL,
	[sallry] [float] NULL,
	[over_time] [float] NULL,
	[net_sallary]  AS (isnull([sallry],(0))+isnull([over_time],(0))) PERSISTED NOT NULL,
	[D_number] [smallint] NULL,
 CONSTRAINT [PK_dbo.Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [File 2]
) ON [File 2]
GO

ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_dbo.Employee_e_address]  DEFAULT ('Cairo') FOR [e_address]
GO



select *  from Again.dbo.Emp


select * from Northwind2021.dbo.CUSTOMERSSS

select count (*)  from Northwind2021.dbo.Supplier