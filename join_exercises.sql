-- 1. Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;
SELECT *
FROM users;

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
-- Join
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;
-- left join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
-- right join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT role_name, COUNT(role_name)
FROM users
JOIN roles ON users.role_id = roles.id
GROUP BY role_name;



-- Employees Database
-- 1. Use the employees database.

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
USE employees;
SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department manager'
FROM dept_manager dm
JOIN departments d
  ON dm.dept_no = d.dept_no
JOIN employees e
  ON dm.emp_no = e.emp_no
where to_date > curdate();  
  
  -- 3. Find the name of all departments currently managed by women.
SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department manager'
FROM dept_manager dm
JOIN departments d
ON dm.dept_no = d.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no
where to_date > curdate()
and gender = ('F'); 

-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT title,COUNT(*)
FROM employees
JOIN titles using (emp_no)
GROUP BY title;

  

-- 5. Find the current salary of all current managers
SELECT departments.dept_name, CONCAT (employees.first_name, ' ', employees.last_name) name, salaries.salary
FROM departments 
JOIN dept_manager using (dept_no)
JOIN employees using (emp_no)
JOIN salaries  using (emp_no)
where dept_manager.to_date > curdate() 
and salaries.to_date > curdate()
ORDER BY departments.dept_name ASC;

-- 6. Find the number of current employees in each department.

SELECT dept_no, dept_name, count(emp_no) as num_employees
FROM dept_emp de
JOIN departments d
USING (dept_no)
WHERE de.to_date = '9999-01-1'
GROUP BY d.dept_name
ORDER BY d.dept_no ASC;


-- 7. Which department has the highest average salary? Hint: Use current not historic information

SELECT d.dept_name, AVG(Salary) as average_salary
FROM dept_emp de
JOIN salaries s
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE s.to_date = '9999-01-01'
AND de.to_date = '9999-01-01' 
GROUP BY d.dept_name
ORDER BY AVG(Salary) DESC
LIMIT 1;

-- Sales has the highest average salary

-- 8. Who is the highest paid employee in the Marketing department?

SELECT departments.dept_name, CONCAT (employees.first_name, ' ', employees.last_name) name, salaries.salary
FROM departments 
JOIN dept_emp using (dept_no)
JOIN employees using (emp_no)
JOIN salaries  using (emp_no)
where dept_emp.to_date > curdate() 
and salaries.to_date > curdate()
and departments.dept_name = 'Marketing'
ORDER BY salaries.salary DESC
LIMIT 1;
-- The highest paid employee in the Marketing department is Akemi Warwick

-- 9. Which current department manager has the highest salary?

SELECT departments.dept_name, CONCAT (employees.first_name, ' ', employees.last_name) name, salaries.salary
FROM departments 
JOIN dept_manager using (dept_no)
JOIN employees using (emp_no)
JOIN salaries  using (emp_no)
where dept_manager.to_date > curdate() 
and salaries.to_date > curdate()
and departments.dept_name = 'Marketing'
ORDER BY departments.dept_name ASC;

-- The current department manager with the highest salary is Vishwani Minakawa

-- 10. Determine the average salary for each department. Use all salary information and round your results.

SELECT d.dept_name, round(AVG(Salary)) as average_salary
FROM dept_emp de
JOIN salaries s
USING (emp_no)
JOIN departments d
USING (dept_no)
GROUP BY d.dept_name
ORDER BY AVG(Salary) DESC;


