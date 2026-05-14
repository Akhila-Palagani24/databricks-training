Employee SQL Queries
Overview
This project contains basic to intermediate SQL queries performed on an Employees table.

The queries demonstrate the use of:

SELECT
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
DISTINCT
IN
BETWEEN
LIKE
Aggregate Functions
Table Structure
CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT,
    city VARCHAR(50)
);
Topics Covered
1. Basic SELECT Queries
Display all employee details
Display employee names and salaries
Display employee names and departments
Display employee names and experience
2. WHERE Clause Queries
Employees from IT department
Employees working in Hyderabad
Employees with salary greater than 70000
Employees with experience less than 4 years
Employees from Finance department
3. Aggregate Functions
Total salary department-wise
Average salary in each department
Maximum salary in each department
Minimum experience department-wise
Count employees in each city
4. GROUP BY & HAVING
Departments having more than 3 employees
Departments where average salary is greater than 60000
Cities having more than 2 employees
Departments where total salary is greater than 200000
Departments where maximum salary is above 90000
5. Sorting & Limiting Records
Top 5 highest paid employees
Top 3 employees with highest experience
Top 2 salaries from Finance department
Top 4 employees from Hyderabad
Top 1 highest salary employee
6. DISTINCT Queries
Distinct department names
Distinct city names
Distinct salary values
Distinct department and city combinations
Distinct experience values
7. Comparison Operators
Salary >= 80000
Experience <= 3
Salary <> 45000
Salary < 50000
Experience > 5
8. Logical Operators
AND condition
OR condition
NOT condition
Examples:

IT employees with salary > 70000
Employees from Hyderabad OR Bangalore
Employees NOT from Sales department
9. IN & NOT IN Operators
Employees working in Hyderabad or Mumbai
Employees from IT or Finance
Employees not from Chennai or Pune
Employees with specific salary values
10. BETWEEN Operator
Salary between 50000 and 80000
Experience between 3 and 6
Employee IDs between 105 and 112
11. LIKE Operator
Names starting with 'R'
Names ending with 'a'
Names containing 'v'
Cities starting with 'B'
Departments ending with 's'
SQL Concepts Used
Concept	Description
SELECT	Retrieve data from table
WHERE	Filter records
GROUP BY	Group rows with same values
HAVING	Filter grouped records
ORDER BY	Sort records
LIMIT	Restrict number of rows
DISTINCT	Remove duplicate values
IN	Match multiple values
BETWEEN	Filter within range
LIKE	Pattern matching
Database Compatibility
These queries work in:

MySQL
PostgreSQL
SQLite
MariaDB
Note: LIMIT syntax may vary in SQL Server (TOP is used instead).

Example Query
SELECT emp_name, salary
FROM Employees
WHERE salary > 70000;
