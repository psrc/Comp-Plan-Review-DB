SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_Notes]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit Jurisdiction values from staging
    -- Note: In this table, Jurisdiction is the IDENTITY column
    SET IDENTITY_INSERT [dbo].[Notes] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[Notes] AS target
    USING [stg].[Notes] AS source
    ON target.[Jurisdiction] = source.[Jurisdiction]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[NotesStaff] = source.[NotesStaff],
            target.[Notes] = source.[Notes],
            target.[NotesDate] = source.[NotesDate],
            target.[NotesID] = source.[NotesID]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([Jurisdiction], [NotesStaff], [Notes], [NotesDate], [NotesID])
        VALUES (source.[Jurisdiction], source.[NotesStaff], source.[Notes], source.[NotesDate], source.[NotesID])
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[Notes] OFF;

END
GO
