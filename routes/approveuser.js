// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const mydebug = require('../common/mydebug');
const _ = require('underscore');
const auth = require('../middleware/auth');

// setting up express
const router = express.Router();

// route to claime a player id
router.post('/', auth, async (req, res) => {
  if (req.user.isAdmin != 1) {
    mydebug(`not enought priviledges to set playerid`);
    return res.status(403).send('you dont have enough privileges buddy...');
  }
  const sp = `CALL ApproveUser(${req.body.userid})`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
      return res.status(500).send('something went wrong on the backend...');
    } else if (_.isEmpty(results[0])) {
      return res.status(500).send('something went wrong on the backend...');
    } else {
      mydebug(`user approved by admin id: ${req.body.userid}`);
      return res
        .status(200)
        .send(`user approved by admin id: ${req.body.userid}`);
    }
  });
});

module.exports = router;
