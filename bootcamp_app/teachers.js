const { request } = require("express");

const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


const queryString = `SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
ORDER BY teachers.name;`

const cohortName = process.argv[2] || 'JUL02'
const values = [`%${cohortName}%`]

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.teacher}: ${row.cohort}`);
  })
})
.catch (err => console.error('query error', err.stack));