# Employee SQL Queries

## 📌 Overview

This repository contains a collection of basic to intermediate SQL queries performed on an `Employees` table. The purpose of this project is to strengthen SQL fundamentals through practical query execution and data analysis.

The queries cover essential SQL concepts including data retrieval, filtering, sorting, grouping, aggregation, and pattern matching.

---

## 🗂 Table Structure

```sql
CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT,
    city VARCHAR(50)
);
```

---

## 🚀 SQL Concepts Covered

### 🔹 Basic SELECT Queries

* Retrieve all employee records
* Display selected columns
* Fetch employee names, salaries, departments, and experience details

---

### 🔹 Filtering Data using WHERE

* Employees from specific departments
* Employees from particular cities
* Salary-based filtering
* Experience-based filtering

Examples:

* Employees from IT department
* Salary greater than 70000
* Experience less than 4 years

---

### 🔹 Aggregate Functions

Used aggregate functions for data analysis:

* `SUM()` → Total salary
* `AVG()` → Average salary
* `MAX()` → Highest salary
* `MIN()` → Lowest experience
* `COUNT()` → Employee count

---

### 🔹 GROUP BY & HAVING

Performed grouped analysis to understand department-wise and city-wise employee data.

Examples:

* Departments with more than 3 employees
* Departments where average salary exceeds 60000
* Cities with multiple employees

---

### 🔹 Sorting & Limiting Records

Used sorting and limiting operations to retrieve top records.

Examples:

* Top 5 highest-paid employees
* Employees with highest experience
* Highest salary employee

Concepts used:

* `ORDER BY`
* `LIMIT`

---

### 🔹 DISTINCT Queries

Retrieved unique values from columns such as:

* Departments
* Cities
* Salary values
* Experience values

---

### 🔹 Comparison Operators

Practiced filtering using operators like:

* `>`
* `<`
* `>=`
* `<=`
* `<>`

Examples:

* Salary >= 80000
* Experience > 5

---

### 🔹 Logical Operators

Worked with:

* `AND`
* `OR`
* `NOT`

Examples:

* IT employees with salary > 70000
* Employees from Hyderabad OR Bangalore
* Employees NOT from Sales department

---

### 🔹 IN & NOT IN Operators

Filtered records using multiple values.

Examples:

* Employees from IT or Finance
* Employees working in Hyderabad or Mumbai
* Employees not from Chennai or Pune

---

### 🔹 BETWEEN Operator

Used range-based filtering for:

* Salary ranges
* Experience ranges
* Employee ID ranges

---

### 🔹 LIKE Operator

Performed pattern matching using:

* `%` wildcard
* `_` wildcard

Examples:

* Names starting with 'R'
* Cities starting with 'B'
* Departments ending with 's'

---

## 🛠 SQL Features Used

| SQL Concept | Purpose               |
| ----------- | --------------------- |
| SELECT      | Retrieve data         |
| WHERE       | Filter records        |
| GROUP BY    | Group rows            |
| HAVING      | Filter grouped data   |
| ORDER BY    | Sort results          |
| LIMIT       | Restrict output rows  |
| DISTINCT    | Remove duplicates     |
| IN          | Match multiple values |
| BETWEEN     | Filter within ranges  |
| LIKE        | Pattern matching      |

---

## 💻 Database Compatibility

These queries are compatible with:

* MySQL
* PostgreSQL
* SQLite
* MariaDB

> Note: SQL Server uses `TOP` instead of `LIMIT`.

---

## 📖 Example Query

```sql
SELECT emp_name, salary
FROM Employees
WHERE salary > 70000;
```

---

## 🎯 Learning Outcome

This project helped improve my understanding of SQL fundamentals and strengthened my ability to write efficient queries for real-world database operations. It also provided hands-on experience with filtering, grouping, sorting, aggregation, and data analysis techniques.
