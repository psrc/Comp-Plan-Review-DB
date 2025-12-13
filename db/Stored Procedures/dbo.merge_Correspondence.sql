SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_Correspondence]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[Correspondence] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[Correspondence] AS target
    USING [stg].[Correspondence] AS source
    ON target.[ID] = source.[CorrespondenceID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[CorrespondenceDate] = source.[CorrespondenceDate],
            target.[CorrespondenceDescription] = source.[CorrespondenceDescription],
            target.[CorrespondenceFile] = source.[CorrespondenceFile],
            target.[Jurisdiction] = source.[Jurisdiction]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([ID], [CorrespondenceDate], [CorrespondenceDescription], [CorrespondenceFile], [Jurisdiction])
        VALUES (source.[CorrespondenceID], source.[CorrespondenceDate], source.[CorrespondenceDescription], source.[CorrespondenceFile], source.[Jurisdiction])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[Correspondence] OFF;

END
GO
