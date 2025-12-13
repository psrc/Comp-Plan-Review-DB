SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_Actions]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[Actions] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[Actions] AS target
    USING [stg].[Actions] AS source
    ON target.[ID] = source.[ActionsID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[Jurisdiction] = source.[Jurisdiction],
            target.[ActionsDate] = source.[ActionsDate],
            target.[Actions] = source.[Actions],
            target.[ActionsFile] = source.[ActionsFile]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [Jurisdiction], [ActionsDate], [Actions], [ActionsFile])
        VALUES (source.[ActionsID], source.[Jurisdiction], source.[ActionsDate], source.[Actions], source.[ActionsFile])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[Actions] OFF;

END
GO
