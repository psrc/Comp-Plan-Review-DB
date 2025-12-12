CREATE TABLE [dbo].[MaterialsSource]
(
[ID] [int] NOT NULL,
[Source] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MaterialsSource] ADD CONSTRAINT [PK_MaterialsSource] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
