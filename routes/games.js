// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express'); // middleware
const Joi = require('joi'); // validation
const log = require('../common/logger');
const db = require('../db/db_connection');
const _ = require('underscore');
const auth = require('../middleware/auth');

// setting up express
const router = express.Router(); // create object

// Input Validation for Games
function validateGame(game) {
  const schema = {
    playerA: Joi.string()
      .min(2)
      .required(),
    playerB: Joi.string()
      .min(2)
      .required(),
    scoreplayerA: Joi.number()
      .integer()
      .min(0)
      .max(1)
      .required(),
    scoreplayerB: Joi.number()
      .integer()
      .min(0)
      .max(1)
      .required(),
    winner: Joi.string()
      .min(2)
      .required(),
    beginner: Joi.string()
      .min(2)
      .required(),
    full: Joi.string()
      .min(2)
      .required()
  };
  return Joi.validate(game, schema);
}

// input validation of get game req
function validateReqId(params) {
  const schema = {
    id: Joi.number()
      .integer()
      .required()
  };
  return Joi.validate(params, schema);
}

// CRUD things
// GET
router.get('/', async (req, res) => {
  const sp = `CALL GetAllGames()`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      return log.info(error.message);
    } else if (_.isEmpty(results[0])) {
      log.info(`no games in database to list...`);
      return res.status(200).send('Currently no Games in Database...');
    } else {
      log.info('games listed');
      return res.send(results[0]);
    }
  });
});

// GET by id
router.get('/:id', async (req, res) => {
  const { error } = validateReqId(req.params);
  if (error) {
    log.info(`joi req.id validation was nok`);
    return res.status(400).send(error.details[0].message);
  }

  const sp = `CALL GetGameById(${req.params.id})`;
  db.query(sp, true, (error, results, fields) => {
    if (error) {
      log.info(error.message);
      return res.status(400).send(error.message);
    } else if (_.isEmpty(results[0])) {
      log.info(`unknown game was listed`);
      return res.status(404).send('Game does not exist...');
    } else {
      log.info(`game listed: ${req.params.id}`);
      return res.send(results[0]);
    }
  });
});

// POST new game
router.post('/', auth, async (req, res) => {
  if (req.user.canAddGame != 1) {
    log.info(`${req.user.name} has unsufficient priviledge to add a game`);
    return res.status(403).send('you dont have enough privileges buddy...');
  }
  const { error } = validateGame(req.body);
  if (error) {
    log.info(`joi input validation was nok`);
    return res.status(400).send(error.details[0].message);
  }

  const sp = `CALL AddGame(
    '${req.body.playerA}',
    '${req.body.playerB}',
    '${req.body.scoreplayerA}',
    '${req.body.scoreplayerB}',
    '${req.body.winner}',
    '${req.body.beginner}',
    '${req.body.full}')`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      log.info(error.message);
      return res.status(404).send('something went wrong..');
    } else if (_.isEmpty(results[0])) {
      log.info(`returned inserted game from db was empty`);
      return res.status(404).send('something went wrong..');
    } else {
      log.info('game added');
      return res.send(results[0]);
    }
  });
});

// UPDATE a game by id
router.put('/:id', auth, async (req, res) => {
  if (req.user.isAdmin != 1) {
    return res.status(403).send('you dont have enough privileges buddy...');
  }
  const { error } = validateReqId(req.params);
  if (error) {
    log.info(`joi req.id validation was nok`);
    return res.status(400).send(error.details[0].message);
  }

  const sp = `CALL GetGameById('${req.params.id}')`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      log.info(error.message);
      return res.status(404).send('something went wrong..');
    } else if (_.isEmpty(results[0])) {
      log.info(`trying to update already deleted game`);
      return res.status(404).send('Game does not exist...');
    } else {
      const { error } = validateGame(req.body);
      if (error) {
        log.info(`update validation was nok`);
        return res.status(400).send(error.details[0].message);
      } else {
        const spupdate = `CALL UpdateGame(
          '${req.params.id}',
          '${req.body.playerA}',
          '${req.body.playerB}',
          '${req.body.scoreplayerA}',
          '${req.body.scoreplayerB}'
        )`;

        db.query(spupdate, true, (error, results, fields) => {
          if (error) {
            log.info(error.message);
            return res.status(404).send('something went wrong..');
          } else if (_.isEmpty(results[0])) {
            log.info(`something strange happened`);
            return res.status(404).send('something went wrong..');
          } else {
            log.info(`game updated: ${req.params.id}`);
            return res.send(results[0]);
          }
        });
      }
    }
  });
});

// DELETE a game by id
router.delete('/:id', auth, async (req, res) => {
  if (req.user.isAdmin != 1) {
    return res.status(403).send('you dont have enough privileges buddy...');
  }
  const { error } = validateReqId(req.params);
  if (error) {
    log.info(`joi req.id validation was nok`);
    return res.status(400).send(error.details[0].message);
  }

  const sp = `CALL GetGameById('${req.params.id}')`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      log.info(error.message);
      return res.status(404).send('something went wrong..');
    } else if (_.isEmpty(results[0])) {
      log.info(`delete on deleted game...`);
      return res.status(404).send('Game does not exist...');
    } else {
      const spdelete = `CALL DeleteGame('${req.params.id}')`;

      db.query(spdelete, true, (error, results, fields) => {
        if (error) {
          log.info(error.message);
          return res.status(404).send(`something went wrong..`);
        } else {
          log.info(`game deleted: ${req.params.id}`);
          return res.status(200).send(`game deleted!`);
        }
      });
    }
  });
});

// DELETE all games
// should not be usable in Prod env
router.delete('/', auth, async (req, res) => {
  if (req.user.isAdmin != 1) {
    return res.status(403).send('you dont have enough privileges buddy...');
  }
  const sp = `CALL DeleteAllGames()`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      log.info(error.message);
      return res.status(404).send(`something went wrong..`);
    } else {
      log.info(`all games have been deleted!!!`);
      return res.status(200).send(`all games deleted!`);
    }
  });
});

// Export the Router
module.exports = router;
