-- View all of the tables
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM department_employees;
SELECT * FROM department_manager;


-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no; 


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = DATE '1986-01-01';


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM department_manager AS dm
JOIN departments AS d
ON dm.dept_no = d.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no;
 

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees AS e
JOIN department_employees AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no;


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
-- a. What is the department number for the Sales department?
SELECT *
FROM departments
WHERE dept_name = 'Sales';
-- Sales = d007
-- b. Filter by the Sales department number
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE e.emp_no IN
    (SELECT de.emp_no
    FROM department_employees AS de
    WHERE de.dept_no = 'd007');


-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- a. What are the department numbers for the Sales and Development departments?
-- Sales = d007
SELECT * 
FROM departments
WHERE dept_name = 'Development';
-- Development = d005
-- b. Filter by the Sales and Development department numbers
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN department_employees AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007' OR d.dept_no = 'd005';


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;