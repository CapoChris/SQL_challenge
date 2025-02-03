# SQL_challenge

README: SQL Database Schema and Queries

Overview

This SQL script creates and manages an employee database with multiple tables related to employees, departments, job titles, salaries, and department assignments. The script includes both table creation and query execution to extract meaningful insights from the data.

Database Schema

The following tables are created:

1. Departments

  Stores department details.
  
  dept_no (Primary Key) - Unique identifier for departments.
  
  dept_name - Name of the department.

2. Employees

  Stores employee details.
  
  emp_no (Primary Key) - Unique identifier for employees.
  
  emp_title_id - Job title ID (Foreign Key references Titles).
  
  birth_date - Employee birth date.
  
  first_name - Employee first name.
  
  last_name - Employee last name.
  
  sex - Gender of the employee.
  
  hire_date - Date when the employee was hired.

3. Titles
  
  Stores job title details.
  
  title_id (Primary Key) - Unique identifier for job titles.
  
  title - Job title name.

4. Salaries
  
  Stores salary details for employees.
  
  emp_no (Primary Key & Foreign Key) - Employee ID.
  
  salary - Employee salary amount.

5. Department Employees

  Links employees to departments (Many-to-Many relationship).
  
  emp_no - Employee ID (Foreign Key references Employees).
  
  dept_no - Department ID (Foreign Key references Departments).
  
  Primary Key: Combination of emp_no and dept_no.

6. Department Managers

  Stores department manager details.
  
  dept_no - Department ID (Foreign Key references Departments).
  
  emp_no - Employee ID (Foreign Key references Employees).
  
  Primary Key: Combination of dept_no and emp_no.

Queries Overview

The script includes various SQL queries to retrieve employee and department-related insights:

1. Employee Salary Details

  Retrieves employee details along with their salaries.

2. Employees Hired in 1986

  Lists employees who were hired in the year 1986.

3. Department Managers with Employee Details

  Lists department managers along with department and employee details.

4. Employee Department Assignments

  Shows which employees belong to which departments.

5. Employees Named Hercules with Last Name Starting with 'B'

  Finds employees whose first name is 'Hercules' and last name starts with 'B'.

6. Employees in the Sales Department

  Retrieves all employees working in the Sales department.

7. Employees in Sales and Development Departments

  Lists employees belonging to either the Sales or Development department.

8. Employee Last Name Frequency

  Counts and ranks last names by the number of employees sharing each one.

How to Use This Script

  Set up a relational database (in pgAdmin4).

  Run the CREATE TABLE commands to set up the schema.
  
  Populate the tables with sample data (if not already provided).
  
  Execute the queries to extract insights from the database.
