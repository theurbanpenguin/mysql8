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

    # Execute a query to fetch employees under a specific manager
    with connection.cursor() as cursor:
        # Get manager name from user input
        manager_name = input("Enter the manager's name to query: ")

        query = """SELECT EmployeeName 
                   FROM employee_manager 
                   WHERE ManagerName = %s"""
        cursor.execute(query, (manager_name,))  # Parameterized query to avoid SQL Injection

        # Fetch all employees managed by the manager
        results = cursor.fetchall()

        if results:  # Check if there are any results
            # Print the manager's header
            header = f"Manager: {manager_name}"
            print("=" * len(header))
            print(header)
            print("=" * len(header))

            # Loop through and display each employee under the manager
            print(f"Employees under {manager_name}:")
            for (employee,) in results:  # Each row in results corresponds to an employee
                print(f"- {employee}")
        else:
            print(f"No employees found for Manager: {manager_name}")

except pymysql.MySQLError as e:
    # Handle any connection errors
    print(f"Error connecting to the database: {e}")

finally:
    # Ensure the connection is closed if it was successfully opened
    if 'connection' in locals() and connection.open:
        connection.close()
        print("Connection closed.")
