CREATE TABLE [dbo].[RegionalGeography]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[RegionalGeography] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RegionalGeography] ADD CONSTRAINT [PK_RegionalGeography] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
