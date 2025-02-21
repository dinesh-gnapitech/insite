import pandas as pd
import pyodbc

# Load the CSV file with structure GUIDs
csv_file_path = 'structureguid_data_eun_e_lattice_protofeature.csv'  # Update with your actual CSV file path
csv_data = pd.read_csv(csv_file_path)

# Define the database connection
connection_string = "DRIVER={SQL Server};SERVER=SQLGISTRXTST.lgeenergy.int;DATABASE=LKE_Insite;UID=electric;PWD="
conn = pyodbc.connect(connection_string)

# SQL query template
query = """
SELECT si.STR_ID AS StructureGUID
FROM dbo.STRUCTUREINSPECTION si
WHERE si.STR_ID IN ({placeholders});
"""

# Generate placeholders for the query based on the number of GUIDs
placeholders = ', '.join(['?'] * len(csv_data['structureguid']))
query = query.format(placeholders=placeholders)

# Execute the query with the list of GUIDs from the CSV
params = csv_data['structureguid'].tolist()
sql_result = pd.read_sql_query(query, conn, params=params)

# Close the database connection
conn.close()

# Process the results to identify matches and mismatches
csv_data['Matched'] = csv_data['structureguid'].isin(sql_result['StructureGUID'])
matched = csv_data[csv_data['Matched']]
not_matched = csv_data[~csv_data['Matched']]

# Save matched and unmatched data to separate CSV files
matched_csv_path = 'matched_structureguids.csv'
not_matched_csv_path = 'not_matched_structureguids.csv'
matched.to_csv(matched_csv_path, index=False)
not_matched.to_csv(not_matched_csv_path, index=False)

# Output the counts and file paths
print(f"Matched count: {len(matched)}")
print(f"Not matched count: {len(not_matched)}")
print(f"Matched data saved to: {matched_csv_path}")
print(f"Not matched data saved to: {not_matched_csv_path}")
