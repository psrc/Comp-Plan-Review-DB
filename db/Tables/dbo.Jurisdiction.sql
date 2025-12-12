CREATE TABLE [dbo].[Jurisdiction]
(
[ID] [int] NOT NULL,
[JurisdictionDisplayName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jurisdiction] [int] NULL,
[JurisdictionType] [int] NULL,
[JurisdictionParent1] [int] NULL,
[JurisdictionParent2] [int] NULL,
[RegionalGeography] [int] NULL,
[CertificationDate] [datetime] NULL,
[Certified] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactName1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactTitle1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactPhone1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactEmail1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactName2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactTitle2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactPhone2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactEmail2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AirportAdjacent] [bit] NULL,
[StaffContact] [int] NULL,
[CommerceContact] [int] NULL,
[FormSort] [int] NULL,
[JurisdictionSortName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Jurisdiction] ADD CONSTRAINT [PK_Jurisdiction] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Jurisdiction] ADD CONSTRAINT [FK_Jurisdiction_CommerceContact] FOREIGN KEY ([CommerceContact]) REFERENCES [dbo].[CommerceContact] ([ID])
GO
ALTER TABLE [dbo].[Jurisdiction] ADD CONSTRAINT [FK_Jurisdiction_JurisdictionParent1] FOREIGN KEY ([JurisdictionParent1]) REFERENCES [dbo].[Jurisdiction] ([ID])
GO
ALTER TABLE [dbo].[Jurisdiction] ADD CONSTRAINT [FK_Jurisdiction_JurisdictionParent2] FOREIGN KEY ([JurisdictionParent2]) REFERENCES [dbo].[Jurisdiction] ([ID])
GO
ALTER TABLE [dbo].[Jurisdiction] ADD CONSTRAINT [FK_Jurisdiction_JurisdictionType] FOREIGN KEY ([JurisdictionType]) REFERENCES [dbo].[JurisdictionType] ([ID])
GO
ALTER TABLE [dbo].[Jurisdiction] ADD CONSTRAINT [FK_Jurisdiction_RegionalGeography] FOREIGN KEY ([RegionalGeography]) REFERENCES [dbo].[RegionalGeography] ([ID])
GO
ALTER TABLE [dbo].[Jurisdiction] ADD CONSTRAINT [FK_Jurisdiction_Staff] FOREIGN KEY ([StaffContact]) REFERENCES [dbo].[Staff] ([ID])
GO
