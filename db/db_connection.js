// Hints
/*jshint esversion: 6 */

// Import things
const mysql = require('mysql');
const dbconfig = require('./db_conf');

// ENV things
const db = mysql.createConnection(dbconfig);

// now Export this Model
module.exports = db;
