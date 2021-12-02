-- DELIVERABLE 1

SELECT e.emp_no, e.first_name, e.last_name,
	   t.title, t.from_date, t.to_date
INTO RetirementTable
FROM employees as e
INNER JOIN titles as t ON (e.emp_no = t.emp_no)
WHERE (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no;

select * from RetirementTable
where first_name = 'Kyoichi';


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO UniqueTitle
FROM RetirementTable
ORDER BY emp_no, to_date DESC;

select * from UniqueTitle;

-- Create a table with number of people retiring by title
select count (u.emp_no), u.title
into RetireTitles
from UniqueTitle as u
group by title
order by count(title) desc;

select * from RetireTitles;

-- DELIVERABLE 2
select  distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
	   d.from_date, d.to_date,
	   t.title
into mentoring
from employees as e
left join dept_employee as d
on e.emp_no=d.emp_no
left join titles as t
on e.emp_no = t.emp_no
where(e.birth_date between '1965-01-01' and '1965-12-31')
	and (d.to_date = '9999-01-01')
order by e.emp_no;

select * from mentoring;