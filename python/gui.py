import tkinter as tk
from tkinter import ttk
import pymysql
from datetime import datetime

# Database connection details
host = "localhost"
user = "tux"
password = "Password1"
database = "northwind"

# Function to fetch employees from the database
def fetch_employees():
    try:
        connection = pymysql.connect(
            host=host,
            user=user,
            password=password,
            database=northwind
        )
        with connection.cursor() as cursor:
            cursor.execute("SELECT EmployeeID, FirstName, LastName, BirthDate FROM employees;")
            return cursor.fetchall()
    except pymysql.MySQLError as e:
        print(f"Database error: {e}")
        return []
    finally:
        if 'connection' in locals() and connection.open:
            connection.close()

# Function to display selected employee details
def show_employee_details(event):
    selected_id = employee_var.get()
    for emp in employees:
        if str(emp[0]) == selected_id:
            firstname = emp[1]
            lastname = emp[2]
            birthdate = emp[3]
            year = birthdate.year if birthdate else "Unknown"
            output_label.config(
                text=f"First Name: {firstname}\nLast Name: {lastname}\nYear of Birth: {year}"
            )
            break

# Fetch employees from the database
employees = fetch_employees()

# Create the GUI
root = tk.Tk()
root.title("Employee Viewer")

# Dropdown label
ttk.Label(root, text="Select an Employee:").grid(row=0, column=0, padx=10, pady=10)

# Dropdown menu
employee_var = tk.StringVar()
employee_dropdown = ttk.Combobox(
    root,
    textvariable=employee_var,
    state="readonly",
    values=[f"{emp[0]}: {emp[1]} {emp[2]}" for emp in employees]
)
employee_dropdown.grid(row=0, column=1, padx=10, pady=10)
employee_dropdown.bind("<<ComboboxSelected>>", show_employee_details)

# Output label
output_label = ttk.Label(root, text="", anchor="w", justify="left")
output_label.grid(row=1, column=0, columnspan=2, padx=10, pady=10)

# Run the application
root.mainloop()
