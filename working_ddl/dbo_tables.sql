use CompPlanReview
go

select * from stg.Actions


drop table if exists dbo.Actions;
CREATE TABLE [dbo].[Actions](
	[ID] [int] identity not NULL ,
	[Jurisdiction] [int] NULL,
	[ActionsDate] [datetime] NULL,
	[Actions] [varchar](255) NULL,
	[ActionsFile] [varchar](344) NULL
) ON [PRIMARY]
GO


drop table if exists dbo.CommerceContact;
CREATE TABLE [dbo].[CommerceContact](
	[ID] [int] IDENTITY NOT NULL,
	[CommerceContact] [varchar](255) NULL
) ON [PRIMARY]
GO

drop table if exists dbo.Correspondence;
CREATE TABLE [dbo].[Correspondence](
	[ID] [int] identity not NULL,
	[CorrespondenceDate] [datetime] NULL,
	[CorrespondenceDescription] [varchar](635) NULL,
	[CorrespondenceFile] [varchar](364) NULL,
	[Jurisdiction] [int] NULL
) ON [PRIMARY]
GO

drop table if exists dbo.DatabaseChangeLog;
CREATE TABLE [dbo].[DatabaseChangeLog](
	[ID] [int] identity not NULL,
	[Notes] [varchar](256) NULL,
	[DateOfChange] [datetime] NULL,
	[Staff] [varchar](255) NULL
) ON [PRIMARY]
GO

