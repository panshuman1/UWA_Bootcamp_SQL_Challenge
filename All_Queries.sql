--1.List the employee number, last name, first name, sex, and salary of each employee.
--Record Count 300024
SELECT a.emp_no,
       a.last_name,
       a.first_name,
       a.sex,
       To_char(To_number(s.salary), 'fm9999999D90')
FROM   employees a,
       salaries s
WHERE  a.emp_no = s.emp_no
ORDER  BY a.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
--Record Count 36150
SELECT a.emp_no,
       a.last_name,
       a.first_name,
       a.sex,
       a.hire_date
FROM   employees a
WHERE  1 = 1
       AND To_char(a.hire_date, 'yyyy') = 1986
ORDER  BY a.hire_date DESC;

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
--# Each department have multiple managers inside dept_manager table.
SELECT d.dept_no,
       d.dept_name    department_name,
       dm.emp_no      Manager_no,
       emp.first_name Manager_FName,
       emp.last_name  Manager_LName
FROM   departments d,
       dept_manager dm,
       employees emp
WHERE  d.dept_no = dm.dept_no
       AND dm.emp_no = emp.emp_no
ORDER  BY d.dept_name,
          emp.first_name;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no,
       de.emp_no,
       emp.first_name,
       emp.last_name,
       d.dept_name
FROM   dept_emp de,
       departments d,
       employees emp
WHERE  1 = 1
       AND de.dept_no = d.dept_no
       AND de.emp_no = emp.emp_no
ORDER  BY 1,
          3;

--5.List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
       last_name,
       sex
FROM   employees
WHERE  first_name = 'Hercules'
       AND last_name LIKE 'B%'
ORDER  BY 1;

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_no,
       emp.first_name,
       emp.last_name
FROM   dept_emp de,
       departments d,
       employees emp
WHERE  1 = 1
       AND de.dept_no = d.dept_no
       AND de.emp_no = emp.emp_no
       AND d.dept_name = 'Sales'
ORDER  BY 2;

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no,
       emp.first_name,
       emp.last_name,
       d.dept_name
FROM   dept_emp de,
       departments d,
       employees emp
WHERE  1 = 1
       AND de.dept_no = d.dept_no
       AND de.emp_no = emp.emp_no
       AND d.dept_name IN ( 'Sales', 'Development' )
ORDER  BY 1,
          3;

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT xx.last_name,
       xx.freq_cnt
FROM   (SELECT last_name last_name,
               Count(1)  freq_cnt
        FROM   employees
        GROUP  BY last_name) xx
ORDER  BY 2 DESC 