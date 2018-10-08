// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const log = require('../common/logger');
const _ = require('underscore');
const Joi = require('joi');
const bcrypt = require('bcrypt');
const auth = require('../middleware/auth');

// setting up express
const router = express.Router();

// Input Validation for Users
function validateUser(user) {
  const schema = {
    name: Joi.string()
      .min(2)
      .max(255)
      .required(),
    email: Joi.string()
      .email({ minDomainAtoms: 2 })
      .max(255)
      .required(),
    password: Joi.string()
      .min(3)
      .max(1024)
      .required()
  };
  return Joi.validate(user, schema);
}

// get all users
router.get('/', auth, async (req, res) => {
  const sp = `CALL GetAllUsers()`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      return log.info(error.message);
    } else if (_.isEmpty(results[0])) {
      log.info(`no users in database...`);
      return res.status(200).send('Currently no users in Database...');
    } else {
      log.info('users listed');
      return res.send(results[0]);
    }
  });
});

// write new user = register
router.post('/', async (req, res) => {
  const { error } = validateUser(req.body);
  if (error) {
    log.info(`joi user input validation was nok`);
    return res.status(400).send(error.details[0].message);
  }

  // generate hashed pw here cause it needs async and i dont know how to do that inside de db if statement
  const salt = await bcrypt.genSalt(10);
  const hashedpw = await bcrypt.hash(req.body.password, salt);

  const checkifmailalreadyregistered = `CALL CheckMailAlreadyRegistered('${
    req.body.email
  }')`;

  db.query(checkifmailalreadyregistered, true, (error, results, fields) => {
    if (error) {
      log.info(error.message);
      return res.status(500).send('something went wrong on the backend...');
    } else if (_.isEmpty(results[0])) {
      const sp = `CALL AddUser(
          '${req.body.name}',
          '${req.body.email}',
          '${hashedpw}')`;

      db.query(sp, true, (error, results, fields) => {
        if (error) {
          log.info(error.message);
          return res.status(500).send('something went wrong on the backend...');
        } else if (_.isEmpty(results[0])) {
          log.info(`returned inserted user from db was empty`);
          return res.status(500).send('something went wrong on the backend...');
        } else {
          log.info('user added');
          return res.send(results[0]);
        }
      });
    } else {
      log.info('mail already registered');
      return res.status(400).send('e-mail already registered...');
    }
  });
});

module.exports = router;
