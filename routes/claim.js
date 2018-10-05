// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const mydebug = require('../common/mydebug');
const _ = require('underscore');
const Joi = require('joi');
const auth = require('../middleware/auth');

// setting up express
const router = express.Router();

// Input Validation maybe later
function validate(req) {
  const schema = {
    claimedplayerid: Joi.number()
      .min(1)
      .max(255)
      .required()
  };
  return Joi.validate(req, schema);
}

// route to claime a player id
router.post('/', auth, async (req, res) => {
  if (!req.user.id) {
    mydebug(`try to claime without req.user`);
    return res.status(403).send('you dont have enough privileges buddy...');
  }
  const { error } = validate(req.body);
  if (error) {
    mydebug(`joi input validation was nok`);
    return res.status(400).send(error.details[0].message);
  }
  const sp = `CALL SetClaimedPlayerId(
    ${req.body.claimedplayerid},
    ${req.user.id}
    )`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
      return res.status(500).send('something went wrong on the backend...');
    } else if (_.isEmpty(results[0])) {
      mydebug('something went wrong on the backend...');
      return res.status(500).send('something went wrong on the backend...');
    } else {
      mydebug(
        `${req.user.name} claimed to be player with id ${
          req.body.claimedplayerid
        }`
      );
      return res
        .status(200)
        .send(`you succesfuly claimed playerid: ${req.body.claimedplayerid}`);
    }
  });
});

module.exports = router;
