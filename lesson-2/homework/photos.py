import pyodbc

conn = pyodbc.connect("DRIVER={SQL SERVER};SERVER=sql--database.database.windows.net;DATABASE=sql_database;Trusted_Connection=yes;")
cursor = conn.cursor()

cursor.execute("SELECT * FROM photos")
row = cursor.fetchone()

with open("/Users/a.fayzullayev/Desktop/pexels-souvenirpixels-414612.jpg", "wb") as f:
    f.write(row[1])

cursor.close()
conn.close()