USE [master]
GO
/****** Object:  Database [PropertyAnalysisDW]    Script Date: 08/08/2022 11:27:32 ******/
CREATE DATABASE [PropertyAnalysisDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PropertyAnalysis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyAnalysis.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PropertyAnalysis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyAnalysis_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PropertyAnalysisDW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PropertyAnalysisDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PropertyAnalysisDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PropertyAnalysisDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PropertyAnalysisDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PropertyAnalysisDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PropertyAnalysisDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET RECOVERY FULL 
GO
ALTER DATABASE [PropertyAnalysisDW] SET  MULTI_USER 
GO
ALTER DATABASE [PropertyAnalysisDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PropertyAnalysisDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PropertyAnalysisDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PropertyAnalysisDW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PropertyAnalysisDW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PropertyAnalysisDW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PropertyAnalysisDW', N'ON'
GO
ALTER DATABASE [PropertyAnalysisDW] SET QUERY_STORE = OFF
GO
USE [PropertyAnalysisDW]
GO
/****** Object:  Table [dbo].[DimCounty]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCounty](
	[CountyKey] [bigint] NULL,
	[RegionKey] [nvarchar](max) NULL,
	[County] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[Date] [datetime2](0) NULL,
	[FiscalYear] [nvarchar](max) NULL,
	[StartOfMonth] [datetime2](0) NULL,
	[EndOfMonth] [datetime2](0) NULL,
	[StartOfQuarter] [datetime2](0) NULL,
	[EndOfQuarter] [datetime2](0) NULL,
	[Quarter] [bigint] NULL,
	[FiscalQuarter] [nvarchar](max) NULL,
	[DateKey] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEstablishmentType]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEstablishmentType](
	[EstablishmentId] [bigint] NULL,
	[EstablishmentNumber] [bigint] NULL,
	[EstablishmentType] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGender]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGender](
	[Gender] [nvarchar](max) NULL,
	[GenderKey] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLineProvider]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLineProvider](
	[TubeLineId] [bigint] NULL,
	[TubeLine] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[LocationId] [bigint] NULL,
	[Easting] [bigint] NULL,
	[Northing] [bigint] NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimNetworkProvider]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimNetworkProvider](
	[Network Provider Id] [bigint] NULL,
	[Network Provider] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRegion]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRegion](
	[RegionKey] [bigint] NULL,
	[Region] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRevenueCategory]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRevenueCategory](
	[RevenueCategoryId] [bigint] NULL,
	[RevenueCategory] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSchoolCategory]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSchoolCategory](
	[CategoryId] [bigint] NULL,
	[Category] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStatus]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStatus](
	[StatusId] [bigint] NULL,
	[Status] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSuburb]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSuburb](
	[URN] [bigint] NULL,
	[RegionKey] [nvarchar](max) NULL,
	[Easting] [bigint] NULL,
	[Northing] [bigint] NULL,
	[Town] [nvarchar](max) NULL,
	[Postcode] [nvarchar](max) NULL,
	[StreetLocality] [nvarchar](max) NULL,
	[SuburbKey] [bigint] NULL,
	[CountyKey] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EduBase]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EduBase](
	[URN] [bigint] NULL,
	[LA (code)] [bigint] NULL,
	[LA (name)] [nvarchar](max) NULL,
	[EstablishmentNumber] [bigint] NULL,
	[EstablishmentName] [nvarchar](max) NULL,
	[OpenDate] [datetime2](0) NULL,
	[StatutoryLowAge] [bigint] NULL,
	[StatutoryHighAge] [bigint] NULL,
	[County] [nvarchar](max) NULL,
	[Postcode] [nvarchar](max) NULL,
	[Region] [nvarchar](max) NULL,
	[SuburbKey] [bigint] NULL,
	[DetailId] [bigint] NULL,
	[StatusId] [bigint] NULL,
	[EstablishmentId] [bigint] NULL,
	[CategoryId] [bigint] NULL,
	[GenderKey] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactRevenue]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactRevenue](
	[Code] [nvarchar](max) NULL,
	[Town] [nvarchar](max) NULL,
	[Date] [datetime2](0) NULL,
	[DataValue] [bigint] NULL,
	[FiscalYear] [bigint] NULL,
	[FiscalQuarter] [nvarchar](max) NULL,
	[RevenueCategoryId] [bigint] NULL,
	[DateKey] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSalesMax]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSalesMax](
	[RevenueCategoryId] [bigint] NULL,
	[DimRevenueCategory.RevenueCategory] [nvarchar](max) NULL,
	[Max] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolDetails]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolDetails](
	[Headteacher] [nvarchar](max) NULL,
	[SchoolWebsite] [nvarchar](max) NULL,
	[MainEmail] [nvarchar](max) NULL,
	[TelephoneNum] [bigint] NULL,
	[FaxNum] [bigint] NULL,
	[DetailId] [bigint] NULL,
	[URN] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolsByRegionGenderAndStatus]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolsByRegionGenderAndStatus](
	[Region] [nvarchar](max) NULL,
	[DimGender.Gender] [nvarchar](max) NULL,
	[DimStatus.Status] [nvarchar](max) NULL,
	[Count] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stations]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[Name] [nvarchar](max) NULL,
	[Network Provider Id] [bigint] NULL,
	[TubeLineId] [bigint] NULL,
	[Zone] [bigint] NULL,
	[LocationId] [bigint] NULL,
	[StationId] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StationsByNetworkProvider]    Script Date: 08/08/2022 11:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StationsByNetworkProvider](
	[Network Provider Id] [bigint] NULL,
	[Network Provider] [nvarchar](max) NULL,
	[No. of stations] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [PropertyAnalysisDW] SET  READ_WRITE 
GO
