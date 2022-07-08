-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query

SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE emp_no Like "%101010%"
GROUP BY emp_no;

-- subquery
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE emp_no in (
Select emp_no
FROM employees
WHERE emp_no = 101010);


-- 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT emp_no
FROM employees
WHERE first_name = 'Aamod';

SELECT title
FROM titles
WHERE emp_no IN (SELECT emp_no
				FROM employees
				WHERE first_name = 'Aamod')
AND to_date > CURDATE()
GROUP BY title;

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT emp_no
FROM employees 
WHERE emp_no IN
            (SELECT emp_no
	         FROM dept_emp
	         WHERE to_date < now());
-- 85108 people in the employees table are no longer working for the company.

-- 4. Find all the current department managers that are female. List their names in a comment in your code.

USE employees;
SELECT * 
FROM employees
WHERE emp_no IN (
				SELECT emp_no
				FROM dept_manager
				WHERE to_date >now())               
AND gender = 'F';
-- The current department managers that are female:
/*
Isamu Legletner
Karsten Sigstam
Leon DasSarma
Hilary Kambil
*/

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT emp_no
FROM salaries
WHERE to_date>now()
AND

            salary > (SELECT avg(salary)
	         FROM salaries);
	         
-- The employees who currently have a higher salary than the companies overall, historical average salary is 154543 employees.
   
   
-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.

SELECT emp_no
FROM salaries
WHERE to_date>now()
AND

            salary > (SELECT stddev(salary)
	         FROM salaries);
-- 33 salaries. 
SELECT MAX(salary) from employees.salaries;
-- Max salary 158220
SELECT MIN(salary) from employees.salaries;
-- Min salary 38623
   
-- percentage 38623/158220*100%
-- percentage 24%