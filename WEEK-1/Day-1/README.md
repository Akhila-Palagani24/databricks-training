Databricks-training
📘 SQL Practice - Day 1
🚀 Overview

On Day 1, I practiced the basics of SQL using tables like Employee, Department, and Project. The focus was on learning how to retrieve, filter, sort, and analyze data using SQL queries.

You can view my complete Day 1 SQL practice here:

https://www.db-fiddle.com/f/4TtDKqyFyiFfYd22omVtB3/6

This link contains the full database schema, SQL queries, and outputs created using DB Fiddle.

🧠 Topics Covered
🔹 1. Basic SELECT Queries
Selecting all columns and specific columns
Using:
SELECT *
Column-based selection
🔹 2. Filtering Data
Using WHERE clause
Conditions such as:
age > 30
department_id = 1
Pattern matching using:
LIKE 'J%'
LIKE '%a%'
LIKE '_o%'
🔹 3. Working with Dates
Extracting year and month using:
YEAR(hire_date)
MONTH(hire_date)
Filtering records:
before/after dates
between date ranges
specific years
🔹 4. Aggregate Functions
SUM() → Total salary
AVG() → Average salary
MIN() / MAX() → Lowest and highest salary
COUNT() → Total employees
🔹 5. GROUP BY & HAVING
Grouping data by:
department
year
Filtering grouped data using HAVING
🔹 6. Sorting Data
Using ORDER BY
Ascending (ASC)
Descending (DESC)
Sorting using multiple columns
🔹 7. Joins
INNER JOIN
LEFT JOIN
Combining:
Employee + Department
Employee + Project
🔹 8. Real-world Queries
Employees per department
Salary analysis
Hiring trends
Department insights
💡 Key Learnings
Importance of correct date formats (YYYY-MM-DD)
Difference between WHERE and HAVING
Understanding GROUP BY
Using joins to combine tables
Writing clean SQL queries
🛠️ Tools Used
DB Fiddle
Databricks/MySQL
🎯 Conclusion

Day 1 helped me build a strong foundation in SQL basics including querying, filtering, grouping, sorting, and joins. These concepts are essential for real-world database operations and problem-solving.
