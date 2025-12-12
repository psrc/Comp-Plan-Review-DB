CREATE TABLE [dbo].[MaterialsPhase]
(
[ID] [int] NOT NULL,
[Phase] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MaterialsPhase] ADD CONSTRAINT [PK_MaterialsPhase] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
