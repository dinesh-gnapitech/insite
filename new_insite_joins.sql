
--1. Retrieve all Transmission Line details along with associated Structures
SELECT 
    tl.LINE_ID, 
    tl.LINE_NAME, 
    tl.NUM_CIRCUITS, 
    s.STR_NUM, 
    s.HEIGHT, 
    s.STATUS, 
    s.LATITUDE, 
    s.LONGITUDE
FROM 
    TRANSMISSION_LINE tl
LEFT JOIN 
    STRUCTURE s 
ON 
    tl.LINE_ID = s.LINEID_1;

--2. Fetch Structure Inspection details for specific Transmission Lines
SELECT 
    tl.LINE_NAME, 
    s.STR_NUM, 
    si.INSPECTION_DATE, 
    si.COMMENTS, 
    si.STATUS_ID
FROM 
    TRANSMISSION_LINE tl
INNER JOIN 
    STRUCTURE s 
ON 
    tl.LINE_ID = s.LINEID_1
INNER JOIN 
    STRUCTUREINSPECTION si 
ON 
    s.STR_ID = si.STR_ID
WHERE 
    tl.LINE_NAME = 'Example Transmission Line Name';

--3. Get Switch details associated with Structures
SELECT 
    s.STR_NUM, 
    sw.SWITCH_ID, 
    sw.SWITCH_TYPE, 
    sw.IN_SERVICE, 
    sw.OUT_SERVICE, 
    sw.OPERATING_VOLTAGE
FROM 
    STRUCTURE s
INNER JOIN 
    SWITCH sw 
ON 
    s.STR_ID = sw.STRUCTURE_GUID
WHERE 
    sw.STATUS = 'Active';

--4. List Poles with their associated Grade and Inspection Details
SELECT 
    p.POLE_NUM, 
    p.HEIGHT AS PoleHeight, 
    g.OVERALL_GRADE, 
    g.INSPECTION_DATE, 
    g.PERCENT_STEEL_LOSS
FROM 
    POLE p
LEFT JOIN 
    GRADE g 
ON 
    p.POLE_GUID = g.POLE_GUID
WHERE 
    g.OVERALL_GRADE IS NOT NULL
ORDER BY 
    g.INSPECTION_DATE DESC;

--5. Get all Switches and their Inspection Status
SELECT 
    sw.SWITCH_ID, 
    sw.SWITCH_TYPE, 
    si.INSPECTION_DATE, 
    si.COMMENTS, 
    si.STATUS_ID, 
    is_.STATUS AS InspectionStatus
FROM 
    SWITCH sw
LEFT JOIN 
    SWITCHINSPECTION si 
ON 
    sw.SWITCH_ID = si.SWITCH_ID
LEFT JOIN 
    INSPECTIONSTATUS is_ 
ON 
    si.STATUS_ID = is_.ID;

--6. Retrieve Work Orders and Related Structures or Switches
SELECT 
    wo.WO_NAME, 
    wo.DUE_DATE, 
    s.STR_NUM AS StructureNumber, 
    sw.SWITCH_ID AS SwitchID, 
    wo.WO_STATUS
FROM 
    WORKORDER wo
LEFT JOIN 
    STRUCTUREINSPECTION si 
ON 
    wo.ID = si.WO_ID
LEFT JOIN 
    STRUCTURE s 
ON 
    si.STR_ID = s.STR_ID
LEFT JOIN 
    SWITCHINSPECTION swi 
ON 
    wo.ID = swi.WO_ID
LEFT JOIN 
    SWITCH sw 
ON 
    swi.SWITCH_ID = sw.SWITCH_ID;

--7. Fetch Facility Relations for Structures and Switches
SELECT 
    fr.STR_ID, 
    s.STR_NUM AS StructureNumber, 
    fr.SWITCH_ID, 
    sw.SWITCH_TYPE, 
    fr.ADJACENT
FROM 
    FACILITYRELATION fr
LEFT JOIN 
    STRUCTURE s 
ON 
    fr.STR_ID = s.STR_ID
LEFT JOIN 
    SWITCH sw 
ON 
    fr.SWITCH_ID = sw.SWITCH_ID;

