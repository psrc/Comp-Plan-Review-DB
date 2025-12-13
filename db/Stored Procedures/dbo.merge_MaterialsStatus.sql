SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_MaterialsStatus]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[MaterialsStatus] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[MaterialsStatus] AS target
    USING [stg].[MaterialsStatus] AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[Status] = source.[Status]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [Status])
        VALUES (source.[ID], source.[Status])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[MaterialsStatus] OFF;

END
GO
