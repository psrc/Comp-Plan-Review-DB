CREATE TABLE [dbo].[JurisdictionType]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[JurisdictionType] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SortOrder] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JurisdictionType] ADD CONSTRAINT [PK_JurisdictionType] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
