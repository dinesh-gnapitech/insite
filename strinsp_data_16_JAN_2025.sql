USE DMK;

SELECT 
    s.STR_NUM AS StructureNumber,
    s.LINE_NAME1 AS LineName,
    s.STATUS AS StructureStatus,
    s.OWNER AS StructureOwner,
    s.COMMENTS AS StructureComments,
    si.INSPECTION_DATE AS InspectionDate,
    si.COMMENTS AS InspectionComments,
    isattr.NAME AS InspectionAttributeName,
    isiprop.DESCRIPTION AS PropertyDescription,
    isiprop.REPORTING_DESC AS ReportingDescription,
    istat.STATUS AS InspectionStatus,
    wo.WO_NAME AS WorkOrderName,
    wo.WO_STATUS AS WorkOrderStatus,
    wo.DUE_DATE AS WorkOrderDueDate,
    wo.CREATED_BY AS WorkOrderCreatedBy,
    wo.ASSIGNED_DATE AS WorkOrderAssignedDate,
    wo.ASSIGNED_USER_ID AS WorkOrderAssignedTo
FROM 
    STRUCTURE s
LEFT JOIN 
    STRUCTUREINSPECTION si ON s.GlobalID = si.STR_ID
LEFT JOIN 
    INSPECTIONATTRIBUTE isattr ON si.ATTRIBUTE_ID = isattr.ID
LEFT JOIN 
    INSPECTIONATTRIBUTEPROPERTY isiprop ON si.PROPERTY_ID = isiprop.ID
LEFT JOIN 
    INSPECTIONSTATUS istat ON si.STATUS_ID = istat.ID
LEFT JOIN 
    WORKORDER wo ON si.WO_ID = wo.ID
ORDER BY 
    s.STR_NUM, si.INSPECTION_DATE DESC;
