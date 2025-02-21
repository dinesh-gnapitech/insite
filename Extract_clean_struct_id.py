import psycopg2
import csv

# Database connection details
DB_HOST = 'pplz-psql-iqgeo-ky-trx-d.postgres.database.azure.com'
DB_PORT = 5432
DB_NAME = 'iqgeo_dev'
DB_USER = 'iqgeo'
DB_PASSWORD = 'kl='
schema_name ='mywetl'

# List of tables to process
tables = [
    "eun_e_switch_bank_assembly_protofeature",
"eun_e_substation_transformer_protofeature",
"eun_e_line_switch_protofeature",
"eun_e_substation_circuit_breaker_protofeature",
"eun_e_substation_disconnecting_switch_protofeature",
"eun_e_lattice_structure_protofeature",
"eun_e_pole_protofeature",
"eun_e_network_terminator_protofeature",
"eun_e_pole_structure_protofeature",
"eun_e_lattice_protofeature",
"eun_e_support_pole_protofeature"
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
            FROM {schema_name}.{table};
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
