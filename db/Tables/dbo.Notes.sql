CREATE TABLE [dbo].[Notes]
(
[Jurisdiction] [int] NULL,
[NotesStaff] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Notes] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NotesDate] [datetime] NULL,
[NotesID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
