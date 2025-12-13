SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_JurisdictionGeography]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[JurisdictionGeography] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[JurisdictionGeography] AS target
    USING [stg].[JurisdictionGeography] AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[RegionalGeography] = source.[RegionalGeography]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [RegionalGeography])
        VALUES (source.[ID], source.[RegionalGeography])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[JurisdictionGeography] OFF;

END
GO
