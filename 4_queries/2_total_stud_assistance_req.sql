-- Get the total number of assistance_requests for a student.

SELECT name, COUNT(assistance_requests.*) as total_assistances
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY name;