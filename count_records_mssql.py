import pyodbc
from fpdf import FPDF

# Database connection details
connection_string = "DRIVER={SQL Server};SERVER=SQLGISTRXTST.lgeenergy.int;DATABASE=GISTRX;UID=electric;PWD="

SCHEMA_NAME = 'electric'  # schema name

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

        # Count records in each table
        table_counts = []
        for table in tables:
            table_name = table[0]
            print("Table_name:",table_name)
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
        generate_pdf(table_counts, "GISTRX_DB_table_entries_count.pdf")
    else:
        print("No tables found or an error occurred.")
