const express = require('express')
const app = express()
const port = 3000

app.get('/sample_js/connection_test', (req, res) =>
    res.send('Connection Test!'))

app.listen(port, () =>
    console.log(`Example app listening on port ${port}!`))

const mariadb = require('mariadb')

const pool = mariadb.createPool({
  host: 'localhost',
  user: 'book_mgr',
  password: 'pass4book_mgr',
  database: 'book_db',
  connectionLimit: 5
});

console.log("Create Pool");
asyncFunction();

async function asyncFunction() {
    let conn;
    try {
	console.log("Start pool.getConnection")
	conn = await pool.getConnection();
	console.log("Finish pool.getConnection")
	const rows = await conn.query("SELECT 1 as val");
	console.log(rows);
    } catch (err) {
	throw err;
    } finally {
	if (conn) conn.release(); //release to pool
    }
}
