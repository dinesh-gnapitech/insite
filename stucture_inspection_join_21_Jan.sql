SELECT distinct
    si.STR_ID AS Structure_ID,
    s.STR_NUM AS Structure_Number,
    s.LINE_NAME1 AS Line_Name,
	s.NUM_CIRCUITS AS Number_of_Circuits,
    s.STATUS AS Structure_Status,
    s.OWNER AS Structure_Owner,
	s.PMD AS Old_Primary_Circuit_ID,
    s.COMMENTS AS Structure_Comments,
	s.GlobalID AS Structure_Global_ID,
	s.OBJECTID AS Structure_Object_ID,
    s.STR_MAT AS StructureMaterial,
    s.STR_TYPE AS StructureType,
    s.HEIGHT AS StructureHeight,
    s.LATITUDE AS StructureLatitude,
    s.LONGITUDE AS StructureLongitude,
    si.INSPECTION_DATE AS Inspection_Date,
    si.COMMENTS AS Inspection_Comments,
    ia.NAME AS Inspection_Attribute_Name,
    ist.STATUS AS Inspection_Status,
    wo.WO_NAME AS WorkOrder_Name,
    wo.WO_STATUS AS WorkOrder_Status,
    wo.DUE_DATE AS WorkOrder_Due_Date,
    wo.CREATED_BY AS WorkOrder_Created_By,
    wo.ASSIGNED_DATE AS WorkOrder_Assigned_Date,
    wo.ASSIGNED_USER_ID AS WorkOrder_Assigned_To
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
	where si.STR_ID  IS NOT NULL AND S.GlobalID is not null ;