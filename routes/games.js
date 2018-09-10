// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express'); // middleware
const Joi = require('joi'); // validation
const mydebug = require('../common/mydebug');
const db = require('../db/db_connection');
const _ = require('underscore');

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
      .required()
  };
  return Joi.validate(game, schema);
}

// CRUD things
// GET
router.get('/', async (req, res) => {
  const sp = `CALL GetAllGames()`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      return mydebug(error.message);
    } else if (_.isEmpty(results[0])) {
      mydebug(`no games in database to list...`);
      return res.status(200).send('Currently no Games in Database...');
    } else {
      mydebug('games listed');
      return res.send(results[0]);
    }
  });
});

// GET by id
router.get('/:id', async (req, res) => {
  const sp = `CALL GetGameById(${req.params.id})`;
  db.query(sp, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
      return res.status(400).send(error.message);
    } else if (_.isEmpty(results[0])) {
      mydebug(`unknown game was listed`);
      return res.status(404).send('Game does not exist...');
    } else {
      mydebug(`game listed: ${req.params.id}`);
      return res.send(results[0]);
    }
  });
});

// POST new game
router.post('/', async (req, res) => {
  const { error } = validateGame(req.body);
  if (error) {
    mydebug(`joi input validation was nok`);
    return res.status(400).send(error.details[0].message);
  }

  const sp = `CALL AddGame(
    '${req.body.playerA}',
    '${req.body.playerB}',
    '${req.body.scoreplayerA}',
    '${req.body.scoreplayerB}')`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
      return res.status(404).send('something went wrong..');
    } else if (_.isEmpty(results[0])) {
      mydebug(`returned inserted game from db was empty`);
      return res.status(404).send('something went wrong..');
    } else {
      mydebug('game added');
      return res.send(results[0]);
    }
  });
});

// UPDATE a game by id
router.put('/:id', async (req, res) => {
  const sp = `CALL GetGameById('${req.params.id}')`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
      return res.status(404).send('something went wrong..');
    } else if (_.isEmpty(results[0])) {
      mydebug(`trying to update already deleted game`);
      return res.status(404).send('Game does not exist...');
    } else {
      const { error } = validateGame(req.body);
      if (error) {
        mydebug(`update validation was nok`);
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
            mydebug(error.message);
            return res.status(404).send('something went wrong..');
          } else if (_.isEmpty(results[0])) {
            mydebug(`something strange happened`);
            return res.status(404).send('something went wrong..');
          } else {
            mydebug(`game updated: ${req.params.id}`);
            return res.send(results[0]);
          }
        });
      }
    }
  });
});

// DELETE a game by id
router.delete('/:id', async (req, res) => {
  const sp = `CALL GetGameById('${req.params.id}')`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
      return res.status(404).send('something went wrong..');
    } else if (_.isEmpty(results[0])) {
      mydebug(`delete on deleted game...`);
      return res.status(404).send('Game does not exist...');
    } else {
      const spdelete = `CALL DeleteGame('${req.params.id}')`;

      db.query(spdelete, true, (error, results, fields) => {
        if (error) {
          mydebug(error.message);
          return res.status(404).send(`something went wrong..`);
        } else {
          mydebug(`game deleted: ${req.params.id}`);
          return res.status(200).send(`game deleted!`);
        }
      });
    }
  });
});

// DELETE all games
// should not be usable in Prod env
router.delete('/', async (req, res) => {
  const sp = `CALL DeleteAllGames()`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      mydebug(error.message);
      return res.status(404).send(`something went wrong..`);
    } else {
      mydebug(`game deleted wit id: ${req.params.id}`);
      return res.status(200).send(`all games deleted!`);
    }
  });
});

// Export the Router
module.exports = router;
