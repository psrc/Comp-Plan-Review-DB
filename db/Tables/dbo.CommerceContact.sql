CREATE TABLE [dbo].[CommerceContact]
(
[ID] [int] NOT NULL,
[CommerceContact] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CommerceContact] ADD CONSTRAINT [PK_CommerceContact] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
