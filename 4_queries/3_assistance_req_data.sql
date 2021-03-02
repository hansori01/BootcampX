-- Each assistance request is related to a bunch of data like a teacher, student, assignment,
--  and more. We want to be able to see all important data about an assistance request.

SELECT teachers.name, students.name, assignments.name, (assistance_requests.completed_at - assistance_requests.started_at) AS duration
FROM assistance_requests
JOIN assignments ON assistance_requests.assignment_id = assignments.id
JOIN students ON assistance_requests.student_id = students.id
JOIN teachers ON assistance_requests.teacher_id = teachers.id
ORDER BY duration;