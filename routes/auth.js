// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const mydebug = require('../common/mydebug');
const _ = require('underscore');
const Joi = require('joi');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// setting up express
const router = express.Router();

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

async function bcryptCompare(input, database) {
  return bcrypt.compare(input, database);
}

router.post('/', async (req, res) => {
  const { error } = validate(req.body);
  if (error) {
    mydebug(`joi auth validation was nok`);
    return res.status(400).send(error.details[0].message);
  }

  let sql = `CALL CheckIfUserExist('${req.body.email}')`;
  db.query(sql, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
      return res.status(500).send('something went wrong..');
    } else if (_.isEmpty(results[0])) {
      mydebug(`auth with unknown user!!!`);
      return res.status(400).send('mail or passwort wrong');
    }
  });

  sql = `CALL GetHashedPassword('${req.body.email}')`;
  db.query(sql, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
      return res.status(500).send('something went wrong..');
    } else if (_.isEmpty(results[0])) {
      mydebug(`password empty in database?!!!`);
      return res.status(500).send('something went wrong..');
    } else {
      const sqlstring = JSON.stringify(results[0]);
      const jsonstring = JSON.parse(sqlstring);
      const dbpw = jsonstring[0]['password'];
      const compareResult = bcryptCompare(req.body.password, dbpw);
      console.log(compareResult);
      if (!compareResult) return res.status(400).send('mail or passwort wrong');
    }
  });

  // set logged in field in db
  sql = `CALL SetLastLogin('${req.body.email}')`;
  db.query(sql, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
    }
  });

  // jwt stuff
  const token = jwt.sign({ email: req.body.email }, 'testkey');
  res.status(200).send(token);
});

module.exports = router;
