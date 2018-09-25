// Hints
/*jshint esversion: 6 */

// Import things
const asyncHandler = require('express-async-handler');
const db = require('../db/db_connection');
const express = require('express');
const mydebug = require('../common/mydebug');
const _ = require('underscore');
const Joi = require('joi');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// setting up express
const router = express.Router();

// validate function with Joi
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

// async function to check if the user exists
async function checkIfUserExist(email) {
  let sql = `CALL CheckIfUserExist('${email}')`;
  await db.query(sql, true, (error, results, fields) => {
    if (_.isEmpty(results[0])) {
      mydebug(`checkIfUserExist FALSE user not known: ${email}`);
      return false;
    } else {
      mydebug(`checkIfUserExist TRUE user exists: ${email}`);
      return true;
    }
  });
}

// async function to get the hashed password from the db to compare it after
async function getPasswordFromDb(email) {
  let sql = `CALL GetHashedPassword('${email}')`;
  await db.query(sql, true, (error, results, fields) => {
    if (_.isEmpty(results[0])) {
      mydebug(
        `getPasswordFromDb password from user is empty??? this is bad: ${email}`
      );
      return false;
    } else {
      const sqlstring = JSON.stringify(results[0]);
      const jsonstring = JSON.parse(sqlstring);
      const dbpw = jsonstring[0]['password'];
      return dbpw;
    }
  });
}

// async function to compare password from user with the one stored in the database
async function bcryptCompare(reqpw, storedpw) {
  return await bcrypt.compare(reqpw, storedpw);
}

router.post(
  '/',
  asyncHandler(async (req, res, next) => {
    //first validate req
    const { error } = validate(req.body);
    if (error) {
      mydebug(`joi auth validation was nok`);
      return res.status(400).send(error.details[0].message);
    }
    const rescheck = await checkIfUserExist(req.body.email);
    console.log(rescheck);

    // const doUserCheck = async email => {
    //   try {
    //     const rescheck = await checkIfUserExist(req.body.email);
    //     console.log(rescheck);
    //     if (!rescheck) {
    //       return res.status(400).send('mail or passwort wrong');
    //     }
    //   } catch (err) {}
    // };
    // doUserCheck(req.body.email);

    // then check if user exists
    // const rescheck = await checkIfUserExist(req.body.email);
    // if (!rescheck) {
    //   return res.status(400).send("mail or passwort wrong");
    // }

    // and then get the password form the db
    // const respw = await getPasswordFromDb(req.body.email);
    // if (!respw) {
    //   return res.status(400).send("mail or passwort wrong");
    // }

    // and then compare reqpw and dbpw
    // const compareResult = await bcryptCompare(req.body.password, respw);
    // if (!compareResult) {
    //   return res.status(400).send("mail or passwort wrong");
    // } else {
    //   return res.status(200).send("successfull");
    // }

    // set logged in field in db
    // sql = `CALL SetLastLogin('${req.body.email}')`;
    // db.query(sql, true, (error, results, fields) => {
    //   if (error) {
    //     mydebug(error.message);
    //   }
    // });

    // jwt stuff
    // const token = jwt.sign({ email: req.body.email }, 'testkey');
    // res.status(200).send(token);
  })
);

module.exports = router;
