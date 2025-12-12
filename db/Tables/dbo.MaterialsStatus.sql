CREATE TABLE [dbo].[MaterialsStatus]
(
[ID] [int] NOT NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MaterialsStatus] ADD CONSTRAINT [PK_MaterialsStatus] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
