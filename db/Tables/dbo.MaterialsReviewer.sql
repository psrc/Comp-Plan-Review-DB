CREATE TABLE [dbo].[MaterialsReviewer]
(
[MaterialsID] [int] NOT NULL,
[StaffID] [int] NOT NULL,
[SectionAssignment] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MaterialsReviewer] ADD CONSTRAINT [PK_MaterialsReviewer] PRIMARY KEY CLUSTERED ([MaterialsID], [StaffID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MaterialsReviewer] ADD CONSTRAINT [FK_MaterialsReviewer_Materials] FOREIGN KEY ([MaterialsID]) REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[MaterialsReviewer] ADD CONSTRAINT [FK_MaterialsReviewer_Staff] FOREIGN KEY ([StaffID]) REFERENCES [dbo].[Staff] ([ID])
GO
