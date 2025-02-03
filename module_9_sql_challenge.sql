CREATE TABLE Departments (
    dept_no VARCHAR(30) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(30) NOT NULL,
    birth_date VARCHAR(30) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(30) NOT NULL,
    hire_date VARCHAR(30) NOT NULL
);

CREATE TABLE Titles (
    title_id VARCHAR(30) PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);

CREATE TABLE Salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Department_Employees (
    emp_no INT,
    dept_no VARCHAR(30),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Department_Manager (
    dept_no VARCHAR(30),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

ALTER TABLE Employees 
ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id);


-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
	ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT * 
FROM employees e
WHERE hire_date LIKE '%1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM department_manager dm
JOIN employees e
ON e.emp_no = dm.emp_no
JOIN department_employees de
	ON e.emp_no = de.emp_no
JOIN departments d
	ON d.dept_no = de.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN department_employees de
	ON de.emp_no = e.emp_no
JOIN departments d
	ON d.dept_no = de.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN department_employees de
	ON de.emp_no = e.emp_no
JOIN departments d
	ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN department_employees de
	ON de.emp_no = e.emp_no
JOIN departments d
	ON d.dept_no = de.dept_no
WHERE dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT (last_name) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;