USE [master]
GO
/****** Object:  Database [BankDB]    Script Date: 2/9/2024 10:12:47 AM ******/
CREATE DATABASE [BankDB]
GO
USE [BankDB]
GO
/****** Object:  Table [dbo].[acct_bal]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_bal](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_bal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_acct_bal] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_bene]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_bene](
	[acct_bene_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[bene_cust_id] [int] NOT NULL,
	[bene_first_name] [nvarchar](50) NOT NULL,
	[bene_last_name] [nvarchar](50) NOT NULL,
	[bene_tax_id] [varchar](50) NOT NULL,
	[relationship_id] [tinyint] NOT NULL,
	[bene_portion] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_acct_bene] PRIMARY KEY CLUSTERED 
(
	[acct_bene_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_branch]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_branch](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_branch_id] [smallint] NOT NULL,
 CONSTRAINT [PK_acct_branch] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_contact]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_contact](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[contact_name] [varchar](50) NOT NULL,
	[contact_address] [varchar](50) NOT NULL,
	[contact_address_2] [varchar](50) NOT NULL,
	[contact_city] [varchar](50) NOT NULL,
	[contact_state] [tinyint] NOT NULL,
	[contact_zip] [int] NOT NULL,
 CONSTRAINT [PK_acct_contact] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_holders]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_holders](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_secondary_id] [varchar](50) NOT NULL,
	[joint_cust_secondary_id] [varchar](50) NULL,
 CONSTRAINT [PK_acct_holders] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_holding]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_holding](
	[acct_holding_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[stock_id] [int] NOT NULL,
	[quantity] [decimal](18, 4) NOT NULL,
	[average_cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_acct_stock_holdings] PRIMARY KEY CLUSTERED 
(
	[acct_holding_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_info]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_info](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_id] [int] NOT NULL,
	[acct_num] [varchar](50) NOT NULL,
	[initial_contact_method] [tinyint] NOT NULL,
	[acct_type] [tinyint] NOT NULL,
	[registration_name] [varchar](100) NOT NULL,
	[acct_objective] [tinyint] NOT NULL,
	[acct_funding] [tinyint] NOT NULL,
	[acct_purpose] [tinyint] NOT NULL,
	[acct_activity] [tinyint] NOT NULL,
	[acct_nickname] [varchar](50) NOT NULL,
	[client_since] [date] NOT NULL,
	[acct_status] [bit] NOT NULL,
	[closed_date] [date] NULL,
	[rep_id] [varchar](5) NULL,
 CONSTRAINT [PK_acct_info] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_jurisdiction]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_jurisdiction](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[jurisdiction_country] [smallint] NOT NULL,
	[jurisdiction_state] [tinyint] NOT NULL,
 CONSTRAINT [PK_acct_jurisdiction] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_limit]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_limit](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[atm_limit] [int] NOT NULL,
	[ach_limit] [int] NOT NULL,
	[wire_limit] [int] NOT NULL,
 CONSTRAINT [PK_acct_limit] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_mobile]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_mobile](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[online] [bit] NOT NULL,
	[mobile] [bit] NOT NULL,
	[two_factor] [bit] NOT NULL,
	[biometrics] [bit] NOT NULL,
 CONSTRAINT [PK_acct_mobile] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_pass]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_pass](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_pass] [varchar](50) NOT NULL,
 CONSTRAINT [PK_acct_pass] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_poa]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_poa](
	[acct_poa_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[poa_cust_id] [int] NOT NULL,
	[poa_role] [tinyint] NOT NULL,
	[poa_first_name] [nvarchar](200) NOT NULL,
	[poa_last_name] [nvarchar](200) NOT NULL,
	[poa_tax_id] [varchar](50) NOT NULL,
	[poa_last_four] [varchar](4) NOT NULL,
 CONSTRAINT [PK_acct_poa] PRIMARY KEY CLUSTERED 
(
	[acct_poa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_trade]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_trade](
	[acct_trade_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_transaction_id] [int] NOT NULL,
	[acct_id] [int] NOT NULL,
	[trade_date] [datetime] NOT NULL,
	[stock_exchange] [smallint] NOT NULL,
	[stock_id] [int] NOT NULL,
	[trade_quantity] [int] NOT NULL,
	[trade_price] [decimal](18, 4) NOT NULL,
	[trade_amount] [decimal](18, 4) NOT NULL,
	[trade_status] [tinyint] NOT NULL,
	[trade_fees] [decimal](18, 4) NOT NULL,
	[currency] [varchar](3) NOT NULL,
 CONSTRAINT [PK__acct_tra__AAFF5BF7D6BC7E7C] PRIMARY KEY CLUSTERED 
(
	[acct_trade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_transaction]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_transaction](
	[acct_transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[transaction_type] [tinyint] NOT NULL,
	[transaction_amt] [decimal](18, 4) NOT NULL,
	[transaction_date] [datetime] NOT NULL,
	[pre_bal] [decimal](18, 4) NOT NULL,
	[post_bal] [decimal](18, 4) NOT NULL,
	[rep_id] [int] NULL,
 CONSTRAINT [PK__acct_tra__85C600AF6BC79EB4] PRIMARY KEY CLUSTERED 
(
	[acct_transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_contact]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_contact](
	[cust_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_email] [nvarchar](200) NOT NULL,
	[cust_phone_home] [varchar](15) NOT NULL,
	[cust_phone_business] [varchar](15) NOT NULL,
	[cust_address] [varchar](200) NOT NULL,
	[cust_address_2] [varchar](200) NOT NULL,
	[cust_city] [varchar](85) NOT NULL,
	[cust_state] [tinyint] NOT NULL,
	[cust_zip] [int] NOT NULL,
	[cust_country] [smallint] NOT NULL,
 CONSTRAINT [PK_cust_contact] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_emp]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_emp](
	[cust_id] [int] IDENTITY(1,1) NOT NULL,
	[employment_status] [bit] NOT NULL,
	[employer_name] [varchar](200) NOT NULL,
	[occupation] [varchar](500) NOT NULL,
 CONSTRAINT [PK_cust_emp] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_id]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_id](
	[cust_id] [int] IDENTITY(1,1) NOT NULL,
	[id_type] [tinyint] NOT NULL,
	[id_state] [tinyint] NOT NULL,
	[id_num] [varchar](25) NOT NULL,
	[id_exp] [varchar](25) NOT NULL,
	[mothers_maiden] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cust_state_id] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_info]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_info](
	[cust_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_secondary_id] [varchar](50) NOT NULL,
	[first_name] [nvarchar](200) NOT NULL,
	[middle_name] [nvarchar](200) NULL,
	[last_name] [nvarchar](200) NOT NULL,
	[suffix] [varchar](5) NULL,
	[date_of_birth] [date] NOT NULL,
	[client_since] [date] NOT NULL,
 CONSTRAINT [PK_cust_information] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_privacy]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_privacy](
	[cust_id] [int] IDENTITY(1,1) NOT NULL,
	[voice_auth] [bit] NOT NULL,
	[do_not_call] [bit] NOT NULL,
	[share_affiliates] [bit] NOT NULL,
 CONSTRAINT [PK_cust_stuff] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_tax]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_tax](
	[cust_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_tax_id] [varchar](25) NOT NULL,
 CONSTRAINT [PK_cust_tax] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_contact]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_contact](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_email] [nvarchar](200) NOT NULL,
	[emp_phone] [varchar](15) NOT NULL,
	[emp_address] [varchar](200) NOT NULL,
	[emp_address_2] [varchar](200) NULL,
	[emp_city] [varchar](85) NOT NULL,
	[emp_state] [tinyint] NOT NULL,
	[emp_zip] [int] NOT NULL,
 CONSTRAINT [PK__emp_pers__1299A8612474792A] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_info]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_info](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_secondary_id] [varchar](50) NOT NULL,
	[first_name] [nvarchar](200) NOT NULL,
	[middle_name] [nvarchar](200) NULL,
	[last_name] [nvarchar](200) NOT NULL,
	[suffix] [varchar](3) NULL,
	[date_of_birth] [date] NOT NULL,
	[hire_date] [date] NOT NULL,
	[termination_date] [date] NULL,
 CONSTRAINT [PK__emp_info__1299A861548DE268] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_pass]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_pass](
	[emp_id] [int] NOT NULL,
	[emp_password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_emp_pass] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_position]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_position](
	[emp_position_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NOT NULL,
	[position_location_id] [smallint] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
 CONSTRAINT [PK__employee__0A9EB98968F67576] PRIMARY KEY CLUSTERED 
(
	[emp_position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_rep_id]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_rep_id](
	[emp_id] [int] NOT NULL,
	[rep_id] [varchar](5) NOT NULL,
 CONSTRAINT [PK_emp_rep_id] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_rep_id] UNIQUE NONCLUSTERED 
(
	[rep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_salary]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_salary](
	[emp_salary_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NOT NULL,
	[effective_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[salary_amount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__emp_sala__A3C71C5158369EBA] PRIMARY KEY CLUSTERED 
(
	[emp_salary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_tax]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_tax](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_tax_id] [varchar](25) NOT NULL,
	[emp_last_four] [varchar](4) NULL,
	[emp_tax_id_encrypt] [varbinary](max) NULL,
 CONSTRAINT [PK_emp_tax] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_termination]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_termination](
	[emp_termination_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NOT NULL,
	[termination_date] [date] NOT NULL,
	[reason] [tinyint] NOT NULL,
	[rehireable] [bit] NOT NULL,
 CONSTRAINT [PK__terminat__B66BAA113D18C8F0] PRIMARY KEY CLUSTERED 
(
	[emp_termination_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_acct_activity]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_activity](
	[acct_activity_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[activity_type] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_acct_activity] PRIMARY KEY CLUSTERED 
(
	[acct_activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_acct_funding]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_funding](
	[acct_funding_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[funding_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LU_acct_funding] PRIMARY KEY CLUSTERED 
(
	[acct_funding_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_acct_objectives]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_objectives](
	[acct_objectives_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[objective_types] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_acct_objectives] PRIMARY KEY CLUSTERED 
(
	[acct_objectives_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_acct_purpose]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_purpose](
	[acct_purpose_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[purpose_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LU_acct_purpose] PRIMARY KEY CLUSTERED 
(
	[acct_purpose_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_acct_type]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_type](
	[acct_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[acct_type] [varchar](75) NOT NULL,
	[acct_type_abbr] [varchar](10) NOT NULL,
 CONSTRAINT [PK_LU_acct_type] PRIMARY KEY CLUSTERED 
(
	[acct_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_comp_department]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_comp_department](
	[department_id] [smallint] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](50) NOT NULL,
	[description] [varchar](1000) NOT NULL,
 CONSTRAINT [PK__departme__C22324223AEB4B50] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_comp_location]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_comp_location](
	[location_id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[city] [varchar](100) NOT NULL,
	[state] [tinyint] NOT NULL,
	[zip] [int] NOT NULL,
	[type_id] [tinyint] NOT NULL,
 CONSTRAINT [PK__comp_loc__771831EA9585F23C] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_comp_location_type]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_comp_location_type](
	[location_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[location_type] [varchar](25) NOT NULL,
 CONSTRAINT [PK__comp_loc__771831EA8051DD08] PRIMARY KEY CLUSTERED 
(
	[location_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_comp_position]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_comp_position](
	[position_id] [smallint] IDENTITY(1,1) NOT NULL,
	[position_name] [varchar](100) NOT NULL,
	[department_id] [smallint] NOT NULL,
	[salary_range_low] [decimal](10, 2) NOT NULL,
	[salary_range_high] [decimal](10, 2) NOT NULL,
	[parent_position_id] [smallint] NULL,
	[position_removed] [bit] NOT NULL,
 CONSTRAINT [PK__position__99A0E7A4A17D6B7C] PRIMARY KEY CLUSTERED 
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_comp_position_location]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_comp_position_location](
	[position_location_id] [smallint] IDENTITY(1,1) NOT NULL,
	[location_id] [smallint] NOT NULL,
	[position_id] [smallint] NOT NULL,
 CONSTRAINT [PK_comp_position_location] PRIMARY KEY CLUSTERED 
(
	[position_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_country]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_country](
	[country_id] [smallint] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](60) NOT NULL,
	[can_open] [bit] NOT NULL,
	[calling_code] [varchar](25) NULL,
 CONSTRAINT [PK_LU_country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_id_type]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_id_type](
	[id_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[id_type] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_id_type] PRIMARY KEY CLUSTERED 
(
	[id_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_initial_contact_method]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_initial_contact_method](
	[method_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[method_name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_initial_contact_method] PRIMARY KEY CLUSTERED 
(
	[method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_mc_access]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_mc_access](
	[mc_access_id] [smallint] IDENTITY(1,1) NOT NULL,
	[position_id] [smallint] NOT NULL,
	[trading] [bit] NOT NULL,
	[move_money] [bit] NOT NULL,
	[view_only] [bit] NOT NULL,
 CONSTRAINT [PK_emp_mc_access_1] PRIMARY KEY CLUSTERED 
(
	[mc_access_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_poa_role]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_poa_role](
	[poa_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[poa_role] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_poa_role] PRIMARY KEY CLUSTERED 
(
	[poa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_relationship_type]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_relationship_type](
	[relationship_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[relationship_type] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_relationship_type] PRIMARY KEY CLUSTERED 
(
	[relationship_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_state]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_state](
	[state_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[state_name] [varchar](85) NOT NULL,
	[state_abbr] [varchar](2) NOT NULL,
 CONSTRAINT [PK_LU_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_stock_exchange]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_stock_exchange](
	[stock_exchange_id] [smallint] IDENTITY(1,1) NOT NULL,
	[exchange_name] [varchar](50) NOT NULL,
	[exchange_abbr] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LU_stock_exchange] PRIMARY KEY CLUSTERED 
(
	[stock_exchange_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_stock_exchange_to_ticker]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_stock_exchange_to_ticker](
	[exchange_id] [smallint] IDENTITY(1,1) NOT NULL,
	[stock_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_stock_list]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_stock_list](
	[stock_id] [int] IDENTITY(1,1) NOT NULL,
	[stock_ticker] [varchar](12) NOT NULL,
	[stock_name] [varchar](100) NOT NULL,
	[current_price] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_LU_stock_list] PRIMARY KEY CLUSTERED 
(
	[stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_termination_reason]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_termination_reason](
	[termination_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[termination_reason] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_LU_termination_reason] PRIMARY KEY CLUSTERED 
(
	[termination_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_trade_status]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_trade_status](
	[trade_status_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[status_name] [varchar](50) NOT NULL,
	[status_description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_LU_trade_status] PRIMARY KEY CLUSTERED 
(
	[trade_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_transaction_type]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_transaction_type](
	[transaction_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[transaction_type] [varchar](25) NOT NULL,
	[transaction_abbr] [varchar](4) NOT NULL,
 CONSTRAINT [PK_LU_transaction_type] PRIMARY KEY CLUSTERED 
(
	[transaction_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_words]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_words](
	[word_id] [int] IDENTITY(1,1) NOT NULL,
	[word] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LU_zip_codes]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_zip_codes](
	[zip_id] [int] IDENTITY(1,1) NOT NULL,
	[zip] [int] NOT NULL,
	[latitude] [decimal](8, 5) NOT NULL,
	[longitude] [decimal](8, 5) NOT NULL,
 CONSTRAINT [PK_LU_zip_codes] PRIMARY KEY CLUSTERED 
(
	[zip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[acct_bal]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_bal_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_bal] CHECK CONSTRAINT [FK_acct_bal_acct_info]
GO
ALTER TABLE [dbo].[acct_bene]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_bene_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_bene] CHECK CONSTRAINT [FK_acct_bene_acct_info]
GO
ALTER TABLE [dbo].[acct_bene]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_bene_LU_relationship_type] FOREIGN KEY([relationship_id])
REFERENCES [dbo].[LU_relationship_type] ([relationship_id])
GO
ALTER TABLE [dbo].[acct_bene] CHECK CONSTRAINT [FK_acct_bene_LU_relationship_type]
GO
ALTER TABLE [dbo].[acct_branch]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_branch_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_branch] CHECK CONSTRAINT [FK_acct_branch_acct_info]
GO
ALTER TABLE [dbo].[acct_branch]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_branch_LU_comp_location] FOREIGN KEY([acct_branch_id])
REFERENCES [dbo].[LU_comp_location] ([location_id])
GO
ALTER TABLE [dbo].[acct_branch] CHECK CONSTRAINT [FK_acct_branch_LU_comp_location]
GO
ALTER TABLE [dbo].[acct_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_contact_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_contact] CHECK CONSTRAINT [FK_acct_contact_acct_info]
GO
ALTER TABLE [dbo].[acct_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_contact_LU_state] FOREIGN KEY([contact_state])
REFERENCES [dbo].[LU_state] ([state_id])
GO
ALTER TABLE [dbo].[acct_contact] CHECK CONSTRAINT [FK_acct_contact_LU_state]
GO
ALTER TABLE [dbo].[acct_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_contact_LU_zip_codes] FOREIGN KEY([contact_zip])
REFERENCES [dbo].[LU_zip_codes] ([zip_id])
GO
ALTER TABLE [dbo].[acct_contact] CHECK CONSTRAINT [FK_acct_contact_LU_zip_codes]
GO
ALTER TABLE [dbo].[acct_holders]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_holders_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_holders] CHECK CONSTRAINT [FK_acct_holders_acct_info]
GO
ALTER TABLE [dbo].[acct_holding]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_stock_holdings_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_holding] CHECK CONSTRAINT [FK_acct_stock_holdings_acct_info]
GO
ALTER TABLE [dbo].[acct_holding]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_stock_holdings_LU_stock_list] FOREIGN KEY([stock_id])
REFERENCES [dbo].[LU_stock_list] ([stock_id])
GO
ALTER TABLE [dbo].[acct_holding] CHECK CONSTRAINT [FK_acct_stock_holdings_LU_stock_list]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_cust_info]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_emp_rep_id] FOREIGN KEY([rep_id])
REFERENCES [dbo].[emp_rep_id] ([rep_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_emp_rep_id]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_activity] FOREIGN KEY([acct_activity])
REFERENCES [dbo].[LU_acct_activity] ([acct_activity_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_activity]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_funding] FOREIGN KEY([acct_funding])
REFERENCES [dbo].[LU_acct_funding] ([acct_funding_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_funding]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_objectives] FOREIGN KEY([acct_objective])
REFERENCES [dbo].[LU_acct_objectives] ([acct_objectives_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_objectives]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_purpose] FOREIGN KEY([acct_purpose])
REFERENCES [dbo].[LU_acct_purpose] ([acct_purpose_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_purpose]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_type] FOREIGN KEY([acct_type])
REFERENCES [dbo].[LU_acct_type] ([acct_type_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_type]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_initial_contact_method] FOREIGN KEY([initial_contact_method])
REFERENCES [dbo].[LU_initial_contact_method] ([method_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_initial_contact_method]
GO
ALTER TABLE [dbo].[acct_jurisdiction]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_jurisdiction_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_jurisdiction] CHECK CONSTRAINT [FK_acct_jurisdiction_acct_info]
GO
ALTER TABLE [dbo].[acct_jurisdiction]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_jurisdiction_LU_country] FOREIGN KEY([jurisdiction_country])
REFERENCES [dbo].[LU_country] ([country_id])
GO
ALTER TABLE [dbo].[acct_jurisdiction] CHECK CONSTRAINT [FK_acct_jurisdiction_LU_country]
GO
ALTER TABLE [dbo].[acct_jurisdiction]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_jurisdiction_LU_state] FOREIGN KEY([jurisdiction_state])
REFERENCES [dbo].[LU_state] ([state_id])
GO
ALTER TABLE [dbo].[acct_jurisdiction] CHECK CONSTRAINT [FK_acct_jurisdiction_LU_state]
GO
ALTER TABLE [dbo].[acct_limit]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_limit_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_limit] CHECK CONSTRAINT [FK_acct_limit_acct_info]
GO
ALTER TABLE [dbo].[acct_mobile]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_mobile_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_mobile] CHECK CONSTRAINT [FK_acct_mobile_acct_info]
GO
ALTER TABLE [dbo].[acct_pass]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_pass_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_pass] CHECK CONSTRAINT [FK_acct_pass_acct_info]
GO
ALTER TABLE [dbo].[acct_poa]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_poa_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_poa] CHECK CONSTRAINT [FK_acct_poa_acct_info]
GO
ALTER TABLE [dbo].[acct_poa]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_poa_LU_poa_role] FOREIGN KEY([poa_role])
REFERENCES [dbo].[LU_poa_role] ([poa_id])
GO
ALTER TABLE [dbo].[acct_poa] CHECK CONSTRAINT [FK_acct_poa_LU_poa_role]
GO
ALTER TABLE [dbo].[acct_trade]  WITH CHECK ADD  CONSTRAINT [FK_acct_trade_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_trade] CHECK CONSTRAINT [FK_acct_trade_acct_info]
GO
ALTER TABLE [dbo].[acct_trade]  WITH CHECK ADD  CONSTRAINT [FK_acct_trade_acct_stock_holdings] FOREIGN KEY([stock_id])
REFERENCES [dbo].[acct_holding] ([acct_holding_id])
GO
ALTER TABLE [dbo].[acct_trade] CHECK CONSTRAINT [FK_acct_trade_acct_stock_holdings]
GO
ALTER TABLE [dbo].[acct_trade]  WITH CHECK ADD  CONSTRAINT [FK_acct_trade_acct_transaction] FOREIGN KEY([acct_transaction_id])
REFERENCES [dbo].[acct_transaction] ([acct_transaction_id])
GO
ALTER TABLE [dbo].[acct_trade] CHECK CONSTRAINT [FK_acct_trade_acct_transaction]
GO
ALTER TABLE [dbo].[acct_trade]  WITH CHECK ADD  CONSTRAINT [FK_acct_trade_LU_stock_exchange] FOREIGN KEY([stock_exchange])
REFERENCES [dbo].[LU_stock_exchange] ([stock_exchange_id])
GO
ALTER TABLE [dbo].[acct_trade] CHECK CONSTRAINT [FK_acct_trade_LU_stock_exchange]
GO
ALTER TABLE [dbo].[acct_trade]  WITH CHECK ADD  CONSTRAINT [FK_acct_trade_LU_stock_list] FOREIGN KEY([stock_id])
REFERENCES [dbo].[LU_stock_list] ([stock_id])
GO
ALTER TABLE [dbo].[acct_trade] CHECK CONSTRAINT [FK_acct_trade_LU_stock_list]
GO
ALTER TABLE [dbo].[acct_trade]  WITH CHECK ADD  CONSTRAINT [FK_acct_trade_LU_trade_status] FOREIGN KEY([trade_status])
REFERENCES [dbo].[LU_trade_status] ([trade_status_id])
GO
ALTER TABLE [dbo].[acct_trade] CHECK CONSTRAINT [FK_acct_trade_LU_trade_status]
GO
ALTER TABLE [dbo].[acct_transaction]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_transaction] CHECK CONSTRAINT [FK_acct_transaction_acct_info]
GO
ALTER TABLE [dbo].[acct_transaction]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_emp_rep_id] FOREIGN KEY([rep_id])
REFERENCES [dbo].[emp_rep_id] ([emp_id])
GO
ALTER TABLE [dbo].[acct_transaction] CHECK CONSTRAINT [FK_acct_transaction_emp_rep_id]
GO
ALTER TABLE [dbo].[acct_transaction]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_LU_transaction_type] FOREIGN KEY([transaction_type])
REFERENCES [dbo].[LU_transaction_type] ([transaction_type_id])
GO
ALTER TABLE [dbo].[acct_transaction] CHECK CONSTRAINT [FK_acct_transaction_LU_transaction_type]
GO
ALTER TABLE [dbo].[cust_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_contact_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_contact] CHECK CONSTRAINT [FK_cust_contact_cust_info]
GO
ALTER TABLE [dbo].[cust_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_contact_LU_country] FOREIGN KEY([cust_country])
REFERENCES [dbo].[LU_country] ([country_id])
GO
ALTER TABLE [dbo].[cust_contact] CHECK CONSTRAINT [FK_cust_contact_LU_country]
GO
ALTER TABLE [dbo].[cust_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_contact_LU_state] FOREIGN KEY([cust_state])
REFERENCES [dbo].[LU_state] ([state_id])
GO
ALTER TABLE [dbo].[cust_contact] CHECK CONSTRAINT [FK_cust_contact_LU_state]
GO
ALTER TABLE [dbo].[cust_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_contact_LU_zip_codes] FOREIGN KEY([cust_zip])
REFERENCES [dbo].[LU_zip_codes] ([zip_id])
GO
ALTER TABLE [dbo].[cust_contact] CHECK CONSTRAINT [FK_cust_contact_LU_zip_codes]
GO
ALTER TABLE [dbo].[cust_emp]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_emp_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_emp] CHECK CONSTRAINT [FK_cust_emp_cust_info]
GO
ALTER TABLE [dbo].[cust_id]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_id_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_id] CHECK CONSTRAINT [FK_cust_id_cust_info]
GO
ALTER TABLE [dbo].[cust_id]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_id_LU_id_type] FOREIGN KEY([id_type])
REFERENCES [dbo].[LU_id_type] ([id_type_id])
GO
ALTER TABLE [dbo].[cust_id] CHECK CONSTRAINT [FK_cust_id_LU_id_type]
GO
ALTER TABLE [dbo].[cust_id]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_id_LU_state] FOREIGN KEY([id_state])
REFERENCES [dbo].[LU_state] ([state_id])
GO
ALTER TABLE [dbo].[cust_id] CHECK CONSTRAINT [FK_cust_id_LU_state]
GO
ALTER TABLE [dbo].[cust_privacy]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_privacy_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_privacy] CHECK CONSTRAINT [FK_cust_privacy_cust_info]
GO
ALTER TABLE [dbo].[cust_tax]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_tax_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_tax] CHECK CONSTRAINT [FK_cust_tax_cust_info]
GO
ALTER TABLE [dbo].[emp_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_contact_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_contact] CHECK CONSTRAINT [FK_emp_contact_emp_info]
GO
ALTER TABLE [dbo].[emp_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_contact_LU_state] FOREIGN KEY([emp_state])
REFERENCES [dbo].[LU_state] ([state_id])
GO
ALTER TABLE [dbo].[emp_contact] CHECK CONSTRAINT [FK_emp_contact_LU_state]
GO
ALTER TABLE [dbo].[emp_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_contact_LU_zip_codes] FOREIGN KEY([emp_zip])
REFERENCES [dbo].[LU_zip_codes] ([zip_id])
GO
ALTER TABLE [dbo].[emp_contact] CHECK CONSTRAINT [FK_emp_contact_LU_zip_codes]
GO
ALTER TABLE [dbo].[emp_pass]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_pass_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_pass] CHECK CONSTRAINT [FK_emp_pass_emp_info]
GO
ALTER TABLE [dbo].[emp_position]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_position_comp_position_location] FOREIGN KEY([position_location_id])
REFERENCES [dbo].[LU_comp_position_location] ([position_location_id])
GO
ALTER TABLE [dbo].[emp_position] CHECK CONSTRAINT [FK_emp_position_comp_position_location]
GO
ALTER TABLE [dbo].[emp_position]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_position_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_position] CHECK CONSTRAINT [FK_emp_position_emp_info]
GO
ALTER TABLE [dbo].[emp_rep_id]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_rep_id_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_rep_id] CHECK CONSTRAINT [FK_emp_rep_id_emp_info]
GO
ALTER TABLE [dbo].[emp_salary]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_salary_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_salary] CHECK CONSTRAINT [FK_emp_salary_emp_info]
GO
ALTER TABLE [dbo].[emp_tax]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_tax_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_tax] CHECK CONSTRAINT [FK_emp_tax_emp_info]
GO
ALTER TABLE [dbo].[emp_termination]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_termination_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_termination] CHECK CONSTRAINT [FK_emp_termination_emp_info]
GO
ALTER TABLE [dbo].[emp_termination]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_termination_LU_termination_reason] FOREIGN KEY([reason])
REFERENCES [dbo].[LU_termination_reason] ([termination_id])
GO
ALTER TABLE [dbo].[emp_termination] CHECK CONSTRAINT [FK_emp_termination_LU_termination_reason]
GO
ALTER TABLE [dbo].[LU_comp_location]  WITH NOCHECK ADD  CONSTRAINT [FK_comp_location_comp_location_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[LU_comp_location_type] ([location_type_id])
GO
ALTER TABLE [dbo].[LU_comp_location] CHECK CONSTRAINT [FK_comp_location_comp_location_type]
GO
ALTER TABLE [dbo].[LU_comp_location]  WITH CHECK ADD  CONSTRAINT [FK_LU_comp_location_LU_state] FOREIGN KEY([state])
REFERENCES [dbo].[LU_state] ([state_id])
GO
ALTER TABLE [dbo].[LU_comp_location] CHECK CONSTRAINT [FK_LU_comp_location_LU_state]
GO
ALTER TABLE [dbo].[LU_comp_location]  WITH CHECK ADD  CONSTRAINT [FK_LU_comp_location_LU_zip_codes] FOREIGN KEY([zip])
REFERENCES [dbo].[LU_zip_codes] ([zip_id])
GO
ALTER TABLE [dbo].[LU_comp_location] CHECK CONSTRAINT [FK_LU_comp_location_LU_zip_codes]
GO
ALTER TABLE [dbo].[LU_comp_position]  WITH CHECK ADD  CONSTRAINT [FK_comp_position_comp_department] FOREIGN KEY([department_id])
REFERENCES [dbo].[LU_comp_department] ([department_id])
GO
ALTER TABLE [dbo].[LU_comp_position] CHECK CONSTRAINT [FK_comp_position_comp_department]
GO
ALTER TABLE [dbo].[LU_comp_position_location]  WITH CHECK ADD  CONSTRAINT [FK_comp_position_location_comp_location] FOREIGN KEY([location_id])
REFERENCES [dbo].[LU_comp_location] ([location_id])
GO
ALTER TABLE [dbo].[LU_comp_position_location] CHECK CONSTRAINT [FK_comp_position_location_comp_location]
GO
ALTER TABLE [dbo].[LU_comp_position_location]  WITH CHECK ADD  CONSTRAINT [FK_comp_position_location_comp_position] FOREIGN KEY([position_id])
REFERENCES [dbo].[LU_comp_position] ([position_id])
GO
ALTER TABLE [dbo].[LU_comp_position_location] CHECK CONSTRAINT [FK_comp_position_location_comp_position]
GO
ALTER TABLE [dbo].[LU_mc_access]  WITH CHECK ADD  CONSTRAINT [FK_emp_mc_access_LU_comp_position] FOREIGN KEY([position_id])
REFERENCES [dbo].[LU_comp_position] ([position_id])
GO
ALTER TABLE [dbo].[LU_mc_access] CHECK CONSTRAINT [FK_emp_mc_access_LU_comp_position]
GO
ALTER TABLE [dbo].[LU_stock_exchange_to_ticker]  WITH CHECK ADD  CONSTRAINT [FK_LU_stock_exchange_to_ticker_LU_stock_exchange] FOREIGN KEY([exchange_id])
REFERENCES [dbo].[LU_stock_exchange] ([stock_exchange_id])
GO
ALTER TABLE [dbo].[LU_stock_exchange_to_ticker] CHECK CONSTRAINT [FK_LU_stock_exchange_to_ticker_LU_stock_exchange]
GO
ALTER TABLE [dbo].[LU_stock_exchange_to_ticker]  WITH CHECK ADD  CONSTRAINT [FK_LU_stock_exchange_to_ticker_LU_stock_list] FOREIGN KEY([stock_id])
REFERENCES [dbo].[LU_stock_list] ([stock_id])
GO
ALTER TABLE [dbo].[LU_stock_exchange_to_ticker] CHECK CONSTRAINT [FK_LU_stock_exchange_to_ticker_LU_stock_list]
GO
ALTER TABLE [dbo].[emp_termination]  WITH NOCHECK ADD  CONSTRAINT [CHK_termination_reason] CHECK  (([reason]>=(1) AND [reason]<=(4)))
GO
ALTER TABLE [dbo].[emp_termination] CHECK CONSTRAINT [CHK_termination_reason]
GO
/****** Object:  StoredProcedure [dbo].[Acct_AdvancedSearch]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_AdvancedSearch]
    @LastName NVARCHAR(50) = NULL,
    @FirstName NVARCHAR(50) = NULL,
    @MiddleInitial CHAR(1) = NULL,
    @CustSecondaryID INT = NULL,
    @CustPhone NVARCHAR(20) = NULL,
	@CustZip NVARCHAR(20) = NULL,
    @CustTaxID NVARCHAR(20) = NULL,
    @AcctNum NVARCHAR(20) = NULL,
    @CustEmail NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ai.acct_num AS 'Account Number',
		   ai.registration_name AS 'Account Name',
		   ci.cust_secondary_id AS 'Customer ID',
		   ac.contact_address AS 'Address Line 1',
		   ac.contact_address_2 AS 'Address Line 2',
		   ac.contact_city AS 'City',
		   st.state_abbr AS 'State',
		   zc.zip AS 'Zip',
		   CASE 
				WHEN ai.acct_status = 0 THEN 'Open'
				ELSE 'Closed' 
		   END AS 'Account Status'
    FROM cust_info ci
    LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
    LEFT JOIN cust_tax ct ON ci.cust_id = ct.cust_id
    LEFT JOIN acct_info ai ON ci.cust_id = ai.cust_id
	LEFT JOIN acct_contact ac on ac.acct_id = ai.acct_id
	LEFT JOIN LU_state st on st.state_id =  ac.contact_state
	LEFT JOIN LU_zip_codes zc on zc.zip_id =  ac.contact_zip
    WHERE (@LastName IS NULL OR ci.last_name = @LastName)
      AND (@FirstName IS NULL OR ci.first_name = @FirstName)
      AND (@MiddleInitial IS NULL OR LEFT(ci.middle_name, 1) = @MiddleInitial)
      AND (@CustSecondaryID IS NULL OR ci.cust_secondary_id = @CustSecondaryID)
	  AND (@CustPhone IS NULL OR cc.cust_phone_home = @CustPhone OR cc.cust_phone_business = @CustPhone)
      AND (@CustTaxID IS NULL OR ct.cust_tax_id = @CustTaxID)
      AND (@AcctNum IS NULL OR ai.acct_num = @AcctNum)
      AND (@CustEmail IS NULL OR cc.cust_email = @CustEmail);
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctInfoByAcctNum]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctInfoByAcctNum]
    @acct_num VARCHAR(50)
AS
BEGIN
    SELECT 
        a.acct_num,
        a.initial_contact_method,
        a.acct_type,
        a.registration_name,
        a.acct_objective,
        a.acct_funding,
        a.acct_purpose,
        a.acct_activity,
        a.cust_id,
        a.acct_nickname,
        a.client_since,
        a.acct_status,
        a.closed_date,
        a.rep_id,
        b.acct_bal,
        c.bene_cust_id,
        c.bene_first_name,
        c.bene_last_name,
        c.relationship_id,
        c.bene_portion,
        c.bene_tax_id_encrypt,
        d.acct_branch_id,
        e.contact_name,
        e.contact_address,
        e.contact_address_2,
        e.contact_city,
        e.contact_state,
        e.contact_zip,
        f.cust_secondary_id,
        f.joint_cust_secondary_id,
        g.jurisdiction_country,
        g.jurisdiction_state,
        h.atm_limit,
        h.ach_limit,
        h.wire_limit,
        i.online,
        i.mobile,
        i.two_factor,
        i.biometrics,
        j.acct_pass_encrypt,
        k.poa_cust_id,
        k.poa_role,
        k.poa_first_name,
        k.poa_last_name,
        k.poa_tax_id_encrypt
    FROM 
        acct_info a
    JOIN 
        acct_bal b ON a.acct_id = b.acct_id
    LEFT JOIN  
        acct_bene c ON a.acct_id = c.acct_id
    JOIN 
        acct_branch d ON a.acct_id = d.acct_id
    JOIN 
        acct_contact e ON a.acct_id = e.acct_id
    JOIN 
        acct_holders f ON a.acct_id = f.acct_id
    JOIN 
        acct_jurisdiction g ON a.acct_id = g.acct_id
    JOIN 
        acct_limit h ON a.acct_id = h.acct_id
    JOIN 
        acct_mobile i ON a.acct_id = i.acct_id
    JOIN 
        acct_pass j ON a.acct_id = j.acct_id
    LEFT JOIN 
        acct_poa k ON a.acct_id = k.acct_id
    WHERE 
        a.acct_num = @acct_num;
END;
GO
/****** Object:  StoredProcedure [dbo].[Como_GetPositionHierarchy]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Como_GetPositionHierarchy]
AS
BEGIN
    ;WITH PositionHierarchy AS (
        SELECT 
            position_id, 
            position_name, 
            department_id, 
            salary_range_low, 
            salary_range_high, 
            parent_position_id,
            position_removed,
            CAST(position_name as VARCHAR(MAX)) as hierarchy
        FROM 
            LU_comp_position
        WHERE 
            parent_position_id IS NULL

        UNION ALL

        SELECT 
            p.position_id, 
            p.position_name, 
            p.department_id, 
            p.salary_range_low, 
            p.salary_range_high, 
            p.parent_position_id,
            p.position_removed,
            h.hierarchy + ' -> ' + p.position_name
        FROM 
            LU_comp_position p
        JOIN 
            PositionHierarchy h 
        ON 
            p.parent_position_id = h.position_id
        WHERE 
            p.position_removed = 0
    )

    SELECT 
        hierarchy
    FROM 
        PositionHierarchy
    ORDER BY 
        hierarchy;
END
GO
/****** Object:  StoredProcedure [dbo].[Comp_GetMainClientAccessDetails]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Comp_GetMainClientAccessDetails]
AS
BEGIN
    SELECT 
        cl.name as location_name,
		city,
        clt.location_type,
		cp.position_id,
        cp.position_name,
        cd.department_name,
		mc.trading,
		mc.move_money,
		mc.view_only
    FROM 
        [BankDB].[dbo].[LU_comp_position_location] cpl
    JOIN 
        [BankDB].[dbo].[LU_comp_location] cl
    ON 
        cpl.location_id = cl.location_id
    JOIN 
        [BankDB].[dbo].[LU_comp_position] cp
    ON 
        cpl.position_id = cp.position_id
    JOIN 
        [BankDB].[dbo].[LU_comp_department] cd
    ON 
        cp.department_id = cd.department_id
    JOIN 
        [BankDB].[dbo].[LU_comp_location_type] clt
    ON 
        cl.type_id = clt.location_type_id
	JOIN
		[BankDB].[dbo].[LU_mc_access] mc
	ON
		cp.position_id = mc.position_id
	WHERE
		cp.position_removed = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[Comp_GetPositionLocationDetails]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Comp_GetPositionLocationDetails]
AS
BEGIN
    SELECT 
        cl.name as location_name,
		city,
        clt.location_type,
		cp.position_id,
        cp.position_name,
        cd.department_name,
		position_removed
    FROM 
        [BankDB].[dbo].[LU_comp_position_location] cpl
    JOIN 
        [BankDB].[dbo].[LU_comp_location] cl
    ON 
        cpl.location_id = cl.location_id
    JOIN 
        [BankDB].[dbo].[LU_comp_position] cp
    ON 
        cpl.position_id = cp.position_id
    JOIN 
        [BankDB].[dbo].[LU_comp_department] cd
    ON 
        cp.department_id = cd.department_id
    JOIN 
        [BankDB].[dbo].[LU_comp_location_type] clt
    ON 
        cl.type_id = clt.location_type_id
	WHERE
		cp.position_removed = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[Cust_GetInfoByCustID]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Cust_GetInfoByCustID]
    @cust_id VARCHAR(50)
AS
BEGIN
    SELECT 
		a.cust_id
		,a.cust_secondary_id
		,a.first_name
		,a.middle_name
		,a.last_name
		,a.suffix
		,a.date_of_birth
		,a.client_since
		,b.cust_email
		,b.cust_phone_home
		,b.cust_phone_business
		,b.cust_address
		,b.cust_address_2
		,b.cust_city
		,b.cust_state
		,b.cust_zip
		,b.cust_country
		,c.employment_status
		,c.employer_name
		,c.occupation
		,d.id_type
		,d.id_state
		,d.id_num
		,d.id_exp
		,d.mothers_maiden
		,e.voice_auth
		,e.do_not_call
		,e.share_affiliates
		,f.cust_last_four
		,f.cust_tax_id_encrypt
    FROM 
        cust_info a
    JOIN 
        cust_contact b ON a.cust_id = b.cust_id
    LEFT JOIN  
        cust_emp c ON a.cust_id = c.cust_id
    JOIN 
        cust_id d ON a.cust_id = d.cust_id
    JOIN 
        cust_privacy e ON a.cust_id = e.cust_id
    JOIN 
        cust_tax f ON a.cust_id = f.cust_id
    WHERE 
        a.cust_secondary_id = @cust_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[Emp_GetEmpMainClient]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Emp_GetEmpMainClient]
AS
BEGIN
    SELECT 
        eri.emp_id,
        eri.rep_id,
        mc.trading,
        mc.move_money,
        mc.view_only,
        cl.name AS location_name,
        cp.position_name
    FROM 
        [BankDB].[dbo].[LU_comp_position_location] cpl
    JOIN 
        [BankDB].[dbo].[LU_comp_location] cl ON cpl.location_id = cl.location_id
    JOIN 
        [BankDB].[dbo].[LU_comp_position] cp ON cpl.position_id = cp.position_id
    JOIN 
        [BankDB].[dbo].[LU_comp_department] cd ON cp.department_id = cd.department_id
    JOIN 
        [BankDB].[dbo].[LU_comp_location_type] clt ON cl.type_id = clt.location_type_id
    JOIN
        [BankDB].[dbo].[LU_mc_access] mc ON cp.position_id = mc.position_id
    JOIN
        [BankDB].[dbo].[emp_position] ep ON cpl.position_location_id = ep.position_location_id
    JOIN
        [BankDB].[dbo].[emp_rep_id] eri ON ep.emp_id = eri.emp_id
    WHERE
        cp.position_removed = 0
	ORDER BY
		eri.emp_id;
END
GO
/****** Object:  StoredProcedure [dbo].[LoginEmployee]    Script Date: 2/9/2024 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginEmployee]
	@inputRepID VARCHAR(5),
    @inputPassword VARCHAR(255),
    @LoginMessage NVARCHAR(100) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;
	
	-- Declare a variable to store the emp_id
    DECLARE @empId INT;

    -- Retrieve the emp_id using the entered rep_id
    SELECT @empId = emp_id
    FROM [BankDB].[dbo].[emp_rep_id]
    WHERE rep_id = @inputRepID;

    IF @empId IS NOT NULL
    BEGIN
		-- Declare variables to store hash and salt from the database
		DECLARE @storedHash VARBINARY(32);
		DECLARE @storedSalt UNIQUEIDENTIFIER;

        -- Retrieve the stored hash and salt for the found emp_id
        SELECT @storedHash = emp_pass_hash, @storedSalt = emp_pass_salt

        FROM [BankDB].[dbo].[emp_pass]
        WHERE emp_id = @empId;

        -- If the hash and salt are found, proceed with password check
        IF @storedHash IS NOT NULL AND @storedSalt IS NOT NULL
        BEGIN
            -- Hash the entered password with the stored salt
            IF HASHBYTES('SHA2_256', CONCAT(@inputPassword, CONVERT(NVARCHAR(50), @storedSalt))) = @storedHash
            BEGIN
                -- If the password is correct, return the emp_id
                SET @LoginMessage = 'Login successful';
            END
            ELSE
            BEGIN
                -- If the password does not match, return 0 or another indicator of failure
                SET @LoginMessage = 'Username or Password is incorrect.';
            END
        END
        ELSE
        BEGIN
            -- If no hash and salt are found, return 0 or another indicator of failure
            SET @LoginMessage = 'The information could not be found. Please contact the National Service Desk.';
        END
    END
    ELSE
    BEGIN
        -- If no emp_id is found for the rep_id, return 0 or another indicator of failure
        SET @LoginMessage = 'The information could not be found. Please contact the National Service Desk.';
    END
END
GO
USE [master]
GO
ALTER DATABASE [BankDB] SET  READ_WRITE 
GO
