// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const _ = require('underscore');
const Joi = require('joi');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const log = require('../common/logger');

// setting up express
const router = express.Router();

// private jwt
process.env.JWTKEY = 'tmp';

// Input Validation for Users
function validate(req) {
  const schema = {
    email: Joi.string()
      .email({ minDomainAtoms: 2 })
      .max(255)
      .required(),
    password: Joi.string()
      .min(3)
      .max(1024)
      .required()
  };
  return Joi.validate(req, schema);
}

router.post('/', function(req, res) {
  try {
    let { error: err } = validate(req.body);
    if (err) {
      log.info(`joi input validation was nok: ${err.details[0].message}`);
      // sende extra diese meldung und nich joi feedback
      return res.status(400).send('email or password wrong');
    }

    let email = req.body.email;
    let reqpw = req.body.password;

    let sp = `CALL GetUser('${email}')`;

    db.query(sp, function(err, results, fields) {
      if (err) {
        log.info(err.message);
        return res.status(500).send('something went wrong on the backend...');
      } else if (results[0].length == 0) {
        log.info('bad user');
        return res.status(400).send('email or password wrong');
      } else if (results[0].length != 0) {
        const sqlstring = JSON.stringify(results[0]);
        const jsonstring = JSON.parse(sqlstring);
        const dbpw = jsonstring[0]['password'];
        const compareResult = bcrypt.compareSync(reqpw, dbpw);
        const isApproved = jsonstring[0]['isApproved'];
        if (compareResult && isApproved === 1) {
          sql = `CALL SetLastAuth('${req.body.email}')`;
          db.query(sql, true, (error, results, fields) => {
            if (error) {
              log.info(error.message);
            }
          });
          log.info(`succesful auth: ${req.body.email}`);
          const token = jwt.sign(
            {
              id: jsonstring[0]['id'],
              name: jsonstring[0]['name'],
              email: jsonstring[0]['email'],
              isAdmin: jsonstring[0]['isAdmin'],
              canAddGame: jsonstring[0]['canAddGame'],
              isApproved: jsonstring[0]['isApproved'],
              claimedPlayerId: jsonstring[0]['claimedPlayerId'],
              playerid: jsonstring[0]['playerid']
            },
            process.env.JWTKEY,
            {
              // expiresIn: '72h'
            }
          );
          log.info(`token: ${token}`);
          return res
            .status(200)
            .header('x-auth-token', token)
            .header('access-control-expose-headers', 'x-auth-token')
            .send('yeah');
        } else {
          log.info(
            `login try with bad password or not Approved: ${req.body.email}`
          );
          return res.status(400).send('wrong data or not approved');
        }
      }
    });
  } catch (error) {
    log.info(error.message);
    return res.status(500).send('something went wrong on the backend...');
  }
});

module.exports = router;
