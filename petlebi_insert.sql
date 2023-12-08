import pymysql

host = "127.0.0.1"
user = "root"
password = "123456"
database = "assignment"

try:
    # MySQL connection
    conn = pymysql.connect(host=host, user=user, password=password, db=database, charset="utf8mb4")
    cursor = conn.cursor()

    query = """
        INSERT INTO petlebi (
            product_id, Product_Name, product_desc, product_price,
            product_stock, product_brand, product_barcode,
            product_category, product_img, product_url, product_sku
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """

    values = (
        1010101, "Ürün Adı", "Ürün açıklaması", 99.99,
        "Stok", "Marka", "Barkod",
        "Kategori", "Ürün Resmi", "Ürün URL", None
    )

    cursor.execute(query, values)
    conn.commit()
    print("veri kaydedildi")
except pymysql.MySQLError as e:
    print(f"MySQL Error: {e}")

finally:
    if conn:
        conn.close()
