-- Get the total number of assignment submissions for each cohort.

-- SELECT cohorts.name AS cohort, COUNT(DISTINCT assignment_submissions.*) AS total_submissions
-- FROM cohorts
-- JOIN students ON cohort_id = cohorts.id
-- JOIN assignment_submissions ON cohort_id = student_id
-- GROUP BY cohorts.name
-- ORDER BY total_submissions DESC;

-- keep in mind that when we are joining. We want to think logically.
-- Above, we are saying only count the submissions that are tied to a cohort?
-- And below we are saying: count all the assignment_submissions from all students
-- no matter if this was during a cohort or after?

SELECT cohorts.name as cohort, count(DISTINCT assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;

