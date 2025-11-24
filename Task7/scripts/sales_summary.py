import os
import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

db_path = r"E:\Internship\DA Intern\Task7\data\sales_data.db"
conn = sqlite3.connect(db_path)

# SQL summary query
query = """
SELECT product, 
       SUM(quantity) AS total_qty,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY product;
"""

# Read data into DataFrame
df = pd.read_sql_query(query, conn)
conn.close()


print("\nSales Summary:")
print(df)

output_folder = r"E:\Internship\DA Intern\Task7\outputs"
os.makedirs(output_folder, exist_ok=True)

# Save CSV
csv_path = os.path.join(output_folder, "query_output.csv")
df.to_csv(csv_path, index=False)

# Create bar chart
df.plot(kind='bar', x='product', y='revenue', title='Revenue by Product')
plt.ylabel("Revenue (₹)")
chart_path = os.path.join(output_folder, "sales_chart.png")
plt.savefig(chart_path)
plt.show()


print("\n✔ Files saved successfully:")
print(f"- CSV Output: {csv_path}")
print(f"- Chart Image: {chart_path}")
