// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express'); // middleware
const Joi = require('joi'); // validation
const debuggames = require('debug')('app:games');
const Game = require('../db/mongo_connector');
const _ = require('underscore');

// ENV things

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
  debuggames(`validation function was called`);
  return Joi.validate(game, schema);
}

// CRUD things
// GET
router.get('/', async (req, res) => {
  // because of the router u use / here but it is /api/v1..
  const games = await Game.find()
    .sort('date')
    .select({
      playerA: 1,
      playerB: 1,
      scoreplayerA: 1,
      scoreplayerB: 1,
      date: 1
    });

  if (_.isEmpty(games)) {
    debuggames(`no ganes in database to list... ${games}`);
    return res.status(404).send('Currently no Games in Database...');
  }
  res.send(games);
  debuggames('games listed');
});

// GET by id
router.get('/:id', async (req, res) => {
  try {
    const game = await Game.findById(req.params.id).select({
      playerA: 1,
      playerB: 1,
      scoreplayerA: 1,
      scoreplayerB: 1,
      date: 1
    });
    if (_.isEmpty(game)) {
      debuggames(`deleted game listed: ${req.params.id}`);
      return res.status(404).send('The game you like to get was deleted...');
    }
    res.send(game);
    debuggames(`game listed: ${req.params.id}`);
  } catch (err) {
    debuggames(`unknown game was listed ${req.params.id}`);
    return res.status(404).send('Game id not found..');
  }
});

// POST new game
router.post('/', async (req, res) => {
  const { error } = validateGame(req.body);
  if (error) {
    debuggames(`joi input validation was nok`);
    return res.status(400).send(error.details[0].message);
  }

  let newgame = new Game({
    playerA: req.body.playerA,
    playerB: req.body.playerB,
    scoreplayerA: req.body.scoreplayerA,
    scoreplayerB: req.body.scoreplayerB
  });

  newgamereturn = await newgame.save();

  const getnewgame = await Game.findById(newgamereturn.id).select({
    playerA: 1,
    playerB: 1,
    scoreplayerA: 1,
    scoreplayerB: 1,
    date: 1
  });
  res.send(getnewgame);
  debuggames(`new game: ${getnewgame.id}`);
});

// UPDATE a game by id
router.put('/:id', async (req, res) => {
  try {
    const game = await Game.findById(req.params.id);
    if (_.isEmpty(game)) {
      debuggames(`forbidden update on already delted game`);
      return res.status(404).send('The game you like to update was deleted..');
    }
  } catch (err) {
    debuggames(`update in unknown game`);
    return res.status(404).send('The game you like to update does not exist..');
  }

  const { error } = validateGame(req.body);
  if (error) {
    debuggames(`update validation was nok`);
    return res.status(400).send(error.details[0].message);
  } else {
    debuggames(`update validation was ok`);
  }

  // game schreiben mit neuen werten
  game = await Game.findByIdAndUpdate(
    req.params.id,
    {
      playerA: req.body.playerA,
      playerB: req.body.playerB,
      scoreplayerA: req.body.scoreplayerA,
      scoreplayerB: req.body.scoreplayerB
    },
    { new: true }
  );
  debuggames(`update on game: ${req.params.id}`);

  const updatedgame = await Game.findById(req.params.id).select({
    playerA: 1,
    playerB: 1,
    scoreplayerA: 1,
    scoreplayerB: 1,
    date: 1
  });

  res.send(updatedgame);
});

// DELETE a game by id
router.delete('/:id', async (req, res) => {
  try {
    const game = await Game.findById(req.params.id).select({
      playerA: 1,
      playerB: 1,
      scoreplayerA: 1,
      scoreplayerB: 1,
      date: 1
    });
    if (_.isEmpty(game)) {
      debuggames('delete on game that has been deleted before');
      return res.status(404).send('This game was already deleted');
    }
    res.send(game);
  } catch (err) {
    debuggames(`delete on unknown game`);
    return res.status(404).send('The game you like to delete does not exist..');
  }
  game = await Game.findByIdAndRemove(req.params.id);
  debuggames(`game deleted ${req.params.id}`);
});

// DELETE all games
// should not be usable in Prod env
router.delete('/', async (req, res) => {
  game = await Game.deleteMany();
  debuggames(`all games have been delted`);
  return res.status(200).send('all games have been deleted..');
});

// Export the Router
module.exports = router;
