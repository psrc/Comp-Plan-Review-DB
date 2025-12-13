SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_Jurisdiction]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[Jurisdiction] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    -- Source is a join of [stg].[Jurisdiction] and [stg].[JurisdictionID]
    MERGE [dbo].[Jurisdiction] AS target
    USING (
        SELECT 
            b.[ID],
            b.[JurisdictionDisplayName] AS [DisplayName],
            b.[JurisdictionSortName] AS [SortName],
            a.[JurisdictionType],
            a.[JurisdictionParent1],
            a.[JurisdictionParent2],
            a.[RegionalGeography],
            a.[CertificationDate],
            a.[Certified],
            a.[Address],
            a.[ContactName1],
            a.[ContactTitle1],
            a.[ContactPhone1],
            a.[ContactEmail1],
            a.[ContactName2],
            a.[ContactTitle2],
            a.[ContactPhone2],
            a.[ContactEmail2],
            a.[AirportAdjacent],
            a.[StaffContact],
            a.[CommerceContact],
            a.[FormSort]
        FROM [stg].[Jurisdiction] AS a
        INNER JOIN [stg].[JurisdictionID] AS b ON a.[Jurisdiction] = b.[ID]
    ) AS source
    ON target.[ID] = source.[ID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[DisplayName] = source.[DisplayName],
            target.[SortName] = source.[SortName],
            target.[JurisdictionType] = source.[JurisdictionType],
            target.[JurisdictionParent1] = source.[JurisdictionParent1],
            target.[JurisdictionParent2] = source.[JurisdictionParent2],
            target.[RegionalGeography] = source.[RegionalGeography],
            target.[CertificationDate] = source.[CertificationDate],
            target.[Certified] = source.[Certified],
            target.[Address] = source.[Address],
            target.[ContactName1] = source.[ContactName1],
            target.[ContactTitle1] = source.[ContactTitle1],
            target.[ContactPhone1] = source.[ContactPhone1],
            target.[ContactEmail1] = source.[ContactEmail1],
            target.[ContactName2] = source.[ContactName2],
            target.[ContactTitle2] = source.[ContactTitle2],
            target.[ContactPhone2] = source.[ContactPhone2],
            target.[ContactEmail2] = source.[ContactEmail2],
            target.[AirportAdjacent] = source.[AirportAdjacent],
            target.[StaffContact] = source.[StaffContact],
            target.[CommerceContact] = source.[CommerceContact],
            target.[FormSort] = source.[FormSort]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
            [ID],
            [DisplayName],
            [SortName],
            [JurisdictionType],
            [JurisdictionParent1],
            [JurisdictionParent2],
            [RegionalGeography],
            [CertificationDate],
            [Certified],
            [Address],
            [ContactName1],
            [ContactTitle1],
            [ContactPhone1],
            [ContactEmail1],
            [ContactName2],
            [ContactTitle2],
            [ContactPhone2],
            [ContactEmail2],
            [AirportAdjacent],
            [StaffContact],
            [CommerceContact],
            [FormSort]
        )
        VALUES (
            source.[ID],
            source.[DisplayName],
            source.[SortName],
            source.[JurisdictionType],
            source.[JurisdictionParent1],
            source.[JurisdictionParent2],
            source.[RegionalGeography],
            source.[CertificationDate],
            source.[Certified],
            source.[Address],
            source.[ContactName1],
            source.[ContactTitle1],
            source.[ContactPhone1],
            source.[ContactEmail1],
            source.[ContactName2],
            source.[ContactTitle2],
            source.[ContactPhone2],
            source.[ContactEmail2],
            source.[AirportAdjacent],
            source.[StaffContact],
            source.[CommerceContact],
            source.[FormSort]
        )
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[Jurisdiction] OFF;

END
GO
