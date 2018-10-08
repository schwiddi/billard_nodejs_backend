// Hints
/*jshint esversion: 6 */

// Import things
const mysql = require('mysql');
const dbconfig = require('./db_conf');
const log = require('../common/logger');

// ENV things
const db = mysql.createConnection(dbconfig);

setInterval(function() {
  db.query('SELECT 1');
  log.info('made db call to hold connection alive...');
}, 600000);

// now Export this Model
module.exports = db;
