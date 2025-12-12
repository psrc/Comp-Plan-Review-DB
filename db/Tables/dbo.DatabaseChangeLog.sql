CREATE TABLE [dbo].[DatabaseChangeLog]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Notes] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateOfChange] [datetime] NULL,
[Staff] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
