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
