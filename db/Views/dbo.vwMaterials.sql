SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[vwMaterials]
as
select m.ID, 
    m.Jurisdiction as JurisdictionID,
    m.MaterialDateReceived,
    m.MaterialTitle,
    m.MaterialDescription,
    ms.[Status],
    mp.Phase,
    src.Source,
    m.MaterialCommerceID,
    m.MaterialFile,
    s.Staff as Staff_Reviewer,
    m.MaterialTypeCFP,
    m.MaterialTypeCPP,
    m.MaterialTypeEconomicDevelopment,
    m.MaterialTypeFLUM,
    m.MaterialTypeFunctionalPlan,
    m.MaterialTypeFunctionalPlanSpecify,
    m.MaterialTypeHousing,
    m.MaterialTypeLandUse,
    m.MaterialTypeMinorAmendments,
    m.MaterialTypeOther,
    m.MaterialTypeOtherSpecify,
    m.MaterialTypeParks,
    m.MaterialTypePeriodicUpdate,
    m.MaterialTypeRegionalCenter,
    m.MaterialTypeRural,
    m.MaterialTypeScopingNotice,
    m.MaterialTypeSMP,
    m.MaterialTypeSubareaPlan,
    m.MaterialTypeTransportation,
    m.MaterialTypeUGAChange,
    m.MaterialTypeUtilities,
    m.DateAdded,
    m.MaterialNotes
from Materials as m 
    left join MaterialsStatus ms on m.MaterialStatus = ms.ID
    left join Staff s on m.MaterialStaffReviewer = s.ID
    left join MaterialsPhase mp on m.MaterialPhase = mp.ID
    left join MaterialsSource src on m.MaterialSource = src.ID
GO
