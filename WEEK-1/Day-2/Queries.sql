--1 Display all employee details.
select * from Employees;

--2 Display only employee names and salaries.
select emp_name,salary
from Employees;

--3 Display employee names and departments.
select emp_name,department
from Employees;

--4 Display all employees from the IT department.
select emp_name,department
from Employees
where department='IT';

--5 Display employee names and experience.
select emp_name,experience
from Employees;

--6 Find employees with salary greater than 70000.
select emp_name,salary
from Employees
where salary > 70000;

--7 Find employees working in Hyderabad.
select emp_name,city
from Employees
where city='Hyderabad';

--8 Find employees with experience less than 4 years.
select emp_name,experience
from Employees
where experience<4;

--9 Find employees from Finance department.
select emp_name,department
from Employees
where department='Finance';

--10 Find employees whose salary is equal to 52000.
select emp_name,salary
from Employees
where salary=52000;

--11 Find total salary department-wise.
select department,sum(salary)
from Employees
group by department;

--12 Find average salary in each department.
select department,avg(salary) as avg_sal
from Employees
group by department;

--13 Count employees in each city.
select city,count(*) as no_of_emp
from Employees
group by city;

--14 Find maximum salary in each department.
select department,max(salary)
from Employees
group by department;

--15 Find minimum experience department-wise.
select department,min(experience) as min_exp
from Employees
group by department;

--16 Find departments having more than 3 employees.
select department,count(*) as emp_count
from Employees
Group by department
having count(*)>3;

--17 Find departments where average salary is greater than 60000
select department,avg(salary) as avg_salary
from Employees
Group by department
having avg(salary)>60000

--18 Find cities having more than 2 employees.
select city, count(*) as emp_count
from Employees
group by city
having count(*) >2;

--19 Find departments where total salary is greater than 200000.
select department,sum(salary) as total_sal
from Employees
group by department
having sum(salary)>20000;

--20 Find departments where maximum salary is above 90000.
select department,max(salary) as max_sal
from Employees
group by department
having max(salary)>90000;

--21 Display top 5 highest paid employees.
select emp_name,salary
from Employees
order by salary desc
limit 5

--22 Display top 3 employees with highest experience.
select emp_name,experience
from Employees
order by experience desc
limit 3

--23 Display top 2 salaries from Finance department.
select  emp_name,salary
from Employees
where department='Finance'
order by salary desc
limit 2;

--24 Display top 4 employees from Hyderabad.
select  emp_name,city
from Employees
where city='Hyderabad'
limit 4;

--25 Display top 1 highest salary employee.
select  emp_name,salary
from Employees
order by salary desc
limit 1;

--26 Display distinct department names.
select distinct department
from Employees;

--27 Display distinct city names.
select distinct city
from Employees;

--28 Display distinct salary values.
select distinct salary
from Employees;

--29 Display distinct combinations of department and city.
select distinct department,city
from Employees;

--30 Display distinct experience values.
Display distinct experience values.

--31 Find employees with salary >= 80000.
select emp_name,salary
from Employees
where salary >= 80000

--32 Find employees with experience <= 3.
select emp_name,experience
from Employees
where experience <=3;

--33 Find employees whose salary <> 45000.
select emp_name,salary
from Employees
where salary <>45000;

--34 Find employees with salary < 50000
select emp_name,salary
from Employees
where salary <50000;

--35 Find employees with experience > 5.
select emp_name,experience
from Employees
where experience > 5;

--36 Find employees from IT department AND salary greater than 70000.
select *
from Employees
where department='IT' and salary>70000;

--37 Find employees from Hyderabad OR Bangalore.
select *
from Employees
where city='Hyderabad' or city='Bangalore';

--38 Find employees from HR department AND experience less than 3.
select *
from Employees
where department='HR' and experience< 3;

--39 Find employees with salary greater than 60000 OR experience greater than 6
select *
from Employees
where salary > 60000 or experience > 6;

--40 Find employees NOT from Sales department.
select *
from Employees
where department <> 'Sales';

--41 Find employees working in ('Hyderabad', 'Mumbai').
SELECT *
FROM Employees
WHERE city IN ('Hyderabad', 'Mumbai');

--42 Find employees whose department IN ('IT', 'Finance').
SELECT *
FROM Employees
WHERE department IN ('IT', 'Finance');

--43 Find employees whose city NOT IN ('Chennai', 'Pune').
SELECT *
FROM Employees
WHERE city NOT IN ('Chennai', 'Pune');

--44 Find employees whose salary IN (45000, 75000, 91000).
SELECT *
FROM Employees
WHERE salary  IN (45000, 75000, 91000);

--45 Find employees whose department NOT IN ('HR', 'Sales').
SELECT *
FROM Employees
WHERE department not  IN ('HR', 'Sales');

--46 Find employees with salary BETWEEN 50000 AND 80000.
SELECT emp_name,salary
FROM Employees
WHERE salary between  50000 AND 80000;

--47 Find employees with experience BETWEEN 3 AND 6.
SELECT emp_name,experience
FROM Employees
WHERE experience between  3 AND 6;

--48 Find employees whose emp_id BETWEEN 105 AND 112.
SELECT *
FROM Employees
WHERE emp_id between 105 and 112;

--49 Find employees with salary NOT BETWEEN 40000 AND 60000.
SELECT emp_name,salary
FROM Employees
WHERE salary not between 40000 AND 60000;

--50 Find employees with experience BETWEEN 2 AND 4.
SELECT emp_name,experience
FROM Employees
WHERE experience not between 2 AND 4;

--51 Find employees whose names start with 'R'.
SELECT emp_name
FROM Employees
WHERE emp_name like 'R%';

--52 Find employees whose names end with 'a'.
SELECT emp_name
FROM Employees
WHERE emp_name like '%a';

--53 Find employees whose names contain 'v'.
SELECT emp_name
FROM Employees
WHERE emp_name like '%v%';

--54 Find employees whose city starts with 'B'.
SELECT emp_name,city
FROM Employees
WHERE city like 'B%';

--55 Find employees whose department ends with 's'.
SELECT emp_name,department
FROM Employees
WHERE department like '%s';
