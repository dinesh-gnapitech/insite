import pyodbc
import pandas as pd

# Connection details for MS SQL Server
connection_string = "DRIVER={SQL Server};SERVER=SQLGISTRXTST.lgeenergy.int;DATABASE=LKE_Insite;UID=electric;PWD=W3rockth3hous3"
connection = pyodbc.connect(connection_string)

# SQL JOIN query
query = """
SELECT DISTINCT TOP 10000
    s.STR_ID AS Structure_ID,
    s.STR_NUM AS Structure_Number,
    s.LINE_NAME1 AS Line_Name,
    s.STATUS AS Structure_Status,
    s.OWNER AS Structure_Owner,
    s.COMMENTS AS Structure_Comments,
	s.GlobalID AS Structure_Global_ID,
	s.OBJECTID AS Structure_Object_ID,
    si.INSPECTION_DATE AS Inspection_Date,
    si.COMMENTS AS Inspection_Comments,
    isattr.NAME AS Inspection_Attribute_Name,
    istat.STATUS AS Inspection_Status,
    wo.WO_NAME AS WorkOrder_Name,
    wo.WO_STATUS AS WorkOrder_Status,
    wo.DUE_DATE AS WorkOrder_Due_Date,
    wo.CREATED_BY AS WorkOrder_Created_By,
    wo.ASSIGNED_DATE AS WorkOrder_Assigned_Date,
    wo.ASSIGNED_USER_ID AS WorkOrder_Assigned_To
FROM 
    STRUCTURE s
LEFT JOIN 
    STRUCTUREINSPECTION si ON s.STR_ID = si.STR_ID
LEFT JOIN 
    INSPECTIONATTRIBUTE isattr ON si.ATTRIBUTE_ID = isattr.ID
LEFT JOIN 
    INSPECTIONATTRIBUTEPROPERTY isiprop ON si.PROPERTY_ID = isiprop.ID
LEFT JOIN 
    INSPECTIONSTATUS istat ON si.STATUS_ID = istat.ID
LEFT JOIN 
    WORKORDER wo ON si.WO_ID = wo.ID
WHERE 
    s.STR_ID IS NOT NULL AND S.GlobalID is not null;
"""

# Connect to the database

# Execute the query and load data into a Pandas DataFrame
data = pd.read_sql_query(query, connection)

# Export the data to a CSV file
csv_file_path = 'NewStructureINSPECTIONFULLWithGlobal_ID_10000_records.csv'
data.to_csv(csv_file_path, index=False)

# Close the connection
connection.close()

print(f"Data exported successfully to {csv_file_path}")
