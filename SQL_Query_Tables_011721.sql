

--drop tables in reverse order of dependencies
Drop table if exists salaries;
Drop table if exists dept_manager;
Drop table if exists dept_emp;
Drop table if exists departments;
Drop table if exists employees;
Drop table if exists titles;  

CREATE TABLE titles (
    title_id VARCHAR Primary Key,
    title VARCHAR NOT NULL
);

CREATE TABLE employees(
    emp_no integer primary key,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	foreign key (emp_title_id) references titles(title_id)
     );

CREATE TABLE departments(
	dept_no VARCHAR Primary Key, 
	dept_name VARCHAR
); 

--issue with uploading data when setting empno as primary key?
CREATE TABLE dept_emp (
    emp_no integer,
    dept_no VARCHAR
	--foreign key (dept_no) references departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no integer,
	foreign key (dept_no) references departments(dept_no)
);


CREATE TABLE salaries (
    emp_no integer,
    salary integer, 
	foreign key (emp_no) references employees(emp_no)
);

--import data using import wizard
select * from dept_emp;