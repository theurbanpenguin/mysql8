import pymysql
import getpass

# Database connection parameters
host = "localhost"
user = "tux"
password = "Password1"
database = "northwind"

try:
    # Attempt to establish a connection
    connection = pymysql.connect(
        host=host,
        user=user,
        password=getpass.getpass("Enter your password: "),
        database=database
    )
    print("Connection successful!")  # If no exception is raised, the connection is established.

    # Demonstrate the connection by executing a simple query
    with connection.cursor() as cursor:
        # Query to get the current date and time from the database
        cursor.execute("SELECT NOW();")
        result = cursor.fetchone()  # Fetch the result of the query
        print(f"Database server time: {result[0]}")  # Display the server time

except pymysql.MySQLError as e:
    # Handle any connection errors
    print(f"Error connecting to the database: {e}")

finally:
    # Ensure the connection is closed if it was successfully opened
    if 'connection' in locals() and connection.open:
        connection.close()
        print("Connection closed.")
