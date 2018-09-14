// Hints
/*jshint esversion: 6 */

// Import things
const mysql = require('mysql');
const dbconfig = require('./db_conf');
const mydebug = require('../common/mydebug');

// ENV things
const db = mysql.createConnection(dbconfig);

setInterval(function() {
  db.query('SELECT 1');
}, 600000);

// now Export this Model
module.exports = db;
