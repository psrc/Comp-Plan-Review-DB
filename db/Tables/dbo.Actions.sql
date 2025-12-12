CREATE TABLE [dbo].[Actions]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Jurisdiction] [int] NULL,
[ActionsDate] [datetime] NULL,
[Actions] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActionsFile] [varchar] (344) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
