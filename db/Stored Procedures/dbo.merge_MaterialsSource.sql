SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_MaterialsSource]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[MaterialsSource] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[MaterialsSource] AS target
    USING [stg].[MaterialsSource] AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[Source] = source.[Source]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [Source])
        VALUES (source.[ID], source.[Source])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[MaterialsSource] OFF;

END
GO
