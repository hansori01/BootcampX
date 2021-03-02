-- Get currently enrolled students' average assignment completion time.

SELECT students.name AS student, AVG(assignment_submissions.duration) AS avg
FROM students
JOIN assignment_submissions ON students.id = student_id
WHERE end_date IS NULL
GROUP BY students.name
ORDER BY avg DESC;