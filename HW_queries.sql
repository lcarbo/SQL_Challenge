--List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
	from employees as e
	left join salaries as s 
	on e.emp_no = s.emp_no
;

--List first name, last name, and hire date for employees who were hired in 1986.
delete if exists hire_year_view;
CREATE VIEW hire_year_view AS
SELECT
first_name, last_name, hire_date, 
extract (year from hire_date) as hire_year
FROM employees
;

select * from hire_year_view 
	where hire_year = 1986
;

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
	
select e.emp_no, e.last_name, e.first_name, d.dept_name, d.dept_no
	from employees as e
	left join dept_manager as dm 
		on e.emp_no = dm.emp_no
	left join departments as d
		on dm.dept_no = d.dept_no
; 

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	left join dept_emp as de 
		on e.emp_no = de.emp_no
	left join departments as d
		on de.dept_no = d.dept_no
;

--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

select first_name, last_name, sex from employees 
	where first_name = 'Hercules' AND last_name like 'B%'
;

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	left join dept_emp as de 
		on e.emp_no = de.emp_no
	left join departments as d
		on de.dept_no = d.dept_no
		where d.dept_name = 'Sales'
;

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	left join dept_emp as de 
		on e.emp_no = de.emp_no
	left join departments as d
		on de.dept_no = d.dept_no
		where d.dept_name = 'Sales' OR d.dept_name = 'Development'
;

--In descending order, list the frequency count of employee last names
--i.e., how many employees share each last name.
select last_name, count(last_name) as "last_name_count"
from employees 
group by last_name 
order by "last_name_count" DESC
;

--epilogue
select * from employees
where emp_no = 499942

