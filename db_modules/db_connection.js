// Hints
/*jshint esversion: 6 */

// Import things
const debugdbmodule = require('debug')('app:db');
const credentials = require('./credentials');
const mysql = require('mysql');

// now make a connection
var con = mysql.createConnection({
  host: credentials.dbhost,
  user: credentials.dbuser,
  password: credentials.dbpw
});

con.connect(function(err) {
    if (err) throw err;
    con.query("SELECT T.`id`, T.`playerA`, T.`playerB`, T.`scorePlayerA`, T.`scorePlayerB` FROM r21_billard.`billard_games` T;", function (err, result, fields) {
      if (err) throw err;
      console.log(result);
    });
  });

global.setTimeout(() => {
  con.end();
}, 5000);