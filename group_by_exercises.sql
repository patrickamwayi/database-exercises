-- 1. Create a new file named group_by_exercises.sql

-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

SELECT DISTINCT*
FROM titles;

-- There are 443308 unique titles

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name Like "%E"
AND last_name Like "E%"
GROUP BY last_name;
-- There are 5 employees

-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT first_name,last_name
FROM employees
WHERE last_name Like "%E"
AND last_name Like "E%"
GROUP BY first_name,last_name;
-- There are 846 unique combinations of first and last names

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
WHERE last_name Like "%q%"
AND last_name NOT LIKE "%qu%"
GROUP BY last_name;
/*
Chleq
Lindqvist
Qlwen
*/

-- 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT last_name, count(*) AS n_same_last_name
FROM employees
WHERE last_name Like "%q%"
AND last_name NOT LIKE "%qu%"
GROUP BY last_name;

-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT first_name, gender, count(*)
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya' 
    GROUP BY first_name, gender;
    
-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?    
SELECT Count(*),
LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name,1,4),'_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3-2))) AS username
 FROM employees
 GROUP BY username
 

    