drop table if exists dbo.DatabaseHints;
CREATE TABLE [dbo].[DatabaseHints](
	[ID] [int] identity not NULL, 
	[Title] [varchar](255) NULL,
	[Notes] [varchar](max) NULL,
	[DateAdded] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


drop table if exists dbo.Jurisdiction;
CREATE TABLE [dbo].[Jurisdiction](
	[ID] [int] identity not NULL,
	[DisplayName] [nvarchar](255) NULL,
	[SortName] [nvarchar](255) NULL,
	[JurisdictionType] [int] NULL,
	[JurisdictionParent1] [int] NULL,
	[JurisdictionParent2] [int] NULL,
	[RegionalGeography] [int] NULL,
	[CertificationDate] [datetime] NULL,
	[Certified] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[ContactName1] [varchar](255) NULL,
	[ContactTitle1] [varchar](255) NULL,
	[ContactPhone1] [varchar](255) NULL,
	[ContactEmail1] [varchar](255) NULL,
	[ContactName2] [varchar](255) NULL,
	[ContactTitle2] [varchar](255) NULL,
	[ContactPhone2] [varchar](255) NULL,
	[ContactEmail2] [varchar](255) NULL,
	[AirportAdjacent] [bit] NULL,
	[StaffContact] [int] NULL,
	[CommerceContact] [int] NULL,
	[FormSort] [int] NULL,
	constraint PK_Jurisdiction_ID primary key clustered (ID)
) ON [PRIMARY]
GO


drop table if exists dbo.JurisdictionGeography;
CREATE TABLE [dbo].[JurisdictionGeography](
	[ID] [int] identity not  NULL,
	[RegionalGeography] [varchar](255) NULL
) ON [PRIMARY]
GO

drop table if exists dbo.JurisdictionType;
CREATE TABLE [dbo].[JurisdictionType](
	[ID] [int] identity not NULL,
	[JurisdictionType] [varchar](255) NULL
) ON [PRIMARY]
GO

drop table if exists dbo.Staff;
CREATE TABLE [dbo].[Staff](
	[ID] [int] identity not NULL,
	[Staff] [varchar](255) NULL,
	[Staff_short] [varchar](255) NULL
) ON [PRIMARY]
GO

drop table if exists dbo.Materials;
CREATE TABLE [dbo].[Materials](
	[ID] [int] identity not NULL,
	[PlanID] int null,
	[Jurisdiction] [int] NULL,
	[MaterialDateReceived] [datetime] NULL,
	[MaterialTitle] [varchar](255) NULL,
	[MaterialDescription] [varchar](1174) NULL,
	[MaterialPhase] [int] NULL,
	[MaterialStatus] [int] NULL,
	[MaterialSource] [int] NULL,
	[MaterialStaffReviewer] [int] NULL,
	[MaterialNotes] [varchar](255) NULL,
	[MaterialReportingTool] [bit] NULL,
	[MaterialFile] [varchar](396) NULL,
	[MaterialCommerceID] [varchar](255) NULL,
	[MaterialTypeCFP] [bit] NULL,
	[MaterialTypeCPP] [bit] NULL,
	[MaterialTypeEconomicDevelopment] [bit] NULL,
	[MaterialTypeFLUM] [bit] NULL,
	[MaterialTypeFunctionalPlan] [bit] NULL,
	[MaterialTypeFunctionalPlanSpecify] [varchar](255) NULL,
	[MaterialTypeHousing] [bit] NULL,
	[MaterialTypeLandUse] [bit] NULL,
	[MaterialTypeMinorAmendments] [bit] NULL,
	[MaterialTypeOther] [bit] NULL,
	[MaterialTypeOtherSpecify] [varchar](255) NULL,
	[MaterialTypeParks] [bit] NULL,
	[MaterialTypePeriodicUpdate] [bit] NULL,
	[MaterialTypeRegionalCenter] [bit] NULL,
	[MaterialTypeRural] [bit] NULL,
	[MaterialTypeScopingNotice] [bit] NULL,
	[MaterialTypeSMP] [bit] NULL,
	[MaterialTypeSubareaPlan] [bit] NULL,
	[MaterialTypeTransportation] [bit] NULL,
	[MaterialTypeUGAChange] [bit] NULL,
	[MaterialTypeUtilities] [bit] NULL,
	[DateAdded] [datetime] NULL,
	constraint PK_Materials_id primary key clustered (ID),
	constraint FK_Materials_Plan foreign key(PlanID)
		references dbo.[Plan](ID)
) ON [PRIMARY]
GO

drop table if exists dbo.[MaterialsReviewer]
CREATE TABLE dbo.[MaterialsReviewer](
	[MaterialsID] int not null,
	[StaffID] int not null,
	[SectionAssignment] nvarchar(50) null,
	constraint PK_MaterialsReviewer primary key clustered ([MaterialsID],[StaffID]),
	constraint FK_MaterialsReviewer_Materials foreign key([MaterialsID])
		references dbo.[Materials]([ID]),
	constraint FK_MaterialsReviewer_Staff foreign key([StaffID])
		references dbo.[Staff]([ID])
)

drop table if exists dbo.MaterialsPhase;
CREATE TABLE [dbo].[MaterialsPhase](
	[ID] [int] identity not NULL,
	[Phase] [varchar](255) NULL
) ON [PRIMARY]
GO


drop table if exists dbo.MaterialsSource;
CREATE TABLE [dbo].[MaterialsSource](
	[ID] [int] identity not NULL,
	[Source] [varchar](255) NULL
) ON [PRIMARY]
GO


drop table if exists dbo.MaterialsStatus;
CREATE TABLE [dbo].[MaterialsStatus](
	[ID] [int] identity not NULL,
	[Status] [varchar](255) NULL
) ON [PRIMARY]
GO


drop table if exists dbo.Notes;
CREATE TABLE [dbo].[Notes](
	[Jurisdiction] [int] identity not NULL,
	[NotesStaff] [varchar](255) NULL,
	[Notes] [varchar](1470) NULL,
	[NotesDate] [datetime] NULL,
	[NotesID] [int] NULL
) ON [PRIMARY]
GO


drop table if exists dbo.ShapefileStatus
create table dbo.ShapefileStatus  -- added 7/16/26
(
    ID tinyint not null,
    [Name] nvarchar(20) null,
    constraint PK_ShapefileStatus_ID primary key clustered (ID)
)



drop table if exists dbo.[Plan] 
create table dbo.[Plan] -- added 7/16/26
(
    ID int identity not null,
    JurisdictionID int not null,
    [Year] smallint not null,
    AdoptionDate datetime2 null,
    PublicationDate datetime2 null,
    AppealDeadline datetime2 null,
    AppealFiled nvarchar(20) null,
    ShapefileStatusID tinyint null, 
    GMPBDate datetime2 null,
    [Name] nvarchar(50) null,
    isCompleted bit null,
    constraint PK_Plan_ID primary key clustered (ID),
    constraint FK_Plan_Jurisdiction foreign key(JurisdictionID) 
        references dbo.Jurisdiction ([ID]),
    constraint FK_Plan_ShapefileStatus foreign key(ShapefileStatusID)
        references dbo.ShapefileStatus ([ID])
);


drop table if exists dbo.PlanNote 
create table dbo.PlanNote -- added 7/16/26
(
    ID bigint identity not null,
    PlanID int not null,
    MaterialID int null,
	ReviewerID int not null,
    Note nvarchar(2000) not null,
	EntryDate datetime2 null,
    constraint PK_PlanNote_ID primary key clustered (ID),
    constraint FK_PlanNote_Plan foreign key(PlanID) 
        references dbo.[Plan] ([ID]),
    constraint FK_PlanNote_Materials foreign key(MaterialID) 
        references dbo.[Materials] ([ID]),
	constraint FK_PlanNote_ReviewerID foreign key(ReviewerID)
		references dbo.[Staff]([ID])
)



EXEC [dbo].merge_Actions;
EXEC [dbo].merge_Staff;
EXEC [dbo].merge_Notes;
EXEC [dbo].merge_MaterialsStatus;
EXEC [dbo].merge_MaterialsPhase;
EXEC [dbo].merge_MaterialsSource;
EXEC [dbo].merge_Materials;
EXEC [dbo].merge_JurisdictionType;
EXEC [dbo].merge_JurisdictionGeography;
EXEC [dbo].merge_DatabaseHints;
EXEC [dbo].merge_DatabaseChangeLog;
EXEC [dbo].merge_Correspondence;
EXEC [dbo].merge_CommerceContact;
EXEC [dbo].merge_Jurisdiction;
exec [dbo].merge_ShapefileStatus;
exec dbo.bulk_insert_Plan 2026

-- need sprocs for table Plan, 
