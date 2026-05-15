--1. Display all students and the courses they are enrolled in. Include students who are not enrolled in any course.
select s.student_id,s.student_name,c.course_name
from students s left join enrollments e
on s.student_id=e.student_id left join
courses c on e.course_id=c.course_id
order by s.student_id;

--2. Find all courses that currently have no students enrolled.
select c.course_id,c.course_name
from courses c left join enrollments e
on c.course_id=e.course_id
where e.enrollment_id is null
order by c.course_id;

--3. Display all instructors and the courses they teach, including instructors who are not assigned to any course.
select i.instructor_id,i.instructor_name,s.course_name
from instructors i left join courses s
on i.instructor_id=s.instructor_id
order by i.instructor_id;

--4. Find all courses that do not have an instructor assigned.
select c.course_id,c.course_name
from courses c left join instructors i
on c.instructor_id=i.instructor_id
where c.instructor_id is null;

--5. Display all students and enrollment information using a RIGHT JOIN
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

--6. Find students who are not enrolled in any course.
select s.student_id,s.student_name
from students s left join enrollments e
on s.student_id=e.student_id
where e.student_id is null;

--7. Use a FULL OUTER JOIN to display all students and enrollments, including unmatched rows from both tables.
select s.student_id,s.student_name,e.enrollment_id,e.course_id
from students s full outer join enrollments e
on s.student_id=e.student_id;

--8. Find all courses that have never appeared in the enrollments table.
select s.course_id,s.course_name
from courses s left join enrollments e
on s.course_id=e.course_id
where e.course_id is null;

--9. Display all instructors and courses using a FULL OUTER JOIN and identify unmatched rows.
select i.instructor_id,i.instructor_name,c.course_id,c.course_name
from instructors i full outer join courses c
on i.instructor_id=c.instructor_id order by i.instructor_id;

--10. Create a report showing: student name, course name, and instructor name. Include rows even if course or
instructor information is missing.
select  s.student_name, c.course_name, i.instructor_name
from students s
left join enrollments e
    on s.student_id = e.student_id
left join courses c
    on e.course_id = c.course_id
left join instructors i
    on c.instructor_id = i.instructor_id
order by s.student_id;

--Bonus Challenge:
--Write a query that lists every student and every course, even if there is no enrollment relationship between them.
select student_name,course_name
from students cross join courses
order by student_name,course_name;
















