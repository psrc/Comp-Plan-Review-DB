SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_MaterialsPhase]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[MaterialsPhase] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[MaterialsPhase] AS target
    USING [stg].[MaterialsPhase] AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[Phase] = source.[Phase]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [Phase])
        VALUES (source.[ID], source.[Phase])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[MaterialsPhase] OFF;

END
GO
