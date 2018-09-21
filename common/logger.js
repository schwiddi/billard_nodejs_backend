// Hints
/*jshint esversion: 6 */

const SimpleNodeLogger = require('simple-node-logger'),
  opts = {
    logFilePath: './log/backend.log',
    timestampFormat: 'YYYY-MM-DD HH:mm:ss.SSS'
  },
  log = SimpleNodeLogger.createSimpleFileLogger(opts);

module.exports = log;
