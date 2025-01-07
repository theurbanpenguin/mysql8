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
        query = "SELECT ManagerName, EmployeeName FROM employee_manager WHERE ManagerName = %s"
        cursor.execute(query, (user_name,))
        result = cursor.fetchone()  # Fetch the result of the query
        employee_name = f"Employee: {result[0]}"
        manager_name = f"Manager: {result[1]}"
        header_length = max(len(employee_name), len(manager_name))
        print("=" * header_length)
        print(employee_name, manager_name, sep="\n")  # Display the user and their manager
        print("=" * header_length)
except pymysql.MySQLError as e:
    # Handle any connection errors
    print(f"Error connecting to the database: {e}")

finally:
    # Ensure the connection is closed if it was successfully opened
    if 'connection' in locals() and connection.open:
        connection.close()
        print("Connection closed.")
