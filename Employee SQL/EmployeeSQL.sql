-- Data Engineering / Table Creation

CREATE TABLE "salaries" (
  "emp_no" int,
  "salary" varchar(30),
  PRIMARY KEY ("emp_no")
);

CREATE TABLE "dept_emp" (
  "emp_no" int,
  "dept_no" varchar(30)
);

CREATE INDEX "PK, FK" ON  "dept_emp" ("emp_no", "dept_no");

CREATE TABLE "departments" (
  "dept_no" varchar(30),
  "dept_name" varchar(30),
  PRIMARY KEY ("dept_no")
);

CREATE TABLE "titles" (
  "title_id" varchar(30),
  "title" varchar(30),
  PRIMARY KEY ("title_id")
);

CREATE TABLE "employees" (
  "emp_no" int,
  "emp_title" varchar(30),
  "birth_date" varchar(30),
  "first_name" varchar(30),
  "last_name" varchar(30),
  "sex" varchar(30),
  "hire_date" varchar(30),
  PRIMARY KEY ("emp_no"),
  FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE "dept_manager" (
  "dept_no" varchar(30),
  "emp_no" int,
  PRIMARY KEY ("emp_no"),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);



-- Check import success

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM titles;


--#### Data Analysis


--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no as "Employee Number",
	   employees.last_name as "Last Name",
	   employees.first_name as "First Name",
	   employees.sex as "Sex",
	   salaries.salary as "Salary"
FROM employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name as "First Name",
	   last_name as "Last Name",
	   hire_date
FROM employees	   
WHERE hire_date LIKE '%1986';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT departments.dept_no,
       departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name
FROM departments
INNER JOIN dept_manager on departments.dept_no = dept_manager.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
FROM employees
INNER JOIN dept_emp on employees.emp_no = dept_emp.emp_no
INNER JOIN departments on dept_emp.dept_no = departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name,
	   last_name,
	   sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
FROM employees
INNER JOIN dept_emp on employees.emp_no = dept_emp.emp_no
INNER JOIN departments on dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
FROM employees
INNER JOIN dept_emp on employees.emp_no = dept_emp.emp_no
INNER JOIN departments on dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT DISTINCT(last_name) as "Last Name",
	   COUNT(last_name) as "Counts"
FROM employees
GROUP BY last_name
ORDER BY "Counts" DESC;
