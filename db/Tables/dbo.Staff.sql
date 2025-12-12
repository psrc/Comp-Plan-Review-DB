CREATE TABLE [dbo].[Staff]
(
[Staff] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [int] NOT NULL,
[Staff_short] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staff] ADD CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
