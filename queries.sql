-- Practice queries for the student database

-- 1. All students
SELECT * FROM students;

-- 2. Students who enrolled in 2025
SELECT first_name, last_name, enrolled_year
FROM students
WHERE enrolled_year = 2025;

-- 3. Number of students per course
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY total_students DESC;

-- 4. Average grade per course (ignores NULL grades)
SELECT c.course_name, ROUND(AVG(e.grade), 1) AS avg_grade
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY avg_grade DESC;

-- 5. Top 3 students by average grade
SELECT s.first_name, s.last_name, ROUND(AVG(e.grade), 1) AS avg_grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY avg_grade DESC
LIMIT 3;

-- 6. Students with no enrollments
SELECT s.first_name, s.last_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 7. Courses whose average grade is above 70
SELECT c.course_name, ROUND(AVG(e.grade), 1) AS avg_grade
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING AVG(e.grade) > 70;

-- 8. Letter grade for each result
SELECT s.first_name, c.course_name, e.grade,
       CASE
         WHEN e.grade >= 80 THEN 'A'
         WHEN e.grade >= 70 THEN 'B'
         WHEN e.grade >= 60 THEN 'C'
         WHEN e.grade IS NULL THEN 'Not graded'
         ELSE 'D'
       END AS letter_grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c  ON e.course_id  = c.course_id;

-- 9. Highest grade in each course (subquery)
SELECT c.course_name, s.first_name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c  ON e.course_id  = c.course_id
WHERE e.grade = (SELECT MAX(grade) FROM enrollments WHERE course_id = e.course_id);

-- ---------- Data quality checks (the kind of queries a QA tester uses) ----------

-- 10. Enrollments that are not graded yet
SELECT enrollment_id, student_id, course_id
FROM enrollments
WHERE grade IS NULL;

-- 11. Grades outside the valid range 0-100 (should return no rows)
SELECT * FROM enrollments
WHERE grade < 0 OR grade > 100;

-- 12. Enrollments pointing to a student that does not exist (should return no rows)
SELECT e.*
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.student_id
WHERE s.student_id IS NULL;

-- 13. Duplicate emails (should return no rows)
SELECT email, COUNT(*) AS times_used
FROM students
GROUP BY email
HAVING COUNT(*) > 1;
