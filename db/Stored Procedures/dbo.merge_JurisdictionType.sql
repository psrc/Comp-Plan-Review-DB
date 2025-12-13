SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_JurisdictionType]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[JurisdictionType] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[JurisdictionType] AS target
    USING [stg].[JurisdictionType] AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[JurisdictionType] = source.[JurisdictionType]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [JurisdictionType])
        VALUES (source.[ID], source.[JurisdictionType])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[JurisdictionType] OFF;

END
GO
