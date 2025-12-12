CREATE TABLE [dbo].[Materials]
(
[MaterialID] [int] NOT NULL IDENTITY(1, 1),
[Jurisdiction] [int] NULL,
[MaterialDateReceived] [datetime] NULL,
[MaterialTitle] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaterialDescription] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaterialPhase] [int] NULL,
[MaterialStatus] [int] NULL,
[MaterialSource] [int] NULL,
[MaterialStaffReviewer] [int] NULL,
[MaterialNotes] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaterialReportingTool] [bit] NULL,
[MaterialFile] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaterialCommerceID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaterialTypeCFP] [bit] NULL,
[MaterialTypeCPP] [bit] NULL,
[MaterialTypeEconomicDevelopment] [bit] NULL,
[MaterialTypeFLUM] [bit] NULL,
[MaterialTypeFunctionalPlan] [bit] NULL,
[MaterialTypeFunctionalPlanSpecify] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaterialTypeHousing] [bit] NULL,
[MaterialTypeLandUse] [bit] NULL,
[MaterialTypeMinorAmendments] [bit] NULL,
[MaterialTypeOther] [bit] NULL,
[MaterialTypeOtherSpecify] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[DateAdded] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Materials] ADD CONSTRAINT [FK_Materials_MaterialsPhase] FOREIGN KEY ([MaterialPhase]) REFERENCES [dbo].[MaterialsPhase] ([ID])
GO
ALTER TABLE [dbo].[Materials] ADD CONSTRAINT [FK_Materials_MaterialsSource] FOREIGN KEY ([MaterialSource]) REFERENCES [dbo].[MaterialsSource] ([ID])
GO
ALTER TABLE [dbo].[Materials] ADD CONSTRAINT [FK_Materials_MaterialsStaffReviewer] FOREIGN KEY ([MaterialStaffReviewer]) REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[Materials] ADD CONSTRAINT [FK_Materials_MaterialsStatus] FOREIGN KEY ([MaterialStatus]) REFERENCES [dbo].[MaterialsStatus] ([ID])
GO
