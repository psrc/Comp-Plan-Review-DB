CREATE TABLE [dbo].[Plan]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[JurisdictionID] [int] NOT NULL,
[Year] [smallint] NOT NULL,
[AdoptionDate] [datetime2] NULL,
[PublicationDate] [datetime2] NULL,
[AppealDeadline] [datetime2] NULL,
[AppealFiled] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShapefileStatusID] [tinyint] NULL,
[GMPBDate] [datetime2] NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[isCompleted] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Plan] ADD CONSTRAINT [PK_Plan_ID] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Plan] ADD CONSTRAINT [FK_Plan_Jurisdiction] FOREIGN KEY ([JurisdictionID]) REFERENCES [dbo].[Jurisdiction] ([ID])
GO
ALTER TABLE [dbo].[Plan] ADD CONSTRAINT [FK_Plan_ShapefileStatus] FOREIGN KEY ([ShapefileStatusID]) REFERENCES [dbo].[ShapefileStatus] ([ID])
GO