--8. List Transmission Lines and the Stations they Connect
SELECT 
    tl.LINE_NAME, 
    tl.LINE_MILEAGE, 
    st.STATION_NAME, 
    st.CITY, 
    st.REGION
FROM 
    TRANSMISSION_LINE tl
LEFT JOIN 
    FACILITYRELATION fr 
ON 
    tl.LINE_ID = fr.LINEID_2
LEFT JOIN 
    STATION st 
ON 
    fr.STATION_ID = st.STATION_ID;

--9. Inspection Summary Report for a Region
SELECT 
    r.NAME AS RegionName, 
    COUNT(si.ID) AS TotalInspections, 
    COUNT(CASE WHEN si.STATUS_ID = 'SpecificStatusID' THEN 1 END) AS SpecificStatusCount, 
    MIN(si.INSPECTION_DATE) AS FirstInspection, 
    MAX(si.INSPECTION_DATE) AS LastInspection
FROM 
    REGION r
INNER JOIN 
    STRUCTURE s 
ON 
    r.CODE = s.REGION
INNER JOIN 
    STRUCTUREINSPECTION si 
ON 
    s.STR_ID = si.STR_ID
GROUP BY 
    r.NAME;

--10. List All Structures with Related Poles, Switches, and Arms
SELECT 
    s.STR_NUM AS StructureNumber, 
    p.POLE_NUM AS PoleNumber, 
    sw.SWITCH_ID AS SwitchID, 
    a.ARM_TYPE AS ArmType
FROM 
    STRUCTURE s
LEFT JOIN 
    POLE p 
ON 
    s.STR_ID = p.STR_GUID
LEFT JOIN 
    SWITCH sw 
ON 
    s.STR_ID = sw.STRUCTURE_GUID
LEFT JOIN 
    ARM a 
ON 
    s.STR_ID = a.STR_ID;

--11. Fetch Switches with Associated Motors and Interruptors
SELECT 
    sw.SWITCH_ID, 
    sw.SWITCH_TYPE, 
    m.MOTOR_TYPE, 
    m.CATALOG_NUMBER AS MotorCatalog, 
    i.INTERRUPTER_NUM, 
    i.RATING AS InterruptorRating
FROM 
    SWITCH sw
LEFT JOIN 
    MOTOR m 
ON 
    sw.SWITCH_ID = m.SWITCH_ID
LEFT JOIN 
    INTERRUPTER i 
ON 
    sw.SWITCH_ID = i.INTERRUPTER_ID;

--12. Identify Structures Requiring Maintenance with Associated Comments
SELECT 
    s.STR_NUM AS StructureNumber, 
    s.STATUS AS StructureStatus, 
    s.PROGRESS_STATUS AS ProgressStatus, 
    si.COMMENTS AS InspectionComments, 
    wo.WO_NAME AS WorkOrderName
FROM 
    STRUCTURE s
INNER JOIN 
    STRUCTUREINSPECTION si 
ON 
    s.STR_ID = si.STR_ID
LEFT JOIN 
    WORKORDER wo 
ON 
    si.WO_ID = wo.ID
WHERE 
    si.STATUS_ID = 'MaintenanceRequiredStatusID';

--13. Get Details of Poles and Foundations Associated with a Specific Transmission Line
SELECT 
    tl.LINE_NAME AS TransmissionLine, 
    p.POLE_NUM AS PoleNumber, 
    p.HEIGHT AS PoleHeight, 
    sf.FND_TYPE AS FoundationType, 
    sf.FND_ELEV AS FoundationElevation
FROM 
    TRANSMISSION_LINE tl
INNER JOIN 
    STRUCTURE s 
ON 
    tl.LINE_ID = s.LINEID_1
INNER JOIN 
    POLE p 
ON 
    s.STR_ID = p.STR_GUID
LEFT JOIN 
    STRFOUNDATION sf 
ON 
    s.STR_ID = sf.STR_ID
WHERE 
    tl.LINE_NAME = 'Example Line Name';

--14. Retrieve Transmission Lines and the Regions They Cross
SELECT 
    tl.LINE_NAME AS TransmissionLineName, 
    r.NAME AS RegionName, 
    r.STATES AS StatesCovered
