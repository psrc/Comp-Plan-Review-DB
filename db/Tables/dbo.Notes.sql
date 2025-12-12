CREATE TABLE [dbo].[Notes]
(
[Jurisdiction] [int] NOT NULL IDENTITY(1, 1),
[NotesStaff] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Notes] [varchar] (1470) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NotesDate] [datetime] NULL,
[NotesID] [int] NULL
) ON [PRIMARY]
GO
