import pandas as pd
import pyodbc

# Load the CSV file with structure GUIDs
csv_file_path = 'structureguid_data_eun_e_support_pole_protofeature.csv'  # Update with your actual CSV file path
csv_data = pd.read_csv(csv_file_path)

# Define the database connection
connection_string = "DRIVER={SQL Server};SERVER=SQLGISTRXTST.lgeenergy.int;DATABASE=LKE_Insite;UID=electric;PWD=pass"
conn = pyodbc.connect(connection_string)

# Lists to store matched and unmatched GUIDs
matched = []
not_matched = []

# Check each GUID one by one
for guid in csv_data['structureguid']:
    #In below query used to 1
    query = """
    SELECT Top 1 
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
    s.STR_MAT AS Structure_Material,
    s.STR_TYPE AS Structure_Type,
    s.HEIGHT AS Structure_Height,
    s.LATITUDE AS Structure_Latitude,
    s.LONGITUDE AS Structure_Longitude,
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
	
	where si.STR_ID =  ?;
    """
    cursor = conn.cursor()
    cursor.execute(query, guid)
    result = cursor.fetchone()
    if result:
        matched.append(guid)
    else:
        not_matched.append(guid)

# Close the database connection
conn.close()

# Create DataFrames for matched and unmatched GUIDs
matched_df = pd.DataFrame(matched, columns=['structureguid'])
not_matched_df = pd.DataFrame(not_matched, columns=['structureguid'])

# Save matched and unmatched data to separate CSV files
matched_csv_path = 'matched_structureguids_support_pole.csv'
not_matched_csv_path = 'not_matched_structureguids_support_pole.csv'
matched_df.to_csv(matched_csv_path, index=False)
not_matched_df.to_csv(not_matched_csv_path, index=False)

# Output the counts and file paths
print(f"Matched count: {len(matched_df)}")
print(f"Not matched count: {len(not_matched_df)}")
print(f"Matched data saved to: {matched_csv_path}")
print(f"Not matched data saved to: {not_matched_csv_path}")

