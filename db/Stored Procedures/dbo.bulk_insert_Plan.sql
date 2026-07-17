SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[bulk_insert_Plan] @Year smallint 
as 
/*
Inserts one record in dbo.[Plan]
for every jurisdiction
for @Year
*/
BEGIN
    with cte as (
        SELECT ID as JurisdictionID, 
            @Year as [Year]
            --,0 as isCompleted
        FROM dbo.Jurisdiction 
    )
    merge dbo.[Plan] as TARGET
    using cte as source 
        ON TARGET.[JurisdictionID] = source.JurisdictionID 
        and target.[Year] = source.[Year]
    when not matched by target then 
        insert ([JurisdictionID], [Year])
        values (source.[JurisdictionID], source.[Year])
    ;

END
GO
