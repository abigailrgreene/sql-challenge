CREATE TABLE "employees" (
  "emp_no" varchar(30),
  "emp_title" varchar(30),
  "birth_date" varchar(30),
  "first_name" varchar(30),
  "last_name" varchar(30),
  "sex" varchar(30),
  "hire_date" varchar(30),
  PRIMARY KEY ("emp_no")
);

CREATE TABLE "salaries" (
  "emp_no" varchar(30),
  "salary" varchar(30)
);

CREATE TABLE "dept_emp" (
  "emp_no" varchar(30),
  "dept_no" varchar(30)
);

CREATE TABLE "dept_manager" (
  "dept_no" varchar(30),
  "emp_no" varchar(30)
);

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

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM titles;

