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

-- 31. Select all employees ordered by their salary in ascending order
SELECT *
FROM Employee
ORDER BY salary ASC;

-- 32. Select all employees ordered by their age in descending order
SELECT *
FROM Employee
ORDER BY age DESC;

-- 33. Select all employees ordered by their hire date in ascending order
SELECT *
FROM Employee
ORDER BY hire_date ASC;

-- 34. Select employees ordered by their department and then by their salary
SELECT *
FROM Employee
ORDER BY department_id, salary;

-- 35. Select departments ordered by the total salary of their employees
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;

-- 36. Select employee names along with their department names
SELECT Employee.name, Department.name
FROM Employee
JOIN Department
ON Employee.department_id = Department.department_id;

-- 37. Select project names along with the department names they belong to
SELECT Project.name, Department.name
FROM Project
JOIN Department
ON Project.department_id = Department.department_id;

-- 38. Select employee names and their corresponding project names
SELECT Employee.name, Project.name
FROM Employee
JOIN Project
ON Employee.department_id = Project.department_id;

-- 39. Select all employees and their departments, including those without a department
SELECT Employee.name, Department.name
FROM Employee
LEFT JOIN Department
ON Employee.department_id = Department.department_id;

-- 40. Select all departments and their employees, including departments without employees
SELECT Department.name, Employee.name
FROM Department
LEFT JOIN Employee
ON Department.department_id = Employee.department_id;

-- 41. Select employees who are not assigned to any project
SELECT Employee.name
FROM Employee
LEFT JOIN Project
ON Employee.department_id = Project.department_id
WHERE Project.project_id IS NULL;

-- 42. Select employees and the number of projects their department is working on
SELECT Employee.name, COUNT(Project.project_id)
FROM Employee
LEFT JOIN Project
ON Employee.department_id = Project.department_id
GROUP BY Employee.name;

-- 43. Select the departments that have no employees
SELECT Department.name
FROM Department
LEFT JOIN Employee
ON Department.department_id = Employee.department_id
WHERE Employee.emp_id IS NULL;

-- 44. Select employee names who share the same department with 'John Doe'
SELECT name
FROM Employee
WHERE department_id =
(
SELECT department_id
FROM Employee
WHERE name = 'John Doe'
);

-- 45. Select the department name with the highest average salary
SELECT Department.name, AVG(Employee.salary)
FROM Employee
JOIN Department
ON Employee.department_id = Department.department_id
GROUP BY Department.name
ORDER BY AVG(Employee.salary) DESC
LIMIT 1;

-- 46. Select the employee with the highest salary
SELECT *
FROM Employee
WHERE salary =
(
SELECT MAX(salary)
FROM Employee
);

-- 47. Select employees whose salary is above the average salary
SELECT *
FROM Employee
WHERE salary >
(
SELECT AVG(salary)
FROM Employee
);

-- 48. Select the second highest salary from the Employee table
SELECT MAX(salary)
FROM Employee
WHERE salary <
(
SELECT MAX(salary)
FROM Employee
);

-- 49. Select the department with the most employees
SELECT department_id, COUNT(*)
FROM Employee
GROUP BY department_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 50. Select employees who earn more than the average salary of their department
SELECT name, salary, department_id
FROM Employee e1
WHERE salary >
(
SELECT AVG(salary)
FROM Employee e2
WHERE e1.department_id = e2.department_id
);

-- 51. Select the nth highest salary (example: 3rd highest)
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 52. Select employees who are older than all employees in the HR department
SELECT *
FROM Employee
WHERE age >
(
SELECT MAX(age)
FROM Employee
WHERE department_id = 2
);

-- 53. Select departments where the average salary is greater than 55000
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 54. Select employees who work in a department with at least 2 projects
SELECT *
FROM Employee
WHERE department_id IN
(
SELECT department_id
FROM Project
GROUP BY department_id
HAVING COUNT(project_id) >= 2
);

-- 55. Select employees who were hired on the same date as 'Jane Smith'
SELECT *
FROM Employee
WHERE hire_date =
(
SELECT hire_date
FROM Employee
WHERE name = 'Jane Smith'
);

-- 56. Select the total salary of employees hired in the year 2020
SELECT SUM(salary)
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- 57. Select the average salary of employees in each department, ordered by average salary descending
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC;

-- 58. Select departments with more than 1 employee and an average salary greater than 55000
SELECT department_id, COUNT(*), AVG(salary)
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1
AND AVG(salary) > 55000;

-- 59. Select employees hired in the last 2 years, ordered by hire date
SELECT *
FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR
ORDER BY hire_date;

-- 60. Select the total number of employees and average salary for departments with more than 2 employees
SELECT department_id, COUNT(*), AVG(salary)
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 61. Select the name and salary of employees whose salary is above the average salary of their department
SELECT name, salary
FROM Employee e1
WHERE salary >
(
SELECT AVG(salary)
FROM Employee e2
WHERE e1.department_id = e2.department_id
);

-- 62. Select the names of employees who are hired on the same date as the oldest employee in the company
SELECT name
FROM Employee
WHERE hire_date =
(
SELECT MIN(hire_date)
FROM Employee
);

-- 63. Select the department names along with the total number of projects they are working on
SELECT Department.name, COUNT(Project.project_id)
FROM Department
LEFT JOIN Project
ON Department.department_id = Project.department_id
GROUP BY Department.name
ORDER BY COUNT(Project.project_id) DESC;

-- 64. Select the employee name with the highest salary in each department
SELECT department_id, name, salary
FROM Employee e1
WHERE salary =
(
SELECT MAX(salary)
FROM Employee e2
WHERE e1.department_id = e2.department_id
);

-- 65. Select the names and salaries of employees who are older than the average age of employees in their department
SELECT name, salary
FROM Employee e1
WHERE age >
(
SELECT AVG(age)
FROM Employee e2
WHERE e1.department_id = e2.department_id
);
