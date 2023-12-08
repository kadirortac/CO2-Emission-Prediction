import json
import pymysql

host = "127.0.0.1"
user = "root"
password = "123456"
database = "assignment"

# Read data from json file
with open("petlebi_products.json", "r", encoding="utf-8") as json_file:
    products = json.load(json_file)

# MySQL connection
try:
    conn = pymysql.connect(host=host, user=user, password=password, db=database, charset="utf8mb4")
    print("Bağlantı Başarılı")

    
    with conn.cursor() as cursor:
        # add data to mysql
        for product in products:
            query = """
                INSERT INTO petlebi (
                    product_id, Product_Name, product_desc, product_price,
                    product_stock, product_brand, product_barcode,
                    product_category, product_img, product_url, product_sku
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            values = (
                product["product_id"], product["Product_Name"],
                product.get("product_desc", None),  # if there is no data then add as none
                product.get("product_price", None),
                product.get("product_stock", None),
                product.get("product_brand", None),
                product.get("product_barcode", None),
                product.get("product_category", None),
                product.get("product_img", None),
                product.get("product_url", None),
                product.get("product_sku", None)
            )
            cursor.execute(query, values)

    conn.commit()

except pymysql.MySQLError as e:

    print(f"MySQL Error: {e}")

finally:
    
    if conn:
        conn.close()
