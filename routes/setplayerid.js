// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const log = require('../common/logger');
const _ = require('underscore');
const auth = require('../middleware/auth');

// setting up express
const router = express.Router();

// route to claime a player id
router.post('/', auth, async (req, res) => {
  if (req.user.isAdmin != 1) {
    log.info(`not enought priviledges to set playerid`);
    return res.status(403).send('you dont have enough privileges buddy...');
  }
  const sp = `CALL SetPlayerIdToClaimedPlayerId(${req.body.userid})`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      log.info(error.message);
      return res.status(500).send('something went wrong on the backend...');
    } else if (_.isEmpty(results[0])) {
      log.info('something went wrong on the backend...');
      return res.status(500).send('something went wrong on the backend...');
    } else {
      log.info(`admin sets player id from user with id ${req.body.userid}`);
      return res
        .status(200)
        .send(
          `you succesfuly set playerid from user with id: ${req.body.userid}`
        );
    }
  });
});

module.exports = router;
