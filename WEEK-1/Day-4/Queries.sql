-- =====================================================
-- 1. ROW_NUMBER() Equivalent
-- =====================================================

SET @row_num = 0;

SELECT employee_name,
       salary,
       (@row_num := @row_num + 1) AS row_num
FROM employees
ORDER BY salary DESC;


-- =====================================================
-- 2. RANK() Equivalent
-- =====================================================

SELECT e1.employee_name,
       e1.salary,
       (SELECT COUNT(DISTINCT e2.salary)
        FROM employees e2
        WHERE e2.salary > e1.salary) + 1 AS rank_num
FROM employees e1
ORDER BY salary DESC;


-- =====================================================
-- 3. DENSE_RANK() Equivalent
-- =====================================================

SELECT e1.employee_name,
       e1.salary,
       (SELECT COUNT(DISTINCT e2.salary)
        FROM employees e2
        WHERE e2.salary > e1.salary) + 1 AS dense_rank_num
FROM employees e1
ORDER BY salary DESC;


-- =====================================================
-- 4. Top 3 Highest Paid Employees
-- =====================================================

SELECT employee_name,
       salary
FROM employees
ORDER BY salary DESC
LIMIT 3;


-- =====================================================
-- 5. Rank Employees Within Each Department
-- =====================================================

SELECT e1.employee_name,
       e1.department,
       e1.salary,
       (SELECT COUNT(DISTINCT e2.salary)
        FROM employees e2
        WHERE e2.department = e1.department
        AND e2.salary > e1.salary) + 1 AS dept_rank
FROM employees e1
ORDER BY department, salary DESC;


-- =====================================================
-- 6. Highest Salary in Each Department
-- =====================================================

SELECT e1.employee_name,
       e1.department,
       e1.salary,
       (SELECT MAX(e2.salary)
        FROM employees e2
        WHERE e2.department = e1.department) AS highest_salary
FROM employees e1;


-- =====================================================
-- 7. Running Total of Order Amounts
-- =====================================================

SET @running_total = 0;

SELECT order_id,
       order_date,
       total_amount,
       (@running_total := @running_total + total_amount) AS running_total
FROM orders
ORDER BY order_date;


-- =====================================================
-- 8. Cumulative Sales Amount for Each Employee
-- =====================================================

SELECT o1.employee_id,
       o1.order_id,
       o1.total_amount,
       (SELECT SUM(o2.total_amount)
        FROM orders o2
        WHERE o2.employee_id = o1.employee_id
        AND o2.order_date <= o1.order_date) AS cumulative_sales
FROM orders o1
ORDER BY employee_id, order_date;


-- =====================================================
-- 9. Previous Order Amount
-- =====================================================

SELECT o1.customer_id,
       o1.order_id,
       o1.total_amount,
       (
         SELECT o2.total_amount
         FROM orders o2
         WHERE o2.customer_id = o1.customer_id
         AND o2.order_date < o1.order_date
         ORDER BY o2.order_date DESC
         LIMIT 1
       ) AS previous_order
FROM orders o1;


-- =====================================================
-- 10. Next Order Amount
-- =====================================================

SELECT o1.customer_id,
       o1.order_id,
       o1.total_amount,
       (
         SELECT o2.total_amount
         FROM orders o2
         WHERE o2.customer_id = o1.customer_id
         AND o2.order_date > o1.order_date
         ORDER BY o2.order_date ASC
         LIMIT 1
       ) AS next_order
FROM orders o1;


-- =====================================================
-- 11. Difference Between Current and Previous Order
-- =====================================================

SELECT o1.customer_id,
       o1.order_id,
       o1.total_amount,
       o1.total_amount - IFNULL(
         (
           SELECT o2.total_amount
           FROM orders o2
           WHERE o2.customer_id = o1.customer_id
           AND o2.order_date < o1.order_date
           ORDER BY o2.order_date DESC
           LIMIT 1
         ),0
       ) AS difference_amount
FROM orders o1;


-- =====================================================
-- 12. Moving Average of Last 3 Orders
-- =====================================================

SELECT 
    o1.order_id,
    o1.total_amount,
    (
        SELECT AVG(o2.total_amount)
        FROM orders o2
        WHERE o2.order_id BETWEEN
              GREATEST(1, o1.order_id - 2)
              AND o1.order_id
    ) AS moving_average
FROM orders o1
ORDER BY o1.order_id;

-- =====================================================
-- 13. Divide Employees into Salary Quartiles
-- =====================================================

SET @row_num = 0;
SET @total = (SELECT COUNT(*) FROM employees);

SELECT employee_name,
       salary,
       CEIL((@row_num := @row_num + 1) * 4 / @total) AS quartile
FROM employees
ORDER BY salary DESC;


-- =====================================================
-- 14. First Order by Each Customer
-- =====================================================

SELECT *
FROM orders o1
WHERE order_date = (
    SELECT MIN(order_date)
    FROM orders o2
    WHERE o2.customer_id = o1.customer_id
);


-- =====================================================
-- 15. Latest Order by Each Customer
-- =====================================================

SELECT *
FROM orders o1
WHERE order_date = (
    SELECT MAX(order_date)
    FROM orders o2
    WHERE o2.customer_id = o1.customer_id
);


-- =====================================================
-- 16. Employee Salaries with Department Average
-- =====================================================

SELECT e1.employee_name,
       e1.department,
       e1.salary,
       (
         SELECT AVG(e2.salary)
         FROM employees e2
         WHERE e2.department = e1.department
       ) AS dept_avg_salary
FROM employees e1;


-- =====================================================
-- 17. Employees Earning Above Department Average
-- =====================================================

