CREATE TABLE [dbo].[Actions]
(
[Jurisdiction] [int] NULL,
[ActionsDate] [datetime] NULL,
[Actions] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActionsFile] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActionsID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
