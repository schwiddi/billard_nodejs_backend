// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const mydebug = require('../common/mydebug');
const _ = require('underscore');

// setting up express
const router = express.Router();

// get all players
router.get('/', async (req, res) => {
  const sp = `CALL GetAllRankedPlayers()`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      return mydebug(error.message);
    } else if (_.isEmpty(results[0])) {
      mydebug(`no rankedplayers in database...`);
      return res.status(200).send('Currently no ranked Players in Database...');
    } else {
      mydebug('ranked players listed');
      return res.send(results[0]);
    }
  });
});

// Export the Router
module.exports = router;
