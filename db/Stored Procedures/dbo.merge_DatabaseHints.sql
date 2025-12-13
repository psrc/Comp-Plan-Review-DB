SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_DatabaseHints]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[DatabaseHints] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[DatabaseHints] AS target
    USING [stg].[DatabaseHints] AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[Title] = source.[Title],
            target.[Notes] = source.[Notes],
            target.[DateAdded] = source.[DateAdded]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [Title], [Notes], [DateAdded])
        VALUES (source.[ID], source.[Title], source.[Notes], source.[DateAdded])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[DatabaseHints] OFF;

END
GO
