SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[merge_ShapefileStatus] 
as 
BEGIN  
    with cte as (
        select 1 as ID,'received' as [Name]
        union
        select 2,'requested'
    )
    merge dbo.ShapefileStatus as target 
    using cte as source 
    on target.[ID] = source.[ID]
    when not matched by target then 
        insert ([ID], [Name])
        values (source.[ID], source.[Name]);

END 
GO
