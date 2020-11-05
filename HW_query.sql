-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees as e inner join salaries as s on e.emp_no = s.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

select e.first_name, e.last_name, e.hire_date from employees as e
where hire_date between '1986-01-01' and '1986-12-31'

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.

select d.dept_no, de.dept_name, d.emp_no as manager_emp_no, e.last_name, e.first_name 
from dept_manager as d
inner join employees as e on d.emp_no = e.emp_no
inner join departments as de on d.dept_no = de.dept_no

-- 4. List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

select d_e.emp_no, e.last_name, e.first_name, d.dept_name 
from dept_emp as d_e 
inner join departments as d on d.dept_no = d_e.dept_no
inner join employees as e on d_e.emp_no = e.emp_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select e.first_name, e.last_name, e.sex from employees as e
where first_name = 'Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name from dept_emp as d_e
inner join departments as d on d.dept_no = d_e.dept_no and dept_name = 'Sales'
inner join employees as e on e.emp_no = d_e.emp_no

-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name from dept_emp as d_e
inner join departments as d on d.dept_no = d_e.dept_no 
and dept_name = 'Sales' or dept_name = 'Development'
inner join employees as e on e.emp_no = d_e.emp_no

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(*) from employees
group by last_name
order by 2 desc
