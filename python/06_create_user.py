import pymysql
import getpass

# Database connection parameters
host = "localhost"
user = "tux"
password = "Password1"
database = "sample"

try:
    # Attempt to establish a connection
    connection = pymysql.connect(
        host=host,
        user=user,
        password=getpass.getpass("Enter your password: "),
        database=database
    )
    print("Connection successful!")  # If no exception is raised, the connection is established.

    # Prompt for username input to insert
    username_to_insert = input("Enter the Username to create: ")

    # Execute the stored procedure to insert a new user
    with connection.cursor() as cursor:
        try:
            # Calling the stored procedure
            cursor.callproc("insert_user", (username_to_insert,))
            connection.commit()  # Commit the transaction after the insert
            print(f"User '{username_to_insert}' has been successfully created.")
        except pymysql.MySQLError as e:
            # Handle any errors specifically related to the stored procedure
            print(f"Error while executing the stored procedure: {e}")

except pymysql.MySQLError as e:
    # Handle any connection errors
    print(f"Error connecting to the database: {e}")

finally:
    # Ensure the connection is closed if it was successfully opened
    if 'connection' in locals() and connection.open:
        connection.close()
        print("Connection closed.")
