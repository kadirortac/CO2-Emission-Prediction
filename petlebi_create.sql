import pymysql

host = "127.0.0.1"
user = "root"
password = "123456"
database = "assignment"

# MySQL connection
conn = pymysql.connect(host=host, user=user, password=password, db=database, charset="utf8mb4")
cursor = conn.cursor()

create_table_query = """
    CREATE TABLE IF NOT EXISTS petlebi (
        product_id INT PRIMARY KEY,
        Product_Name VARCHAR(255),
        product_desc TEXT,
        product_price DECIMAL(10, 2),
        product_stock VARCHAR(50),
        product_brand VARCHAR(255),
        product_barcode VARCHAR(50),
        product_category VARCHAR(255),
        product_img VARCHAR(255),
        product_url VARCHAR(255),
        product_sku VARCHAR(20)
    )
"""

cursor.execute(create_table_query)
conn.commit()

conn.close()