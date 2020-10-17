const express = require('express')
const app = express()
const port = 3000

app.get('/sample_js/select_test', (req, res) =>
    res.send('Select Test!'))

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
const sql =
      "SELECT " + 
      "  b_bp_seq_p_pb.id, " + 
      "  b_bp_seq_p_pb.name, " + 
      "  b_bp_seq_p_pb.person1, " + 
      "  b_bp_seq_p_pb.person2, " + 
      "  b_bp_seq_p_pb.person3, " + 
      "  b_bp_seq_p_pb.isbn, " + 
      "  b_bp_seq_p_pb.publisher_name, " + 
      "  bc.name AS book_collection_name " + 
      "FROM " + 
      "( " + 
      "  SELECT " + 
      "    b_bp_seq_p.id, " + 
      "    b_bp_seq_p.name, " + 
      "    b_bp_seq_p.person1, " + 
      "    b_bp_seq_p.person2, " + 
      "    b_bp_seq_p.person3, " + 
      "    b_bp_seq_p.isbn, " + 
      "    pb.name AS publisher_name, " + 
      "    b_bp_seq_p.book_collection_id " + 
      "  FROM " + 
      "  ( " + 
      "    SELECT " + 
      "      b.id, " + 
      "      b.name, " + 
      "      bp_seq_p.person1, " + 
      "      bp_seq_p.person2, " + 
      "      bp_seq_p.person3, " + 
      "      b.isbn, " + 
      "      b.publisher_id, " + 
      "      b.book_collection_id " + 
      "    FROM " + 
      "    ( " + 
      "      SELECT " + 
      "        bp_seq.book_id, " + 
      "        max(CASE bp_seq.seq WHEN 1 THEN bp_seq.person_name_kind_name ELSE NULL END) AS person1, " + 
      "        max(CASE bp_seq.seq WHEN 2 THEN bp_seq.person_name_kind_name ELSE NULL END) AS person2, " + 
      "        max(CASE bp_seq.seq WHEN 3 THEN bp_seq.person_name_kind_name ELSE NULL END) AS person3 " + 
      "      FROM " + 
      "      ( " + 
      "        SELECT  " + 
      "          bpppk.book_id, " + 
      "          CONCAT (bpppk.person_name, ' ', bpppk.person_kind_name) AS person_name_kind_name,  " + 
      "          row_number() OVER (PARTITION BY bpppk.book_id order by bpppk.person_id) AS seq " + 
      "        FROM " + 
      "        ( " + 
      "          SELECT " + 
      "              bpp.book_id, " + 
      "              bpp.person_id, " + 
      "              bpp.name AS person_name, " + 
      "              bpp.person_kind_id, " + 
      "              pk.name AS person_kind_name " + 
      "          FROM " + 
      "          ( " + 
      "            SELECT " + 
      "              bp.book_id, " + 
      "              bp.person_id, " + 
      "              p.name, " + 
      "              bp.person_kind_id " + 
      "            FROM " + 
      "              book_person bp " + 
      "            JOIN " + 
      "              person p " + 
      "            ON " + 
      "              bp.person_id=p.id " + 
      "          ) bpp " + 
      "          JOIN " + 
      "            person_kind pk " + 
      "          ON " + 
      "            bpp.person_kind_id = pk.id " + 
      "        ) bpppk " + 
      "        ORDER BY " + 
      "          bpppk.book_id, " + 
      "          bpppk.person_id " + 
      "      ) bp_seq " + 
      "      GROUP BY " + 
      "        bp_seq.book_id " + 
      "    ) bp_seq_p " + 
      "    JOIN " + 
      "      book b " + 
      "    ON " + 
      "      b.id = bp_seq_p.book_id " + 
      "  ) b_bp_seq_p " + 
      "  JOIN " + 
      "    publisher pb " + 
      "  ON " + 
      "    b_bp_seq_p.publisher_id = pb.id " + 
      ") b_bp_seq_p_pb " + 
      "JOIN " + 
      "  book_collection bc " + 
      "ON " + 
      " b_bp_seq_p_pb.book_collection_id = bc.id;";

asyncFunction();

async function asyncFunction() {
    let conn;
    try {
	console.log("Start pool.getConnection")
	conn = await pool.getConnection();
	console.log("Finish pool.getConnection")
	const rows = await conn.query(sql);
	console.log(rows);
    } catch (err) {
	throw err;
    } finally {
	if (conn) conn.release(); //release to pool
    }
}