FROM 
    TRANSMISSION_LINE tl
LEFT JOIN 
    REGION r 
ON 
    tl.REGION = r.REGION;

--15. Structures and Associated Work Orders in a Specific Region
SELECT 
    r.NAME AS RegionName, 
    s.STR_NUM AS StructureNumber, 
    s.STATUS AS StructureStatus, 
    wo.WO_NAME AS WorkOrderName, 
    wo.WO_STATUS AS WorkOrderStatus
FROM 
    REGION r
INNER JOIN 
    STRUCTURE s 
ON 
    r.CODE = s.REGION
INNER JOIN 
    STRUCTUREINSPECTION si 
ON 
    s.STR_ID = si.STR_ID
INNER JOIN 
    WORKORDER wo 
ON 
    si.WO_ID = wo.ID
WHERE 
    r.NAME = 'Specific Region Name';

--16. Count of Active Switches per Transmission Line
SELECT 
    tl.LINE_NAME AS TransmissionLineName, 
    COUNT(sw.SWITCH_ID) AS ActiveSwitchCount
FROM 
    TRANSMISSION_LINE tl
LEFT JOIN 
    STRUCTURE s 
ON 
    tl.LINE_ID = s.LINEID_1
LEFT JOIN 
    SWITCH sw 
ON 
    s.STR_ID = sw.STRUCTURE_GUID
WHERE 
    sw.STATUS = 'Active'
GROUP BY 
    tl.LINE_NAME;

--17. Retrieve Inspection Records for Poles with Specific Grades
SELECT 
    p.POLE_NUM AS PoleNumber, 
    g.OVERALL_GRADE AS OverallGrade, 
    si.INSPECTION_DATE AS LastInspectionDate, 
    si.COMMENTS AS InspectionComments
FROM 
    POLE p
INNER JOIN 
    GRADE g 
ON 
    p.POLE_GUID = g.POLE_GUID
INNER JOIN 
    STRUCTUREINSPECTION si 
ON 
    g.STR_ID = si.STR_ID
WHERE 
    g.OVERALL_GRADE IN ('Poor', 'Critical')
ORDER BY 
    si.INSPECTION_DATE DESC;

--18. Poles and Structures with Specific Voltage Ratings
SELECT 
    s.STR_NUM AS StructureNumber, 
    s.VOLTAGE AS StructureVoltage, 
    p.POLE_NUM AS PoleNumber, 
    p.VOLTAGE AS PoleVoltage
FROM 
    STRUCTURE s
INNER JOIN 
    POLE p 
ON 
    s.STR_ID = p.STR_GUID
WHERE 
    s.VOLTAGE BETWEEN 100 AND 500 
    OR 
    p.VOLTAGE BETWEEN 100 AND 500;

--19. Work Orders and Inspection Programs Associated with Specific Structures
SELECT 
    wo.WO_NAME AS WorkOrderName, 
    ip.NAME AS InspectionProgramName, 
    s.STR_NUM AS StructureNumber, 
    s.PROGRESS_STATUS AS ProgressStatus
FROM 
    WORKORDER wo
INNER JOIN 
    STRUCTUREINSPECTION si 
ON 
    wo.ID = si.WO_ID
INNER JOIN 
    STRUCTURE s 
ON 
    si.STR_ID = s.STR_ID
INNER JOIN 
    INSPECTIONPROGRAM ip 
ON 
    wo.INSPECTION_PROGRAM_ID = ip.ID
WHERE 
    s.STR_NUM LIKE 'STR123%';

--20. List of Structures and Nearby Facilities (Stations, Switches)
SELECT 
    s.STR_NUM AS StructureNumber, 
    f.STATION_ID AS NearbyStation, 
    f.SWITCH_ID AS NearbySwitch, 
    f.ADJACENT AS AdjacentStructures
FROM 
    STRUCTURE s
INNER JOIN 
    FACILITYRELATION f 
ON 
    s.STR_ID = f.STR_ID
WHERE 
    f.ADJACENT IS NOT NULL;
These queries can be further customized depending on specific business needs. Let me know if you need more scenarios or refinements!
