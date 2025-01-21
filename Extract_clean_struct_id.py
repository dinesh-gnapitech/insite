import psycopg2
import csv

# Database connection details
DB_HOST = "your_host"
DB_PORT = "your_port"
DB_NAME = "your_database"
DB_USER = "your_username"
DB_PASSWORD = "your_password"

# List of tables to process
tables = [
    "table1_name",
    "table2_name",
    "table3_name"
    # Add more table names as needed
]

# Base name for the output CSV files
OUTPUT_BASE_NAME = "structureguid_data"

try:
    # Connect to the PostgreSQL database
    conn = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    cursor = conn.cursor()

    for table in tables:
        print(f"Processing table: {table}")
        
        # Query to extract and clean data
        query = f"""
            SELECT 
                REPLACE(REPLACE(structureguid, '{{', ''), '}}', '') AS cleaned_structureguid
            FROM {table};
        """
        cursor.execute(query)

        # Fetch all rows
        rows = cursor.fetchall()

        # Define output file name based on table name
        output_csv = f"{OUTPUT_BASE_NAME}_{table}.csv"

        # Write to CSV
        with open(output_csv, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(["structureguid"])  # Write header
            writer.writerows(rows)  # Write data rows

        print(f"Data from table '{table}' successfully exported to {output_csv}")

except Exception as e:
    print("Error:", e)

finally:
    if cursor:
        cursor.close()
    if conn:
        conn.close()
