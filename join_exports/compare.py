import pandas as pd
import pyodbc

# Load CSV file into a pandas DataFrame
csv_file_path = "your_file.csv"  # Replace with the path to your CSV file
csv_column_name = "csv_column"  # Replace with the CSV column name
df = pd.read_csv(csv_file_path)

# Connect to MSSQL database
conn = pyodbc.connect(
    'DRIVER={SQL Server};'
    'SERVER=your_server;'
    'DATABASE=your_database;'
    'UID=your_username;'
    'PWD=your_password;'
)

# Query the MSSQL table
table_name = "your_table"  # Replace with your table name
table_column_name = "table_column"  # Replace with the column name in the table
query = f"SELECT {table_column_name} FROM {table_name}"
db_values = pd.read_sql(query, conn)

# Convert both columns to sets for comparison
csv_values = set(df[csv_column_name])
db_values_set = set(db_values[table_column_name])

# Find matching and non-matching values
matching_values = csv_values.intersection(db_values_set)
non_matching_values = csv_values.difference(db_values_set)

# Print results
print("Matching Values:")
print(matching_values)
print("\nNon-Matching Values:")
print(non_matching_values)

# Close the connection
conn.close()
