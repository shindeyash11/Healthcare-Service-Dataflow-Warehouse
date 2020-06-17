
/** Creating Lookup Table **/
  Drop table INPATIENT_STAGING;
  tRUNCATE TABLE Staging_FactInpatient
  Create table Staging_FactInpatient (
  [Provider Id] varchar(50),
  [Total Discharges_inpatient] Varchar(50),
  [Average Covered Charges_inpatient] Varchar(50),
  [Average Total Payments_inpatient] Varchar(50),
  [Average Medicare Payments_inpatient] Varchar(50),
  [Year] varchar(50) );





  dROP TABLE FactInpatient
  Create table FactInpatient (
  [Provider Id] varchar(50) ,
  [Total Discharges_inpatient] Varchar(50),
  [Average Covered Charges_inpatient] Varchar(50),
  [Average Total Payments_inpatient] Varchar(50),
  [Average Medicare Payments_inpatient] Varchar(50),
  [Year] varchar(50) );

  Select * from Staging_FactInpatient;
  Select * from FactInpatient;
  select row_number() over( order  by [Provider ID]	) as ProID,[Provider ID] into lookupProID  from [dbo].[staging_FactOutpatient] group by [Provider ID]
select * from lookupProID 

select row_number() over( order  by [APC]	) as ProID,[APC] into lookupAPCID  from [dbo].[staging_FactOutpatient] group by [APC]
select * from lookupAPCID 

/** Creating all the DIm and Fact table **/
CREATE TABLE [dbo].[FactSupplier](
	[HCPCS] [varchar](50) NULL,
	[Number of Referring Providers] [varchar](50) NULL,
	[Number of Suppliers] [varchar](50) NULL,
	[Number of Supplier Claims] [varchar](50) NULL,
	[Number of Supplier Services] [varchar](50) NULL,
	[Average Supplier Submitted Charges] [varchar](50) NULL,
	[Average Supplier Medicare Payment Amount] [varchar](50) NULL,
	[Year] [varchar](50) NULL
) ON [PRIMARY]
GO

aLTER TABLE [dbo].[FactSupplier]
ADD [HCPCS_key] [int] NULL

aLTER TABLE [dbo].[FactSupplier]
ADD [APC_key] [int] NULL
CREATE TABLE [dbo].[FactInpatient](
	[Provider Id] [varchar](50) NOT NULL,
	[Total Discharges_inpatient] [varchar](50) NULL,
	[Average Covered Charges_inpatient] [varchar](50) NULL,
	[Average Total Payments_inpatient] [varchar](50) NULL,
	[Average Medicare Payments_inpatient] [varchar](50) NULL,
	[Year] [varchar](50) NULL
) ON [PRIMARY]
GO

SELECT * FROM [dbo].[FactInpatient]

Alter table [dbo].[FactInpatient]
add [OutpatientKey] [int]  NULL;

CREATE TABLE [dbo].[dim_HCPCS](
    [HCPCS_key] [int] IDENTITY(1,1) NOT NULL,
    [HCPCS_Id] [varchar](50) NULL,
   
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dim_APC](
    [APC_key] [int] IDENTITY(1,1) NOT NULL,
    [APC_ID] [varchar](50) NULL,
   
) ON [PRIMARY]
GO


DROP TABLE DimOutpatient

CREATE TABLE [dbo].[Dimpatient](
    [OutpatientKey] [int] IDENTITY(1,1) NOT NULL,
	[Provider ID] [varchar](50) NULL,
	[Provider Name] [varchar](50) NULL,
	[Provider Street Address] [varchar](50) NULL,
	[Provider City] [varchar](50) NULL,
	[Provider State] [varchar](50) NULL,
	[Provider Zip Code] [varchar](50) NULL,
	[Year] [varchar](50) NULL
) ON [PRIMARY]
GO

GO

CREATE TABLE [dbo].[staging_DimInpatient](
	[Provider Id] [varchar](50) NULL,
	[Provider City] [varchar](50) NULL,
	[Provider State] [varchar](50) NULL,
	[Provider Zip Code] [varchar](50) NULL,
	[Year] varchar(50)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DimInpatient](
	[Provider Id] [varchar](50) NULL,
	[Provider City] [varchar](50) NULL,
	[Provider State] [varchar](50) NULL,
	[Provider Zip Code] [varchar](50) NULL,
	[Year] varchar(50)
) ON [PRIMARY]
GO

select * from [DimInpatient]
select * from [staging_DimInpatient]


Drop table [dbo].[staging_FactSupplier]
Drop table [dbo].[FactSupplier]

CREATE TABLE [dbo].[staging_FactSupplier](
	[HCPCS] [varchar](50) NULL,
	[Number of Referring Providers] [varchar](50) NULL,
	[Number of Suppliers] [varchar](50) NULL,
	[Number of Supplier Claims] [varchar](50) NULL,
	[Number of Supplier Services] [varchar](50) NULL,
	[Average Supplier Submitted Charges] [varchar](50) NULL,
	[Average Supplier Medicare Payment Amount] [varchar](50) NULL,
	[Year] varchar(50) null,
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[FactSupplier](
	[HCPCS] [varchar](50) NULL,
	[Number of Referring Providers] [varchar](50) NULL,
	[Number of Suppliers] [varchar](50) NULL,
	[Number of Supplier Claims] [varchar](50) NULL,
	[Number of Supplier Services] [varchar](50) NULL,
	[Average Supplier Submitted Charges] [varchar](50) NULL,
	[Average Supplier Medicare Payment Amount] [varchar](50) NULL,
	[Year] varchar(50) null,
) ON [PRIMARY]
GO

Select * from [staging_FactSupplier]
Select * from [FactSupplier]
