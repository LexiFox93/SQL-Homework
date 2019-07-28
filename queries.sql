--employee detail - show employee number, last name, first name, gender & salary
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
INNER JOIN salaries s
ON e.emp_no=s.emp_no;

--list employees who were hired in 1986
SELECT emp_no, last_name, first_name, hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date)= '1986';

--list manager of each dept with dept_no, dept_name, mgr employee#, first & last name & start date & end date
SELECT d.dept_no, d.dept_name, dm.emp_no,  e.last_name, e.first_name, dm.from_date, dm.to_date
FROM department d
INNER JOIN dept_manager dm
ON dm.dept_no = d.dept_no
JOIN employees e
ON e.emp_no = dm.emp_no;

--list the department of each employee w/employee number, last name, first name & department name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
on de.emp_no = e.emp_no
JOIN department d
ON d.dept_no = de.dept_no;


--list all employees whose first name is 'Hercules' and last name begins w/'B'
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
--List all employees in the sales depatment, including employee number, last name, first name & department
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN department d
ON d.dept_no = de.dept_no
WHERE d.dept_name LIKE 'Sales';

--List all employees in the Sales and Development depts, including employee number, last name, first name & department
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN department d
ON d.dept_no = de.dept_no
WHERE d.dept_name LIKE 'Sales' OR d.dept_name LIKE 'Development';

--in descending order, list the frequency count of employee last names
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name 
ORDER BY "frequency" DESC;