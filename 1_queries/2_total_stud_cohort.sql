SELECT COUNT(id) as "cohort count"
FROM students
WHERE cohort_id IN (1,2,3);