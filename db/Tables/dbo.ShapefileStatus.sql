CREATE TABLE [dbo].[ShapefileStatus]
(
[ID] [tinyint] NOT NULL,
[Name] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShapefileStatus] ADD CONSTRAINT [PK_ShapefileStatus_ID] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
