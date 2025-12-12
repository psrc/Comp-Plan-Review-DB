CREATE TABLE [stg].[DatabaseChangeLog]
(
[ID] [int] NULL,
[Notes] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateOfChange] [datetime] NULL,
[Staff] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
