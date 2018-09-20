// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const mydebug = require('../common/mydebug');
const _ = require('underscore');
const Joi = require('joi');

// setting up express
const router = express.Router();


// Input Validation for Users
function validateUser(user) {
    const schema = {
        name: Joi.string().min(2).max(255).required(),
        email: Joi.string().email({ minDomainAtoms: 2}).max(255).required(),
        password: Joi.string().min(3).max(1024).required()
    };
    return Joi.validate(user, schema);
  }

// write new user = register
router.post('/', async (req, res) => {
    const { error } = validateUser(req.body);
    if (error) {
      mydebug(`joi user input validation was nok`);
      return res.status(400).send(error.details[0].message);
    }

    const checkifmailalreadyregistered = `CALL CheckMailAlreadyRegistered('${req.body.email}')`;

    db.query(checkifmailalreadyregistered, true, (error, results, fields) => {
      if (error) {
        mydebug(error.message);
        return res.status(500).send('something went wrong on the backend...');
      } else if (_.isEmpty(results[0])) {
        // mail not registered - start registring it
        const sp = `CALL AddUser(
          '${req.body.name}',
          '${req.body.email}',
          '${req.body.password}')`;
      
        db.query(sp, true, (error, results, fields) => {
          if (error) {
            mydebug(error.message);
            return res.status(500).send('something went wrong on the backend...');
          } else if (_.isEmpty(results[0])) {
            mydebug(`returned inserted user from db was empty`);
            return res.status(500).send('something went wrong on the backend...');
          } else {
            mydebug('User added');
            return res.send(results[0]);
          }
        });
      } else {
        mydebug('Mail already registered');
        return res.status(400).send('Mail already registered...');
      }
    });
  });

module.exports = router;