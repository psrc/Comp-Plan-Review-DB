SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_CommerceContact]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[CommerceContact] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[CommerceContact] AS target
    USING [stg].[CommerceContact] AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[CommerceContact] = source.[CommerceContact]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [CommerceContact])
        VALUES (source.[ID], source.[CommerceContact])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[CommerceContact] OFF;

END
GO
