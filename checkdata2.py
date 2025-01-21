import pandas as pd
import pyodbc

# Load the CSV file with structure GUIDs
csv_file_path = 'structureguids.csv'  # Update with your actual CSV file path
csv_data = pd.read_csv(csv_file_path)

# Define the database connection
conn_str = (
    "Driver={ODBC Driver 17 for SQL Server};"  # Update the driver version if needed
    "Server=YOUR_SERVER_NAME;"                # Replace with your SQL Server name
    "Database=DMK;"                           # Replace with your database name
    "Trusted_Connection=yes;"                 # Or provide username and password if required
)
conn = pyodbc.connect(conn_str)

# Lists to store matched and unmatched GUIDs
matched = []
not_matched = []

# Check each GUID one by one
for guid in csv_data['structureguid']:
    query = """
    SELECT TOP 1 si.STR_ID
    FROM dbo.STRUCTUREINSPECTION si
    WHERE si.STR_ID = ?;
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
matched_csv_path = 'matched_structureguids.csv'
not_matched_csv_path = 'not_matched_structureguids.csv'
matched_df.to_csv(matched_csv_path, index=False)
not_matched_df.to_csv(not_matched_csv_path, index=False)

# Output the counts and file paths
print(f"Matched count: {len(matched_df)}")
print(f"Not matched count: {len(not_matched_df)}")
print(f"Matched data saved to: {matched_csv_path}")
print(f"Not matched data saved to: {not_matched_csv_path}")
