# Week 1 - Day 3 SQL JOIN Queries

## Overview

This project demonstrates the use of different SQL JOIN operations using a Student Management Database.

The queries cover:

* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN
* CROSS JOIN
* Handling NULL values
* Finding unmatched records
* Generating reports using multiple joins

---

# Database Tables Used

* `students`
* `courses`
* `enrollments`
* `instructors`

---

# Queries

## 1. Display all students and the courses they are enrolled in

Includes students who are not enrolled in any course.

```sql
select s.student_id,s.student_name,c.course_name
from students s
left join enrollments e
on s.student_id=e.student_id
left join courses c
on e.course_id=c.course_id
order by s.student_id;
```

---

## 2. Find all courses that currently have no students enrolled

```sql
select c.course_id,c.course_name
from courses c
left join enrollments e
on c.course_id=e.course_id
where e.enrollment_id is null
order by c.course_id;
```

---

## 3. Display all instructors and the courses they teach

Includes instructors who are not assigned to any course.

```sql
select i.instructor_id,i.instructor_name,s.course_name
from instructors i
left join courses s
on i.instructor_id=s.instructor_id
order by i.instructor_id;
```

---

## 4. Find all courses that do not have an instructor assigned

```sql
select c.course_id,c.course_name
from courses c
left join instructors i
on c.instructor_id=i.instructor_id
where c.instructor_id is null;
```

---

## 5. Display all students and enrollment information using RIGHT JOIN

```sql
SELECT 
    e.enrollment_id,
    s.student_id,
    s.student_name,
    e.course_id,
    e.enrollment_date
FROM enrollments e
RIGHT JOIN students s
ON e.student_id = s.student_id
ORDER BY s.student_id;
```

---

## 6. Find students who are not enrolled in any course

```sql
select s.student_id,s.student_name
from students s
left join enrollments e
on s.student_id=e.student_id
where e.student_id is null;
```

---

## 7. Use a FULL OUTER JOIN to display all students and enrollments

```sql
select s.student_id,s.student_name,e.enrollment_id,e.course_id
from students s
full outer join enrollments e
on s.student_id=e.student_id;
```

---

## 8. Find all courses that have never appeared in the enrollments table

```sql
select s.course_id,s.course_name
from courses s
left join enrollments e
on s.course_id=e.course_id
where e.course_id is null;
```

---

## 9. Display all instructors and courses using FULL OUTER JOIN

```sql
select i.instructor_id,i.instructor_name,c.course_id,c.course_name
from instructors i
full outer join courses c
on i.instructor_id=c.instructor_id
order by i.instructor_id;
```

---

## 10. Create a report showing student name, course name, and instructor name

Includes rows even if course or instructor information is missing.

```sql
select s.student_name,
       c.course_name,
       i.instructor_name
from students s
left join enrollments e
on s.student_id = e.student_id
left join courses c
on e.course_id = c.course_id
left join instructors i
on c.instructor_id = i.instructor_id
order by s.student_id;
```

---

# Bonus Challenge

## Display every student and every course

Shows all possible combinations even if no enrollment exists.

```sql
select student_name,course_name
from students
cross join courses
order by student_name,course_name;
```

---

# Concepts Practiced

* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN
* CROSS JOIN
* Multi-table joins
* NULL filtering
* Reporting queries
* Relationship handling in SQL

---

# Outcome

By completing these queries, you gain practical understanding of how different JOIN operations work in SQL and how they are used to retrieve related and unmatched data from multiple tables.
