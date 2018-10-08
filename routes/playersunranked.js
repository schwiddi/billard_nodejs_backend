// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const log = require('../common/logger');
const _ = require('underscore');

// setting up express
const router = express.Router();

// get all players
router.get('/', async (req, res) => {
  const sp = `CALL GetAllUnrankedPlayers()`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      return log.info(error.message);
    } else if (_.isEmpty(results[0])) {
      log.info(`no unrankedplayers in database...`);
      return res
        .status(200)
        .send('Currently no unranked Players in Database...');
    } else {
      log.info('unranked players listed');
      return res.send(results[0]);
    }
  });
});

// Export the Router
module.exports = router;
