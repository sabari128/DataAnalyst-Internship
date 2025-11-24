import sqlite3
import os

db_path = r"E:\Internship\DA Intern\Task7\data"


os.makedirs(db_path, exist_ok=True)


db_file = os.path.join(db_path, "sales_data.db")

conn = sqlite3.connect(db_file)
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS sales (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    product TEXT,
    quantity INTEGER,
    price REAL
);
""")

sample_data = [
    ('Laptop', 3, 55000),
    ('Mouse', 10, 500),
    ('Keyboard', 5, 1500),
    ('Laptop', 2, 56000),
    ('Mouse', 8, 450)
]

cursor.executemany("INSERT INTO sales (product, quantity, price) VALUES (?, ?, ?)", sample_data)
conn.commit()
conn.close()

print("✔ Database created successfully at:")
print(db_file)
