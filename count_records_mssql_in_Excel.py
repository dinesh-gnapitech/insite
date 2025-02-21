import pyodbc
import openpyxl
from openpyxl import Workbook

# Database connection details
connection_string = "DRIVER={SQL Server};SERVER=SQLGISTRXTST.lgeenergy.int;DATABASE=LKE_Insite;UID=electric;PWD="


SCHEMA_NAME = 'dbo'  # Replace with your schema name, e.g., 'dbo' for the default schema

# Function to get table counts
def get_table_counts():
    try:
        # Connect to MSSQL Server
        conn = pyodbc.connect(connection_string)
        cursor = conn.cursor()
        
        # Get all tables in the specified schema
        cursor.execute(f"""
            SELECT TABLE_NAME
            FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = '{SCHEMA_NAME}' AND TABLE_TYPE = 'BASE TABLE';
        """)
        tables = cursor.fetchall()

        # Validate that tables exist in the schema
        if not tables:
            print(f"No tables found in schema '{SCHEMA_NAME}'")
            return []

        # Count records in each table
        table_counts = []
        for table in tables:
            table_name = table[0]
            # Use dynamic query to count rows in each table
            query = f"SELECT COUNT(*) FROM [{SCHEMA_NAME}].[{table_name}];"
            cursor.execute(query)
            count = cursor.fetchone()[0]
            table_counts.append((table_name, count))
            print("Table Name:",table_name)
            print("No. of Records:",count)
        
        # Close the connection
        cursor.close()
        conn.close()
        
        return table_counts

    except Exception as e:
        print("Error:", e)
        return []

# Function to generate Excel file
def generate_excel(table_counts, output_file):
    # Create a new workbook
    wb = Workbook()
    ws = wb.active
    ws.title = "Table Record Counts"

    # Add headers
    ws.append(["Table Name", "Record Count"])

    # Add table counts
    for table_name, count in table_counts:
        ws.append([table_name, count])

    # Save the Excel file
    wb.save(output_file)
    print(f"Excel file generated: {output_file}")

if __name__ == "__main__":
    table_counts = get_table_counts()
    if table_counts:
        generate_excel(table_counts, "LKE_Insite_DB_table_entries_count_(LKE_Side).xlsx")
    else:
        print("No tables found or an error occurred.")
