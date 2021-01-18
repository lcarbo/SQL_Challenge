

--drop tables in reverse order of dependencies
--Drop table if exists titles;  
--Drop table if exists employees;
--Drop table if exists departments;
--Drop table if exists dept_emp;
--Drop table if exists dept_manager;
--Drop table if exists salaries;

CREATE TABLE titles (
    title_id integer Primary Key,
    title VARCHAR NOT NULL
);

CREATE TABLE employees(
    emp_no Integer primary key,
	emp_title_id  Integer NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	foreign key (emp_title_id) references titles(title_id)
     );

CREATE TABLE departments(
	dept_no integer Primary Key, 
	dept_name VARCHAR
); 

CREATE TABLE dept_emp (
    emp_no integer primary key,
    dept_no integer, 
	foreign key (dept_no) references departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no integer,
    emp_no integer,
	foreign key (dept_no) references departments(dept_no)
);


CREATE TABLE salaries (
    emp_no integer,
    salary integer, 
	foreign key (emp_no) references employees(emp_no)
);

--import data using import wizard
select * from departments;