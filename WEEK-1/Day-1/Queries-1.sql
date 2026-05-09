-- 1. Select all columns from the Employee table [cite: 53]
SELECT * FROM Employee;

-- 2. Select only the name and salary columns from the Employee table [cite: 54]
SELECT name, salary FROM Employee;

-- 3. Select employees who are older than 30 [cite: 58]
SELECT * FROM Employee WHERE age > 30;

-- 4. Select the names of all departments [cite: 59]
SELECT name FROM Department;

-- 5. Select employees who work in the IT department [cite: 61]
SELECT * FROM Employee 
WHERE department_id = (SELECT department_id FROM Department WHERE name = 'IT');

--6: Select employees whose names start with 'J'.
SELECT * 
FROM Employee
WHERE name LIKE 'J%';

---- 7. Select employees whose names end with 'e'
SELECT *
FROM Employee
WHERE name LIKE '%e';

-- 8. Select employees whose names contain 'a'
SELECT *
FROM Employee
WHERE name LIKE '%a%';

-- 9. Select employees whose names are exactly 9 characters long
SELECT *
FROM Employee
WHERE name LIKE '_________';

-- 10. Select employees whose names have 'o' as the second character
SELECT *
FROM Employee
WHERE name LIKE '_o%';

-- 11. Employees hired in 2020
SELECT * 
FROM Employee
WHERE hire_date LIKE '2020%';

-- 12. Employees hired in January
SELECT *
FROM Employee
WHERE hire_date LIKE '____-01-%';

-- 13. Employees hired before 2019
SELECT *
FROM Employee
WHERE hire_date < '2019-01-01';

-- 14. Employees hired on or after March 1, 2021
SELECT *
FROM Employee
WHERE hire_date >= '2021-03-01';

-- 15. Employees hired in last 2 years
SELECT *
FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;

-- 16. Total salary of all employees
SELECT SUM(salary) AS total_salary
FROM Employee;

-- 17. Average salary of employees
SELECT AVG(salary) AS average_salary
FROM Employee;

-- 18. Minimum salary in Employee table
SELECT MIN(salary) AS minimum_salary
FROM Employee;

-- 19. Number of employees in each department
SELECT department_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY department_id;

-- 20. Average salary in each department
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;

-- 21. Total salary for each department
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- 22. Average age of employees in each department
SELECT department_id, AVG(age) AS average_age
FROM Employee
GROUP BY department_id;

-- 23. Number of employees hired in each year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total_employees
FROM Employee
GROUP BY YEAR(hire_date);

-- 24. Highest salary in each department
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- 25. Department with highest average salary
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;

-- 26. Departments with more than 2 employees
SELECT department_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 27. Departments with average salary greater than 55000
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 28. Years with more than 1 employee hired
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total_employees
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- 29. Departments with total salary less than 100000
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- 30. Departments with maximum salary above 75000
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;
