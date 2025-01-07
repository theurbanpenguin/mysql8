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

    # Demonstrate the connection by executing a view query
    with connection.cursor() as cursor:
        # To avoid SQL Injection attacks use parameterised queries
        user_name = input("Enter the username to query: ")
        query = "SELECT EmployeeName, ManagerName FROM employee_manager WHERE EmployeeName = %s"
        cursor.execute(query, (user_name,))
        result = cursor.fetchone()  # Fetch the result of the query
        print(f"Database server time: {result[0]}")  # Display the user

except pymysql.MySQLError as e:
    # Handle any connection errors
    print(f"Error connecting to the database: {e}")

finally:
    # Ensure the connection is closed if it was successfully opened
    if 'connection' in locals() and connection.open:
        connection.close()
        print("Connection closed.")
