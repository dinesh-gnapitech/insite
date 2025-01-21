USE [DMK];
GO

SELECT 
    si.ID AS StructureInspectionID,
    si.WO_ID AS WorkOrderID,
    wo.WO_NAME AS WorkOrderName,
    wo.WO_TYPE AS WorkOrderType,
    wo.WO_STATUS AS WorkOrderStatus,
    wo.DUE_DATE AS WorkOrderDueDate,
    
    si.ATTRIBUTE_ID AS AttributeID,
    ia.NAME AS AttributeName,
    
    si.STATUS_ID AS StatusID,
    ist.STATUS AS InspectionStatus,
    
    si.COMMENTS AS InspectionComments,
    
    si.PROPERTY_ID AS PropertyID,
    iap.NAME AS PropertyName,
    iap.DESCRIPTION AS PropertyDescription,
    iap.REPORTING_DESC AS PropertyReportingDescription,
    
    si.INSPECTION_DATE AS InspectionDate,
    si.CREATED_DATE AS InspectionCreatedDate,
    si.MODIFIED_DATE AS InspectionModifiedDate,
    
    s.STR_NUM AS StructureNumber,
    s.LINEID_1 AS LineID,
    s.LINE_NAME1 AS LineName,
    s.STR_MAT AS StructureMaterial,
    s.STR_TYPE AS StructureType,
    s.HEIGHT AS StructureHeight,
    s.LATITUDE AS StructureLatitude,
    s.LONGITUDE AS StructureLongitude,
    s.STATUS AS StructureStatus,
    s.OWNER AS StructureOwner
FROM 
    dbo.STRUCTUREINSPECTION si
LEFT JOIN 
    dbo.STRUCTURE s ON si.STR_ID = s.STR_ID
LEFT JOIN 
    dbo.WORKORDER wo ON si.WO_ID = wo.ID
LEFT JOIN 
    dbo.INSPECTIONATTRIBUTE ia ON si.ATTRIBUTE_ID = ia.ID
LEFT JOIN 
    dbo.INSPECTIONSTATUS ist ON si.STATUS_ID = ist.ID
LEFT JOIN 
    dbo.INSPECTIONATTRIBUTEPROPERTY iap ON si.PROPERTY_ID = iap.ID;
