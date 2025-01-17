SELECT students.name as student_name, cohorts.name as cohort_name, cohorts.start_date as cohort_start, students.start_date
FROM cohorts
JOIN students ON cohorts.id = cohort_id
WHERE cohorts.start_date != students.start_date
ORDER BY cohort_start;