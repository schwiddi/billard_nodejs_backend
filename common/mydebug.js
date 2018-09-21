// Hints
/*jshint esversion: 6 */

// Import things
var currentdate = new Date();
var datetime =
  currentdate.getDate() +
  '.' +
  (currentdate.getMonth() + 1) +
  '.' +
  currentdate.getFullYear() +
  ' ' +
  currentdate.getHours() +
  ':' +
  currentdate.getMinutes() +
  ':' +
  currentdate.getSeconds();

const mydebug = require('debug')(`mydebug@${datetime}`);

// now Export this Model
module.exports = mydebug;
