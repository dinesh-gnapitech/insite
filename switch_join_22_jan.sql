SELECT 
    -- Inspection Details
    si.ID AS InspectionID,
    si.INSPECTION_DATE AS InspectionDate,
    si.COMMENTS AS InspectionComments,
    si.KEY AS InspectionKey,
    si.VALUE AS InspectionValue,
    
    -- Switch Details
    sw.SWITCH_ID AS SwitchID,
    sw.SWITCH_TYPE AS SwitchType,
    sw.OPERATING_VOLTAGE AS OperatingVoltage,
    sw.DESIGN_VOLTAGE AS DesignVoltage,
    sw.OWNER AS SwitchOwner,
    sw.COUNTY AS SwitchCounty,
    sw.REGION AS SwitchRegion,
    sw.LATITUDE AS SwitchLatitude,
    sw.LONGITUDE AS SwitchLongitude,
    sw.ELEVATION AS SwitchElevation,
    sw.STATUS AS SwitchStatus,
    sw.TL_MAINT AS TransmissionLineMaintenance,
    sw.RATING AS SwitchRating,
    sw.SWITCH_MOD_TYPE AS SwitchModelType,
    sw.LAST_INSPECT_DATE AS LastSwitchInspectionDate,
    sw.MANUFACTURER AS SwitchManufacturer,
    sw.CATALOG_NUMBER AS SwitchCatalogNumber,
    sw.SERIAL_NUMBER AS SwitchSerialNumber,

    -- Work Order Details
    wo.WO_NAME AS WorkOrderName,
    wo.WO_TYPE AS WorkOrderType,
    wo.DUE_DATE AS WorkOrderDueDate,
    wo.WO_STATUS AS WorkOrderStatus,
    wo.WO_TAGS AS WorkOrderTags,
    wo.ASSIGNED_USER_ID AS AssignedUserID,
    wo.ASSIGNED_DATE AS AssignedDate,
    wo.CREATED_BY AS WorkOrderCreatedBy,
    wo.CREATED_DATE AS WorkOrderCreatedDate,
    wo.MODIFIED_BY AS WorkOrderModifiedBy,
    wo.MODIFIED_DATE AS WorkOrderModifiedDate,

    -- Inspection Attributes
    ia.NAME AS AttributeName,
    ia.ID AS AttributeID,
    iap.DESCRIPTION AS AttributeDescription,
    iap.REPORTING_DESC AS AttributeReportingDescription,

    -- Inspection Status
    is1.STATUS AS InspectionStatus,

    -- Motor Details
    m.MOTOR_ID AS MotorID,
    m.MOTOR_TYPE AS MotorType,
    m.CATALOG_NUMBER AS MotorCatalogNumber,
    m.MANUFACTURER AS MotorManufacturer,
    m.SERIAL_NUMBER AS MotorSerialNumber,
    m.INSTALL_DATE AS MotorInstallDate,
    m.REMOVAL_DATE AS MotorRemovalDate,
    m.VOLTAGE AS MotorVoltage,
    m.BATTERY_DATE AS MotorBatteryDate
FROM 
    dbo.SWITCHINSPECTION si
INNER JOIN 
    dbo.SWITCH sw ON si.SWITCH_ID = sw.GlobalID
LEFT JOIN 
    dbo.WORKORDER wo ON si.WO_ID = wo.ID
INNER JOIN 
    dbo.INSPECTIONATTRIBUTE ia ON si.ATTRIBUTE_ID = ia.ID
LEFT JOIN 
    dbo.INSPECTIONATTRIBUTEPROPERTY iap ON si.PROPERTY_ID = iap.ID
LEFT JOIN 
    dbo.INSPECTIONSTATUS is1 ON si.STATUS_ID = is1.ID
LEFT JOIN 
    dbo.MOTOR m ON sw.SWITCH_ID = m.SWITCH_ID;
