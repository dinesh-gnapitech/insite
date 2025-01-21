import psycopg2
import openpyxl
from openpyxl import Workbook

# Database connection details
DB_CONFIG = {
    'dbname': 'your_database',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'your_host',
    'port': 'your_port'
}

SCHEMA_NAME = 'your_schema'  # Replace with your schema name, e.g., 'public'

# Function to get table counts
def get_table_counts():
    try:
        # Connect to PostgreSQL
        conn = psycopg2.connect(**DB_CONFIG)
        cursor = conn.cursor()
        
        # Get all tables in the specified schema
        cursor.execute(f"""
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = '{SCHEMA_NAME}' AND table_type = 'BASE TABLE';
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
            # Count rows in each table
            cursor.execute(f"SELECT COUNT(*) FROM {SCHEMA_NAME}.{table_name};")
            count = cursor.fetchone()[0]
            table_counts.append((table_name, count))
        
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
        generate_excel(table_counts, "table_counts_postgres.xlsx")
    else:
        print("No tables found or an error occurred.")
