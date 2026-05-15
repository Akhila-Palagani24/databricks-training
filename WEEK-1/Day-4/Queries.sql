--1. Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.
select employee_name,salary,
ROW_NUMBER() over (order by salary desc)
from employees;

--2. Use RANK() to rank employees by salary.
select employee_name,salary,
rank() over (order by salary desc) as rnk
from employees;

--3. Use DENSE_RANK() to rank employees by salary.
select employee_name,salary,
dense_rank() over (order by salary desc) as dns_rnk
from employees;

--4. Find the top 3 highest-paid employees using a window function
SELECT employee_name, salary
FROM (
    SELECT 
        employee_name,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS dns_rnk
    FROM employees
) x
WHERE dns_rnk <= 3;

--5. Rank employees within each department using PARTITION BY
    SELECT 
        employee_name,department,
        salary,
        DENSE_RANK() OVER (partition by department order by salary DESC) AS dep_rnk
    FROM employees;

--6. Display the highest salary in each department using a window function.
 SELECT 
        department,
        salary,
        max(salary)
        OVER (partition by department) AS high_sal
    FROM employees;

--7. Calculate the running total of order amounts ordered by order_date.
 select order_id,order_date,total_amount,
 sum(total_amount) over(order by order_date)as running_total from 
 orders;

--8. Calculate the cumulative sales amount for each employee.
select employee_id,order_date,total_amount,
sum(total_amount) over (partition by employee_id order by order_date) as cumulative_sales
from orders;

--9. Use LAG() to show the previous order amount for each customer
select customer_id,order_date,total_amount,
lag(total_amount) over (
  PARTITION BY customer_id order by order_date)
from orders;

--10. Use LEAD() to show the next order amount for each customer.
select customer_id,order_date,total_amount,
lead(total_amount) over (
  PARTITION BY customer_id order by order_date)
from orders;

--11. Find the difference between the current order amount and previous order amount.
SELECT
    order_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        ORDER BY order_date
    ) AS previous_order_amount,

    total_amount -
    LAG(total_amount) OVER (
        ORDER BY order_date
    ) AS difference
FROM orders;

--12. Calculate a moving average of the last 3 orders.

SELECT order_id, order_date, total_amount,
AVG(total_amount) OVER(
ORDER BY order_date
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_avg
FROM orders;



-- 13. Salary quartiles using NTILE

SELECT employee_name, salary,
NTILE(4) OVER(ORDER BY salary DESC) AS quartile
FROM employees;


-- 14. First order by each customer

SELECT *
FROM (
    SELECT customer_id, order_id, order_date,
    ROW_NUMBER() OVER(
    PARTITION BY customer_id
    ORDER BY order_date
    ) AS rn
    FROM orders
) t
WHERE rn = 1;

--------------------------------------------------

-- 15. Latest order by each customer

SELECT *
FROM (
    SELECT customer_id, order_id, order_date,
    ROW_NUMBER() OVER(
    PARTITION BY customer_id
    ORDER BY order_date DESC
    ) AS rn
    FROM orders
) t
WHERE rn = 1;


-- 16. Salary with department average

SELECT employee_name, department, salary,
AVG(salary) OVER(PARTITION BY department) AS dept_avg
FROM employees;


-- 17. Employees earning above department average

SELECT *
FROM (
    SELECT employee_name, department, salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;


-- 18. Department payroll

SELECT employee_name, department, salary,
SUM(salary) OVER(PARTITION BY department) AS payroll
FROM employees;


-- 19. Salary percentage contribution

SELECT employee_name, department, salary,
ROUND(
salary * 100.0 /
SUM(salary) OVER(PARTITION BY department), 2
) AS contribution_percent
FROM employees;


-- 20. Total employees count

SELECT employee_name,
COUNT(*) OVER() AS total_employees
FROM employees;



-- 21. CTE total sales per employee

WITH sales_cte AS (
    SELECT employee_id,
    SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT * FROM sales_cte;



-- 22. Employees with sales above company average

WITH sales_cte AS (
    SELECT employee_id,
    SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT *
FROM sales_cte
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM sales_cte
);



-- 23. Customer spending rankings

WITH customer_spending AS (
    SELECT customer_id,
    SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id,
total_spending,
RANK() OVER(ORDER BY total_spending DESC) AS spending_rank
FROM customer_spending;



-- 24. Recursive CTE numbers 1 to 10

WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM nums
    WHERE n < 10
)
SELECT * FROM nums;



-- 25. Recursive employee hierarchy

WITH RECURSIVE emp_hierarchy AS (
    SELECT employee_id, employee_name
    FROM employees
)
SELECT * FROM emp_hierarchy;



-- 26. Orders above average amount

WITH avg_orders AS (
    SELECT *
    FROM orders
    WHERE total_amount >
    (SELECT AVG(total_amount) FROM orders)
)
SELECT * FROM avg_orders;



-- 27. Rank customers by spending

WITH customer_totals AS (
    SELECT customer_id,
    SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id,
total_spending,
RANK() OVER(ORDER BY total_spending DESC) AS rank_num
FROM customer_totals;



-- 28. Second highest salary in each department

SELECT *
FROM (
    SELECT employee_name, department, salary,
    DENSE_RANK() OVER(
    PARTITION BY department
    ORDER BY salary DESC
    ) AS rnk
    FROM employees
) t
WHERE rnk = 2;



-- 29. Difference from department max salary

SELECT employee_name, department, salary,
MAX(salary) OVER(PARTITION BY department) - salary AS salary_gap
FROM employees;



-- 30. Top-performing employee by department

WITH employee_sales AS (
    SELECT
        e.employee_id,
        e.employee_name,
        e.department,
        SUM(o.total_amount) AS total_sales
    FROM employees e
    LEFT JOIN orders o
    ON e.employee_id = o.employee_id
    GROUP BY e.employee_id,
             e.employee_name,
             e.department
)
SELECT *
FROM (
    SELECT *,
    RANK() OVER(
    PARTITION BY department
    ORDER BY total_sales DESC
    ) AS rnk
    FROM employee_sales
) t
WHERE rnk = 1;

