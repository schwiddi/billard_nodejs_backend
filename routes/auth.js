// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const mydebug = require('../common/mydebug');
const _ = require('underscore');
const Joi = require('joi');
const bcrypt = require('bcrypt');

// setting up express
const router = express.Router();

function validate(req) {
    const schema = {
        email: Joi.string().email({ minDomainAtoms: 2}).max(255).required(),
        password: Joi.string().min(3).max(1024).required()
    };
    return Joi.validate(req, schema);
  }

router.post('/', async (req, res) => {
    const { error } = validate(req.body);
    if (error) {
      mydebug(`joi user input validation was nok`);
      return res.status(400).send(error.details[0].message);
    }

    // generate hashed pw here cause it needs async and i dont know how to do that inside de db if statement
    // const salt = await bcrypt.genSalt(10);
    // const hashedpw = await bcrypt.hash(req.body.password, salt)


    // const checkifmailalreadyregistered = `CALL CheckMailAlreadyRegistered('${req.body.email}')`;

    // db.query(checkifmailalreadyregistered, true, (error, results, fields) => {
    //   if (error) {
    //     mydebug(error.message);
    //     return res.status(500).send('something went wrong on the backend...');
    //   } else if (_.isEmpty(results[0])) {
    //     const sp = `CALL AddUser(
    //       '${req.body.name}',
    //       '${req.body.email}',
    //       '${hashedpw}')`;
      
    //     db.query(sp, true, (error, results, fields) => {
    //       if (error) {
    //         mydebug(error.message);
    //         return res.status(500).send('something went wrong on the backend...');
    //       } else if (_.isEmpty(results[0])) {
    //         mydebug(`returned inserted user from db was empty`);
    //         return res.status(500).send('something went wrong on the backend...');
    //       } else {
    //         mydebug('user added');
    //         return res.send(results[0]);
    //       }
    //     });
    //   } else {
    //     mydebug('mail already registered');
    //     return res.status(400).send('e-mail already registered...');
    //   }
    // });
  });

module.exports = router;