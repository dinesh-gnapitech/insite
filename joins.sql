-----------Combine STRUCTURE, SUPPORTSTRUCTURE, STRFOUNDATION, and GRADE------------
SELECT 
    st.STR_ID AS StructureID,
    st.Shape AS StructureShape,
    st.STR_NUM AS StructureNumber,
    st.LINEID_1 AS LineID,
    st.LINE_NAME1 AS LineName,
    st.STATUS AS StructureStatus,
    st.HEIGHT AS StructureHeight,
    su.STEEL_FINISH AS SteelFinish,
    su.STR_ARM AS StructureArm,
    sf.FND_TYPE AS FoundationType,
    sf.FND_ELEV AS FoundationElevation,
    sf.FND_REVEAL AS FoundationReveal,
    gr.GRADE_ID AS GradeID,
    gr.POST_STEEL AS PostSteelGrade,
    gr.BASE_STEEL AS BaseSteelGrade,
    gr.OVERALL_GRADE AS OverallGrade
FROM 
    dbo.STRUCTURE st
LEFT JOIN 
    dbo.SUPPORTSTRUCTURE su ON st.STR_ID = su.STR_ID
LEFT JOIN 
    dbo.STRFOUNDATION sf ON st.STR_ID = sf.STR_ID
LEFT JOIN 
    dbo.GRADE gr ON st.STR_ID = gr.STR_ID;
----------------------------------Combine SWITCH, MOTOR, and SWITCHINSPECTION-------------
SELECT 
    sw.SWITCH_ID AS SwitchID,
    sw.Shape AS SwitchShape,
    sw.SWITCH_TYPE AS SwitchType,
    sw.STATUS AS SwitchStatus,
    mo.MOTOR_ID AS MotorID,
    mo.MOTOR_TYPE AS MotorType,
    mo.MANUFACTURER AS MotorManufacturer,
    mo.MFG_DATE AS MotorManufactureDate,
    si.INSPECTION_DATE AS InspectionDate,
    si.STATUS_ID AS InspectionStatusID,
    si.COMMENTS AS InspectionComments
FROM 
    dbo.SWITCH sw
LEFT JOIN 
    dbo.MOTOR mo ON sw.SWITCH_GUID = mo.SWITCH_ID
LEFT JOIN 
    dbo.SWITCHINSPECTION si ON sw.SWITCH_GUID = si.SWITCH_ID;
--------------------------Combine TRANSMISSION_LINE and SPAN_CONDUCTOR---------------------------------
SELECT 
    tl.LINE_ID AS LineID,
    tl.LINE_NAME AS LineName,
    tl.NUM_CIRCUITS AS NumberOfCircuits,
    tl.OPERATING_VOLTAGE AS OperatingVoltage,
    tl.STATUS AS LineStatus,
    sc.SPAN_ID AS SpanID,
    sc.COND_MAT AS ConductorMaterial,
    sc.COND_SIZE AS ConductorSize,
    sc.BUNDLE_QTY AS BundleQuantity
FROM 
    dbo.TRANSMISSION_LINE tl
LEFT JOIN 
    dbo.SPAN_CONDUCTOR sc ON tl.LINE_ID = sc.SPAN_ID;
---------------------------------Combine LOCATION_INSPECTION and FACILITYRELATION-----------------------
SELECT 
    li.LOCATION_GUID AS LocationID,
    li.STREET_NUM AS StreetNumber,
    li.STREET AS StreetName,
    li.CITY AS City,
    li.STATE AS State,
    li.ZIP AS ZipCode,
    li.COMMENTS AS LocationComments,
    fr.STR_ID AS FacilityStructureID,
    fr.LINEID_2 AS RelatedLineID2,
    fr.LINEID_3 AS RelatedLineID3,
    fr.SWITCH_ID AS SwitchID,
    fr.STATION_ID AS StationID
FROM 
    dbo.LOCATION_INSPECTION li
LEFT JOIN 
    dbo.FACILITYRELATION fr ON li.LOCATION_GUID = fr.STR_ID;
-------------------------------Combine WORKORDER, ALERT_RECORDS, and INSPECTIONSTATUS---------------------------------
SELECT 
    wo.WO_NAME AS WorkOrderName,
    wo.WO_TYPE AS WorkOrderType,
    wo.DUE_DATE AS DueDate,
    wo.WO_STATUS AS WorkOrderStatus,
    wo.WO_TAGS AS Tags,
    ar.ALERT_ID AS AlertID,
    ar.OBJECT_ID AS AlertObjectID,
    ar.OBJECT_TYPE AS AlertObjectType,
    isx.STATUS AS InspectionStatus
FROM 
    dbo.WORKORDER wo
LEFT JOIN 
    dbo.ALERT_RECORDS ar ON wo.ID = ar.WO_ID
LEFT JOIN 
    dbo.INSPECTIONSTATUS isx ON ar.OBJECT_ID = isx.ID;
--------------------Combine STATION and REGION-------------------------
SELECT 
    st.STATION_ID AS StationID,
    st.STATION_NAME AS StationName,
    st.CITY AS StationCity,
    st.STATE AS StationState,
    st.STATUS AS StationStatus,
    st.TYPE AS StationType,
    re.REGION AS RegionName,
    re.AREA_SQMI AS RegionArea,
    re.STATES AS CoveredStates
FROM 
    dbo.STATION st
LEFT JOIN 
    dbo.REGION re ON st.REGION = re.REGION;
----------------------------------------------------------------------
