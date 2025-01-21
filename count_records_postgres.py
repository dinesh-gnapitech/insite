import psycopg2
from fpdf import FPDF

# Database connection details
DB_CONFIG = {
    'dbname': 'your_database',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'your_host',
    'port': 'your_port'
}

SCHEMA_NAME = 'your_schema'

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

        # Count records in each table
        table_counts = []
        for table in tables:
            table_name = table[0]
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

# Function to generate PDF
def generate_pdf(table_counts, output_file):
    pdf = FPDF()
    pdf.set_auto_page_break(auto=True, margin=15)
    pdf.add_page()
    pdf.set_font("Arial", size=12)
    
    pdf.cell(200, 10, txt=f"Table Record Counts in Schema: {SCHEMA_NAME}", ln=True, align='C')
    pdf.ln(10)
    
    pdf.set_font("Arial", size=10)
    pdf.cell(50, 10, txt="Table Name", border=1, align='C')
    pdf.cell(50, 10, txt="Record Count", border=1, align='C')
    pdf.ln()

    for table_name, count in table_counts:
        pdf.cell(50, 10, txt=table_name, border=1)
        pdf.cell(50, 10, txt=str(count), border=1)
        pdf.ln()
    
    pdf.output(output_file)
    print(f"PDF generated: {output_file}")

if __name__ == "__main__":
    table_counts = get_table_counts()
    if table_counts:
        generate_pdf(table_counts, "table_counts.pdf")
    else:
        print("No tables found or an error occurred.")
