-- Perform the same query as before, but include the number of assistances as well.

SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests.*) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;


-- by grouping by Teachers AND cohorts we are able to only see the 
-- assistances to that specific cohort.