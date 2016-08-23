var mysql = require('mysql');

var pool = mysql.createPool({
  connectionLimit: 10,
  host: 'localhost',
  user: 'root',
  password: 'g0dammit',
  database: 'spake'
});

module.exports.pool = pool;