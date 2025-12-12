CREATE TABLE [dbo].[Correspondence]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[CorrespondenceDate] [datetime] NULL,
[CorrespondenceDescription] [varchar] (635) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CorrespondenceFile] [varchar] (364) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jurisdiction] [int] NULL
) ON [PRIMARY]
GO
