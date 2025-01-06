import pymysql

# Connection details
host = "localhost"
user = "tux"
password = "Password1"
database = "northwind"

try:
    # Establish connection
    connection = pymysql.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )
    print("Connection to the database was successful!")

    # Create a cursor object
    with connection.cursor() as cursor:
        # Example query
        cursor.execute("SELECT * FROM customers LIMIT 5;")
        # Fetch results
        results = cursor.fetchall()
        print("Sample data from the Customers table:")
        for row in results:
            print(row)

except pymysql.MySQLError as e:
    print(f"An error occurred: {e}")
finally:
    # Ensure the connection is closed
    if 'connection' in locals() and connection.open:
        connection.close()
        print("Connection closed.")
