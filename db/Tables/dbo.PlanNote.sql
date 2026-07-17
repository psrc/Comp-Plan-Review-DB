CREATE TABLE [dbo].[PlanNote]
(
[ID] [bigint] NOT NULL IDENTITY(1, 1),
[PlanID] [int] NOT NULL,
[MaterialID] [int] NULL,
[ReviewerID] [int] NOT NULL,
[Note] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EntryDate] [datetime2] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PlanNote] ADD CONSTRAINT [PK_PlanNote_ID] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PlanNote] ADD CONSTRAINT [FK_PlanNote_Materials] FOREIGN KEY ([MaterialID]) REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[PlanNote] ADD CONSTRAINT [FK_PlanNote_Plan] FOREIGN KEY ([PlanID]) REFERENCES [dbo].[Plan] ([ID])
GO
ALTER TABLE [dbo].[PlanNote] ADD CONSTRAINT [FK_PlanNote_ReviewerID] FOREIGN KEY ([ReviewerID]) REFERENCES [dbo].[Staff] ([ID])
GO
