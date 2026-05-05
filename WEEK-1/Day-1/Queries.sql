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
