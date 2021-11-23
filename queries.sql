select * from employees;

select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1955-12-31';

select first_name, last_name
from employees
where birth_date between '1953-01-01' and '1953-12-31';

select first_name, last_name
from employees
where birth_date between '1954-01-01' and '1954-12-31';

select first_name, last_name
from employees
where birth_date between '1955-01-01' and '1955-12-31';

-- Retirement eligibility
select first_name, last_name
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- Number of employees retiring
select count(first_name)
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- create table with retiring employees
select first_name, last_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

select * from retirement_info;

-- joining departments and dept_manager tables
select departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
from departments
inner join dept_manager
on departments.dept_no = dept_manager.dept_no;

-- joining retirement info and dept emp tables
select retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
	dept_employee.to_date
from retirement_info
left join dept_employee
on retirement_info.emp_no = dept_employee.emp_no;

-- joining departments and dept_manager tables
select d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no;

-- find currently employed retiring employees
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
into current_emp
from retirement_info as ri
left join dept_employee as de
on ri.emp_no=de.emp_no
where de.to_date = ('9999-01-01');

select * from current_emp;

-- counts, groupby, orderby

select count(ce.emp_no), de.dept_no
from current_emp as ce
left join dept_employee as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

-- count of retiring per dept in new table
select count(ce.emp_no), de.dept_no
into dept_retiring_count
from current_emp as ce
left join dept_employee as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

select * from dept_retiring_count;

-- employee info list - emp no, name, gender, salary

select e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender,
	s.salary,
	de.to_date
into emp_info
from employees as e
inner join salaries as s
on (e.emp_no=s.emp_no)
inner join dept_employee as de
on (e.emp_no=de.emp_no)
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31')
and (de.to_date = '9999-01-01');

-- management info list - emp no, name, start date, end date
select dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
into manager_info
from dept_manager as dm
	inner join departments as d
	on (dm.dept_no = d.dept_no)
	inner join current_emp as ce
	on (dm.emp_no = ce.emp_no);
	
-- department retirees
select ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
into dept_info
from current_emp as ce
inner join dept_employee as de
on (ce.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no);

-- sales retiring info
select * from retirement_info;

select ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
into sales_retirement_info
from retirement_info as ri
left join dept_employee as de
on ri.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

-- sales and development dept mentoring 
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
into sales_dev_mentoring_info
from retirement_info as ri
left join dept_employee as de
on ri.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where d.dept_name in('Sales', 'Development');