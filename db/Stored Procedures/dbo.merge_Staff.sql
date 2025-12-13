SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_Staff]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[Staff] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[Staff] AS target
    USING [stg].[Staff] AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[Staff] = source.[Staff],
            target.[Staff_short] = source.[Staff_short]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [Staff], [Staff_short])
        VALUES (source.[ID], source.[Staff], source.[Staff_short])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[Staff] OFF;

END
GO
