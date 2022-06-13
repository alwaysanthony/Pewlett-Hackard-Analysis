SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
-- INTO emp_info
FROM employees as e

INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (dept_name is Sales)


--Create a new table with employee table and titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- retrieve the first occurrence of the employee number
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles 
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC, 
		to_date DESC;
		
-- retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(title),
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;