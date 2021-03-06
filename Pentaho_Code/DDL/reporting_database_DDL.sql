USE [reporting]
GO
/****** Object:  User [reddraider]    Script Date: 5/9/2017 6:42:08 AM ******/
CREATE USER [reddraider] FOR LOGIN [reddraider] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [reddraider]
GO
/****** Object:  Schema [mrt]    Script Date: 5/9/2017 6:42:09 AM ******/
CREATE SCHEMA [mrt]
GO
/****** Object:  Schema [stg]    Script Date: 5/9/2017 6:42:09 AM ******/
CREATE SCHEMA [stg]
GO
/****** Object:  Table [mrt].[Dim_Address]    Script Date: 5/9/2017 6:42:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [mrt].[Dim_Address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[Street_Address_NM] [varchar](100) NULL,
	[Latitude_NM] [varchar](20) NULL,
	[Longitude_NM] [varchar](20) NULL,
	[City_NM] [varchar](100) NULL,
	[State_NM] [varchar](50) NULL,
	[ZipCode_NR] [int] NULL,
	[Create_DT] [datetime] NULL,
 CONSTRAINT [XPKDim_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [mrt].[Dim_Agency]    Script Date: 5/9/2017 6:42:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [mrt].[Dim_Agency](
	[Agency_ID] [int] IDENTITY(1,1) NOT NULL,
	[Federal_Agency_NM] [varchar](100) NULL,
	[Federal_Agency_ID] [int] NULL,
	[Create_DT] [datetime] NULL,
 CONSTRAINT [XPKDim_Agency] PRIMARY KEY CLUSTERED 
(
	[Agency_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [mrt].[Dim_Fuel]    Script Date: 5/9/2017 6:42:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [mrt].[Dim_Fuel](
	[Fuel_ID] [int] IDENTITY(1,1) NOT NULL,
	[Fuel_Type_NM] [varchar](100) NULL,
	[Fuel_Type_CD] [varchar](20) NULL,
	[EV_Network_NM] [varchar](100) NULL,
	[Create_DT] [datetime] NULL,
	[EV_Connector_Types_NM] [varchar](100) NULL,
 CONSTRAINT [XPKDim_Fuel] PRIMARY KEY CLUSTERED 
(
	[Fuel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [mrt].[Dim_Station]    Script Date: 5/9/2017 6:42:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [mrt].[Dim_Station](
	[Station_NM] [varchar](100) NULL,
	[Station_ID] [int] IDENTITY(1,1) NOT NULL,
	[Station_Phone] [varchar](100) NULL,
	[Owner_Type_CD] [varchar](100) NULL,
	[Open_DT] [varchar](20) NULL,
	[Cards_Accepted_CD] [varchar](100) NULL,
	[Owner_Type_NM] [varchar](50) NULL,
	[Access_Type_NM] [varchar](100) NULL,
	[Create_DT] [datetime] NULL,
 CONSTRAINT [XPKDim_Station] PRIMARY KEY CLUSTERED 
(
	[Station_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [mrt].[Fuel_Stations_Fact]    Script Date: 5/9/2017 6:42:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mrt].[Fuel_Stations_Fact](
	[Fuel_Station_Fact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Address_ID] [int] NULL,
	[Fuel_ID] [int] NULL,
	[Station_ID] [int] NULL,
	[Station_VL] [int] NULL,
	[Create_DT] [datetime] NULL,
	[Agency_ID] [int] NULL,
 CONSTRAINT [XPKFuel_Stations_Fact] PRIMARY KEY CLUSTERED 
(
	[Fuel_Station_Fact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [stg].[fuel_stations]    Script Date: 5/9/2017 6:42:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg].[fuel_stations](
	[access_days_time] [varchar](100) NULL,
	[bd_blends] [varchar](100) NULL,
	[cards_accepted] [varchar](100) NULL,
	[city] [varchar](100) NULL,
	[date_last_confirmed] [varchar](100) NULL,
	[expected_date] [varchar](100) NULL,
	[fuel_type_code] [varchar](100) NULL,
	[geocode_status] [varchar](100) NULL,
	[groups_with_access_code] [varchar](100) NULL,
	[hy_status_link] [varchar](100) NULL,
	[intersection_directions] [varchar](100) NULL,
	[latitude] [varchar](100) NULL,
	[longitude] [varchar](100) NULL,
	[open_date] [varchar](100) NULL,
	[owner_type_code] [varchar](100) NULL,
	[plus4] [varchar](100) NULL,
	[station_name] [varchar](100) NULL,
	[station_phone] [varchar](100) NULL,
	[status_code] [varchar](100) NULL,
	[street_address] [varchar](100) NULL,
	[zip] [varchar](100) NULL,
	[state] [varchar](100) NULL,
	[ng_fill_type_code] [varchar](100) NULL,
	[ng_psi] [varchar](100) NULL,
	[ng_vehicle_class] [varchar](100) NULL,
	[e85_blender_pump] [varchar](100) NULL,
	[ev_level1_evse_num] [varchar](100) NULL,
	[ev_level2_evse_num] [varchar](100) NULL,
	[ev_dc_fast_num] [varchar](100) NULL,
	[ev_other_evse] [varchar](100) NULL,
	[ev_network] [varchar](100) NULL,
	[ev_network_web] [varchar](100) NULL,
	[lpg_primary] [varchar](100) NULL,
	[id] [varchar](100) NULL,
	[updated_at] [varchar](100) NULL,
	[federal_agency] [varchar](100) NULL,
	[ev_connector_types] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Fuel_Station_Mart]    Script Date: 5/9/2017 6:42:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Fuel_Station_Mart]
as
(

select 
a.[Street_Address_NM] as [Street Address]
,a.[Latitude_NM] as [Latitude]
,a.[Longitude_NM] as [Longitude]
,a.[City_NM] as [City]
,a.[State_NM] as [State]
,a.[ZipCode_NR] as [Zip Code]
,ag.[Federal_Agency_NM] as [Federal Agency]
,fu.[Fuel_Type_CD] as [Fuel Type Code]
,fu.[Fuel_Type_NM] as [Fuel Type Name]
,fu.[EV_Network_NM] as [EV Network Name]
,fu.[EV_Connector_Types_NM] as [EV Connector Type]
,s.[Station_NM] as [Station]
,s.[Station_Phone] as [Station Phone]
,s.[Owner_Type_CD] as [Owner Type Code]
,s.[Owner_Type_NM] as [Owner Type Name]
,s.[Cards_Accepted_CD] as [Cards Accepted]
,s.[Access_Type_NM] as [Access Type]
,f.Station_VL as [Count]
from 
[mrt].[Fuel_Stations_Fact] f
left join mrt.dim_address a on a.Address_ID = f.Address_ID
left join mrt.dim_agency ag on ag.Agency_ID = f.Agency_ID
left join mrt.dim_fuel fu on fu.Fuel_ID = f.Fuel_ID
left join mrt.dim_station s on s.station_id = f.station_id
)

GO
