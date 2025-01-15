USE [LKE_INSITE];
GO

SELECT 
    s.STR_NUM AS StructureNumber,
    s.LINE_NAME1 AS LineName,
    si.INSPECTION_DATE AS InspectionDate,
    si.COMMENTS AS InspectionComments,
    ia.NAME AS InspectionAttributeName,
    iap.DESCRIPTION AS PropertyDescription,
    is_.STATUS AS InspectionStatus,
    wo.WO_NAME AS WorkOrderName,
    wo.WO_TYPE AS WorkOrderType,
    wo.DUE_DATE AS WorkOrderDueDate
FROM 
    dbo.STRUCTURE s
LEFT JOIN 
    dbo.STRUCTUREINSPECTION si ON s.STR_ID = si.STR_ID
LEFT JOIN 
    dbo.INSPECTIONATTRIBUTE ia ON si.ATTRIBUTE_ID = ia.ID
LEFT JOIN 
    dbo.INSPECTIONATTRIBUTEPROPERTY iap ON si.PROPERTY_ID = iap.ID
LEFT JOIN 
    dbo.INSPECTIONSTATUS is_ ON si.STATUS_ID = is_.ID
LEFT JOIN 
    dbo.WORKORDER wo ON si.WO_ID = wo.ID
WHERE 
    s.STR_ID IS NOT NULL
ORDER BY 
    si.INSPECTION_DATE DESC;
GO
