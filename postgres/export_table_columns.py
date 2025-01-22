import psycopg2
import pandas as pd
import os

# Define PostgreSQL connection details
db_config = {
    'dbname': 'your_database_name',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # Change if your database is hosted elsewhere
    'port': '5432'        # Default PostgreSQL port
}

# Specify the schema name
schema_name = 'test'

# Connect to the PostgreSQL database
try:
    conn = psycopg2.connect(**db_config)
    cursor = conn.cursor()

    # Query to list all table names in the schema
    cursor.execute(f"""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = '{schema_name}';
    """)
    tables = cursor.fetchall()

    # Create a directory for storing Excel files
    output_dir = 'postgres_schema_tables'
    os.makedirs(output_dir, exist_ok=True)

    # Loop through tables and get their column details
    for table in tables:
        table_name = table[0]

        # Query to get column names of the table
        cursor.execute(f"""
            SELECT column_name
            FROM information_schema.columns
            WHERE table_schema = '{schema_name}' AND table_name = '{table_name}';
        """)
        columns = [row[0] for row in cursor.fetchall()]

        # Create a DataFrame and save it as an Excel file
        df = pd.DataFrame(columns=['Column Name'], data=[[col] for col in columns])
        excel_path = os.path.join(output_dir, f"{table_name}.xlsx")
        df.to_excel(excel_path, index=False, sheet_name=table_name)

    # Close the cursor and connection
    cursor.close()
    conn.close()

    print(f"Excel files for all tables in schema '{schema_name}' have been saved to the directory '{output_dir}'.")

except Exception as e:
    print(f"An error occurred: {e}")
