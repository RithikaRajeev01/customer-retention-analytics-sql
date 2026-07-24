import pandas as pd
from sqlalchemy import create_engine

# Load CSV
df = pd.read_csv(
    r"C:\Users\Rithika Rajeev\Desktop\prep\sql portfolio\Customer-Retention-Analytics\telco_table.csv"
)

# Connect to MySQL
engine = create_engine(
    "mysql+pymysql://root:367sql@localhost:3306/telco_db"
)

# Import data into MySQL
df.to_sql(
    name="customers",
    con=engine,
    if_exists="replace",
    index=False
)

print("Dataset imported successfully!")