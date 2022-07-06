USE employees;
SELECT * 
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya');
-- The number of records returned is 709 names
USE employees;
SELECT *
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya' ;
    -- Yes it does match the number of rows on Q2
USE employees;
SELECT * 
FROM employees 
WHERE ((first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya') 
    AND (gender = 'M')); 
-- Number of records returned is 441 rows
SELECT *
FROM employees
WHERE last_name Like "E%";
-- The number of employees whose last name starts with E is 7330
SELECT *
FROM employees
WHERE last_name Like "E%"
OR last_name like "%E";
-- The number of employees that have a last name that ends with E, but does not start with E are 30723
SELECT *
FROM employees
WHERE last_name Like "%E"
AND last_name like "E%";
-- The number of employees whose last name starts and ends with E are 899
SELECT * FROM employees;

SELECT *
FROM employees
WHERE hire_date LIKE '199%';
-- The number of employees returned are 135214
SELECT * FROM employees;
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25%';
-- The number of employees born on Christmas are 842
SELECT * FROM employees;
SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25%';
-- The number of employees hired in the 90s and born on Christmas are 362
SELECT *
FROM employees
WHERE last_name Like "q%";
-- The number of employees with a q in their last name is 718

SELECT * 
FROM employees
WHERE last_name Like "%q%"
AND last_name NOT LIKE "%qu%";
-- The number of employees found is 547