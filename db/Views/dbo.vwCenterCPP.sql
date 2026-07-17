SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[vwCenterCPP]
AS
select 
    j.[ID],
    j.[DisplayName],
    j.[SortName],
    jt.[JurisdictionType],
    j.[JurisdictionParent1],
    j.[JurisdictionParent2],
    j.[RegionalGeography],
    j.[CertificationDate],
    j.[Certified],
    j.[Address],
    j.[ContactName1],
    j.[ContactTitle1],
    j.[ContactPhone1],
    j.[ContactEmail1],
    j.[ContactName2],
    j.[ContactTitle2],
    j.[ContactPhone2],
    j.[ContactEmail2],
    j.[AirportAdjacent],
    j.[StaffContact],
    j.[CommerceContact],
    j.[FormSort]
from dbo.Jurisdiction  as j 
    join dbo.JurisdictionType jt on j.JurisdictionType = jt.[ID]
where jt.JurisdictionType not in ('City', 'County')
GO
