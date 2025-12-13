SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[merge_Materials]
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Enable IDENTITY_INSERT to allow explicit ID values from staging
    SET IDENTITY_INSERT [dbo].[Materials] ON;

    -- Step 2: MERGE statement to upsert data from staging to destination
    MERGE [dbo].[Materials] AS target
    USING [stg].[Materials] AS source
    ON target.[ID] = source.[MaterialID]
    
    WHEN MATCHED THEN
        UPDATE SET
            target.[Jurisdiction] = source.[Jurisdiction],
            target.[MaterialDateReceived] = source.[MaterialDateReceived],
            target.[MaterialTitle] = source.[MaterialTitle],
            target.[MaterialDescription] = source.[MaterialDescription],
            target.[MaterialPhase] = source.[MaterialPhase],
            target.[MaterialStatus] = source.[MaterialStatus],
            target.[MaterialSource] = source.[MaterialSource],
            target.[MaterialStaffReviewer] = source.[MaterialStaffReviewer],
            target.[MaterialNotes] = source.[MaterialNotes],
            target.[MaterialReportingTool] = source.[MaterialReportingTool],
            target.[MaterialFile] = source.[MaterialFile],
            target.[MaterialCommerceID] = source.[MaterialCommerceID],
            target.[MaterialTypeCFP] = source.[MaterialTypeCFP],
            target.[MaterialTypeCPP] = source.[MaterialTypeCPP],
            target.[MaterialTypeEconomicDevelopment] = source.[MaterialTypeEconomicDevelopment],
            target.[MaterialTypeFLUM] = source.[MaterialTypeFLUM],
            target.[MaterialTypeFunctionalPlan] = source.[MaterialTypeFunctionalPlan],
            target.[MaterialTypeFunctionalPlanSpecify] = source.[MaterialTypeFunctionalPlanSpecify],
            target.[MaterialTypeHousing] = source.[MaterialTypeHousing],
            target.[MaterialTypeLandUse] = source.[MaterialTypeLandUse],
            target.[MaterialTypeMinorAmendments] = source.[MaterialTypeMinorAmendments],
            target.[MaterialTypeOther] = source.[MaterialTypeOther],
            target.[MaterialTypeOtherSpecify] = source.[MaterialTypeOtherSpecify],
            target.[MaterialTypeParks] = source.[MaterialTypeParks],
            target.[MaterialTypePeriodicUpdate] = source.[MaterialTypePeriodicUpdate],
            target.[MaterialTypeRegionalCenter] = source.[MaterialTypeRegionalCenter],
            target.[MaterialTypeRural] = source.[MaterialTypeRural],
            target.[MaterialTypeScopingNotice] = source.[MaterialTypeScopingNotice],
            target.[MaterialTypeSMP] = source.[MaterialTypeSMP],
            target.[MaterialTypeSubareaPlan] = source.[MaterialTypeSubareaPlan],
            target.[MaterialTypeTransportation] = source.[MaterialTypeTransportation],
            target.[MaterialTypeUGAChange] = source.[MaterialTypeUGAChange],
            target.[MaterialTypeUtilities] = source.[MaterialTypeUtilities],
            target.[DateAdded] = source.[DateAdded]
    
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
            [ID],
            [Jurisdiction],
            [MaterialDateReceived],
            [MaterialTitle],
            [MaterialDescription],
            [MaterialPhase],
            [MaterialStatus],
            [MaterialSource],
            [MaterialStaffReviewer],
            [MaterialNotes],
            [MaterialReportingTool],
            [MaterialFile],
            [MaterialCommerceID],
            [MaterialTypeCFP],
            [MaterialTypeCPP],
            [MaterialTypeEconomicDevelopment],
            [MaterialTypeFLUM],
            [MaterialTypeFunctionalPlan],
            [MaterialTypeFunctionalPlanSpecify],
            [MaterialTypeHousing],
            [MaterialTypeLandUse],
            [MaterialTypeMinorAmendments],
            [MaterialTypeOther],
            [MaterialTypeOtherSpecify],
            [MaterialTypeParks],
            [MaterialTypePeriodicUpdate],
            [MaterialTypeRegionalCenter],
            [MaterialTypeRural],
            [MaterialTypeScopingNotice],
            [MaterialTypeSMP],
            [MaterialTypeSubareaPlan],
            [MaterialTypeTransportation],
            [MaterialTypeUGAChange],
            [MaterialTypeUtilities],
            [DateAdded]
        )
        VALUES (
            source.[MaterialID],
            source.[Jurisdiction],
            source.[MaterialDateReceived],
            source.[MaterialTitle],
            source.[MaterialDescription],
            source.[MaterialPhase],
            source.[MaterialStatus],
            source.[MaterialSource],
            source.[MaterialStaffReviewer],
            source.[MaterialNotes],
            source.[MaterialReportingTool],
            source.[MaterialFile],
            source.[MaterialCommerceID],
            source.[MaterialTypeCFP],
            source.[MaterialTypeCPP],
            source.[MaterialTypeEconomicDevelopment],
            source.[MaterialTypeFLUM],
            source.[MaterialTypeFunctionalPlan],
            source.[MaterialTypeFunctionalPlanSpecify],
            source.[MaterialTypeHousing],
            source.[MaterialTypeLandUse],
            source.[MaterialTypeMinorAmendments],
            source.[MaterialTypeOther],
            source.[MaterialTypeOtherSpecify],
            source.[MaterialTypeParks],
            source.[MaterialTypePeriodicUpdate],
            source.[MaterialTypeRegionalCenter],
            source.[MaterialTypeRural],
            source.[MaterialTypeScopingNotice],
            source.[MaterialTypeSMP],
            source.[MaterialTypeSubareaPlan],
            source.[MaterialTypeTransportation],
            source.[MaterialTypeUGAChange],
            source.[MaterialTypeUtilities],
            source.[DateAdded]
        )
    ;

    -- Step 3: Disable IDENTITY_INSERT
    SET IDENTITY_INSERT [dbo].[Materials] OFF;

END
GO
