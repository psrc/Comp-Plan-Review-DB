CREATE TABLE [dbo].[Jurisdiction]
(
[Jurisdiction] [int] NULL,
[DisplayName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SortName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JurisdictionType] [int] NULL,
[JurisdictionParent1] [int] NULL,
[JurisdictionParent2] [int] NULL,
[RegionalGeography] [int] NULL,
[CertificationDate] [datetime] NULL,
[Certified] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactName1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactTitle1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactPhone1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactEmail1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactName2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactTitle2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactPhone2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactEmail2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AirportAdjacent] [bit] NULL,
[StaffContact] [int] NULL,
[CommerceContact] [int] NULL,
[FormSort] [int] NULL
) ON [PRIMARY]
GO
