CREATE TABLE [dbo].[Correspondence]
(
[CorrespondenceDate] [datetime] NULL,
[CorrespondenceDescription] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CorrespondenceFile] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CorrespondenceID] [int] NOT NULL IDENTITY(1, 1),
[Jurisdiction] [int] NULL
) ON [PRIMARY]
GO
