-- 31. Employees ordered by salary in ascending order
SELECT *
FROM Employee
ORDER BY salary ASC;

-- 32. Employees ordered by age in descending order
SELECT *
FROM Employee
ORDER BY age DESC;

-- 33. Employees ordered by hire date in ascending order
SELECT *
FROM Employee
ORDER BY hire_date ASC;

-- 34. Employees ordered by department and salary
SELECT *
FROM Employee
ORDER BY department_id, salary;

-- 35. Departments ordered by total salary of employees
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;
