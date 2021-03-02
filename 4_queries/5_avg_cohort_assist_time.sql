-- Get the average duration of assistance requests for each cohort.


SELECT cohorts.name, AVG(completed_at - started_at) AS avg_assist_time
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assistance_requests ON students.id = assistance_requests.student_id
GROUP BY cohorts.name;
