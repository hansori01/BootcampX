-- Calculate the average total duration of assistance requests for each cohort.



SELECT AVG(total_duration) as avg_total_dur
FROM (SELECT SUM(completed_at - started_at) AS total_duration
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY total_duration
) as total_durations;

-- We created a new table (exercise 8) and named it as total_durations and referenced it.