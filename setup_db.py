import sqlite3

# Connect to database (creates if it doesn't exist)
conn = sqlite3.connect("characters.db")
cursor = conn.cursor()

# Read SQL file and execute it
with open("initialize_db.sql", "r") as sql_file:
    sql_script = sql_file.read()
    cursor.executescript(sql_script)

# Commit and close
conn.commit()
conn.close()

print("Database setup complete!")