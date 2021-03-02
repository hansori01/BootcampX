-- Get the students who's average time it takes to complete an assignment is 
-- less than the average estimated time it takes to complete an assignment.

-- my wrong attempt - prints: 42 rows
SELECT 
  students.name, 
  AVG(assignment_submissions.duration) AS avg_assignment_duration, 
  AVG(assignments.duration) AS avg_estimated
FROM 
  assignment_submissions
JOIN 
  assignments ON assignments.id = assignment_id
JOIN 
  students ON students.id = student_id
WHERE 
  students. end_date IS NULL
GROUP BY 
  students.name
HAVING
  avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY 
  avg_assignment_duration;