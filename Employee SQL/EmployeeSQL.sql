
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



drop table titles;

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM titles;


--#### Data Analysis


--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

--2. List first name, last name, and hire date for employees who were hired in 1986.

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

