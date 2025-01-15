------------------1. Structure and Related Data-------------------------
SELECT *
FROM dbo.STRUCTURE st
LEFT JOIN dbo.SUPPORTSTRUCTURE su ON st.STR_ID = su.STR_ID
LEFT JOIN dbo.STRFOUNDATION sf ON st.STR_ID = sf.STR_ID
LEFT JOIN dbo.GRADE gr ON st.STR_ID = gr.STR_ID;
---------------------2. Switch and Related Data-------------------
SELECT *
FROM dbo.SWITCH sw
LEFT JOIN dbo.MOTOR mo ON sw.SWITCH_GUID = mo.SWITCH_ID
LEFT JOIN dbo.SWITCHINSPECTION si ON sw.SWITCH_GUID = si.SWITCH_ID;
---------------3. Transmission Line and Span Conductor-----------------------
SELECT *
FROM dbo.TRANSMISSION_LINE tl
LEFT JOIN dbo.SPAN_CONDUCTOR sc ON tl.LINE_ID = sc.SPAN_ID;
----------------------4. Location and Facility Relations-------------
SELECT *
FROM dbo.LOCATION_INSPECTION li
LEFT JOIN dbo.FACILITYRELATION fr ON li.LOCATION_GUID = fr.STR_ID;
--------------------5. Work Orders, Alerts, and Inspection Status--------------------------
SELECT *
FROM dbo.WORKORDER wo
LEFT JOIN dbo.ALERT_RECORDS ar ON wo.ID = ar.WO_ID
LEFT JOIN dbo.INSPECTIONSTATUS isx ON ar.OBJECT_ID = isx.ID;
-----------------------6. Stations and Regions--------------
SELECT *
FROM dbo.STATION st
LEFT JOIN dbo.REGION re ON st.REGION = re.REGION;

