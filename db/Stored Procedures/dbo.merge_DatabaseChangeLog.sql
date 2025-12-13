SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_DatabaseChangeLog]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[DatabaseChangeLog] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[DatabaseChangeLog] AS target
    USING [stg].[DatabaseChangeLog] AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[Notes] = source.[Notes],
            target.[DateOfChange] = source.[DateOfChange],
            target.[Staff] = source.[Staff]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [Notes], [DateOfChange], [Staff])
        VALUES (source.[ID], source.[Notes], source.[DateOfChange], source.[Staff])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[DatabaseChangeLog] OFF;

END
GO