SELECT e1.employee_name,
       e1.department,
       e1.salary
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e1.department
);


-- =====================================================
-- 18. Department Payroll
-- =====================================================

SELECT e1.employee_name,
       e1.department,
       e1.salary,
       (
         SELECT SUM(e2.salary)
         FROM employees e2
         WHERE e2.department = e1.department
       ) AS department_payroll
FROM employees e1;


-- =====================================================
-- 19. Salary Percentage Contribution
-- =====================================================

SELECT e1.employee_name,
       e1.department,
       e1.salary,
       ROUND(
         e1.salary * 100 /
         (
           SELECT SUM(e2.salary)
           FROM employees e2
           WHERE e2.department = e1.department
         ),2
       ) AS percentage_contribution
FROM employees e1;


-- =====================================================
-- 20. Total Number of Employees
-- =====================================================

SELECT employee_name,
       department,
       (SELECT COUNT(*) FROM employees) AS total_employees
FROM employees;


-- =====================================================
-- 21. Total Sales Per Employee
-- =====================================================

SELECT employee_id,
       SUM(total_amount) AS total_sales
FROM orders
GROUP BY employee_id;


-- =====================================================
-- 22. Employees with Sales Above Company Average
-- =====================================================

SELECT employee_id,
       SUM(total_amount) AS total_sales
FROM orders
GROUP BY employee_id
HAVING total_sales > (
    SELECT AVG(total_sales)
    FROM (
        SELECT SUM(total_amount) AS total_sales
        FROM orders
        GROUP BY employee_id
    ) t
);


-- =====================================================
-- 23. Customer Spending and Ranking
-- =====================================================

SELECT c1.customer_id,
       c1.total_spending,
       (
         SELECT COUNT(DISTINCT c2.total_spending)
         FROM (
            SELECT customer_id,
                   SUM(total_amount) AS total_spending
            FROM orders
            GROUP BY customer_id
         ) c2
         WHERE c2.total_spending > c1.total_spending
       ) + 1 AS spending_rank
FROM (
    SELECT customer_id,
           SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
) c1;


-- =====================================================
-- 24. Generate Numbers 1 to 10
-- =====================================================

SELECT 1 AS num 
UNION SELECT 2
UNION SELECT 3 
UNION SELECT 4 
UNION SELECT 5 
UNION SELECT 6
UNION SELECT 7 
UNION SELECT 8 
UNION SELECT 9 
UNION SELECT 10;


-- =====================================================
-- 25. Recursive Employee Hierarchy
-- =====================================================

SELECT employee_id, 
employee_name, 
manager_id 
FROM employees;


-- =====================================================
-- 26. Orders Above Average Amount
-- =====================================================

SELECT *
FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
);


-- =====================================================
-- 27. Rank Customers by Total Spending
-- =====================================================

SELECT c1.customer_id,
       c1.total_spending,
       (
         SELECT COUNT(DISTINCT c2.total_spending)
         FROM (
            SELECT customer_id,
                   SUM(total_amount) AS total_spending
            FROM orders
            GROUP BY customer_id
         ) c2
         WHERE c2.total_spending > c1.total_spending
       ) + 1 AS spending_rank
FROM (
    SELECT customer_id,
           SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
) c1;


-- =====================================================
-- 28. Second Highest Salary in Each Department
-- =====================================================

SELECT e1.employee_name,
       e1.department,
       e1.salary
FROM employees e1
WHERE 1 = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employees e2
    WHERE e2.department = e1.department
    AND e2.salary > e1.salary
);


-- =====================================================
-- 29. Difference Between Salary and Department Maximum
-- =====================================================

SELECT e1.employee_name,
       e1.department,
       e1.salary,
       (
         SELECT MAX(e2.salary)
         FROM employees e2
         WHERE e2.department = e1.department
       ) - e1.salary AS salary_difference
FROM employees e1;


-- =====================================================
-- 30. Top Performing Employee in Each Department
-- =====================================================

SELECT *
FROM (
    SELECT e.department,
           e.employee_name,
           SUM(o.total_amount) AS total_sales
    FROM employees e
    LEFT JOIN orders o
    ON e.employee_id = o.employee_id
    GROUP BY e.department, e.employee_name
) t1
WHERE total_sales = (
    SELECT MAX(total_sales)
    FROM (
        SELECT e.department,
               e.employee_name,
               SUM(o.total_amount) AS total_sales
        FROM employees e
        LEFT JOIN orders o
        ON e.employee_id = o.employee_id
        GROUP BY e.department, e.employee_name
    ) t2
    WHERE t1.department = t2.department
);


-- =====================================================
-- BONUS CHALLENGE
-- Monthly Sales Trends
-- =====================================================

SELECT 
    monthly.month,
    monthly.total_sales,

    (
        SELECT SUM(m2.total_sales)
        FROM
        (
            SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
                   SUM(total_amount) AS total_sales
            FROM orders
            GROUP BY DATE_FORMAT(order_date, '%Y-%m')
        ) m2
        WHERE m2.month <= monthly.month
    ) AS running_total,

    (
        SELECT m3.total_sales
        FROM
        (
            SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
                   SUM(total_amount) AS total_sales
            FROM orders
            GROUP BY DATE_FORMAT(order_date, '%Y-%m')
        ) m3
        WHERE m3.month = DATE_FORMAT(
            DATE_SUB(STR_TO_DATE(CONCAT(monthly.month, '-01'), '%Y-%m-%d'),
            INTERVAL 1 MONTH),
            '%Y-%m'
        )
    ) AS previous_month_sales

FROM
(
    SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
           SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
) monthly
ORDER BY monthly.month;
