import pyodbc
import pandas as pd

# Connection details for MS SQL Server
server = 'your_server_name'
database = 'your_database_name'
username = 'your_username'
password = 'your_password'
connection_string = f"DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}"
connection = pyodbc.connect(connection_string)

# SQL JOIN query
query = """
SELECT 
    -- Structure Details
    s.STR_ID AS Structure_ID,
    s.STR_NUM AS Structure_Number,
    s.LINEID_1 AS Line_ID,
    s.LINE_NAME1 AS Line_Name,
    s.NUM_CIRCUITS AS Num_Circuits,
    s.STR_TYPE AS Structure_Type,
    s.STR_MAT AS Structure_Material,
    s.HEIGHT AS Structure_Height,
    s.LATITUDE AS Structure_Latitude,
    s.LONGITUDE AS Structure_Longitude,
    s.ELEVATION AS Structure_Elevation,
    s.OWNER AS Structure_Owner,
    s.COUNTY AS Structure_County,
    s.REGION AS Structure_Region,
    s.STATUS AS Structure_Status,
    s.COMMENTS AS Structure_Comments,

    -- Pole Details
    p.POLE_GUID AS Pole_GUID,
    p.POLE_NUM AS Pole_Number,
    p.POLE_MATERIAL AS Pole_Material,
    p.POLE_TYPE AS Pole_Type,
    p.HEIGHT AS Pole_Height,
    p.LATITUDE AS Pole_Latitude,
    p.LONGITUDE AS Pole_Longitude,
    p.ELEVATION AS Pole_Elevation,
    p.STATUS AS Pole_Status,
    p.VINTAGEYEAR AS Pole_Vintage_Year,
    p.PERCENT_STEEL_LOSS AS Pole_Percent_Steel_Loss
FROM 
    dbo.STRUCTURE s
LEFT JOIN 
    dbo.POLE p ON s.STR_ID = p.STR_GUID;
"""

# Connect to the database

# Execute the query and load data into a Pandas DataFrame
data = pd.read_sql_query(query, connection)

# Export the data to a CSV file
csv_file_path = 'Structure_pole_join_data.csv'
data.to_csv(csv_file_path, index=False)

# Close the connection
connection.close()

print(f"Data exported successfully to {csv_file_path}")
