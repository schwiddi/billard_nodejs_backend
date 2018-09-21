// Hints
/*jshint esversion: 6 */

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

module.exports = mydebug;
