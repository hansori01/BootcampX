const { request } = require("express");

const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

//pool.query is a function that accepts an SQL query as a string.
//the rows property will have an array with the expected results


//unmalicious text from us
const queryString = `
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

//potentially malicious input from user. Stored into values array
const cohortName = process.argv[2];
const limit = process.argv[3] || [5];
const values = [`%${cohortName}%`, limit];


pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
})
.catch (err => console.error('query error', err.stack));