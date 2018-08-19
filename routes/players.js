// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express'); // middleware
const debugplayers = require('debug')('app:players');
const Game = require('../db/mongo_connector');
const _ = require('underscore');

// ENV things

// setting up express
const router = express.Router(); // create object

// get all players
router.get('/', async (req, res) => {
  const games = await Game.find().select({
    playerA: 1,
    playerB: 1
  });

  if (_.isEmpty(games)) {
    debugplayers(`no players in database to list... ${games}`);
    return res.status(404).send('Currently no Players in Database...');
  }

  let allplayers = [];

  let length = games.length;

  for (i = 0; i < length; i++) {
    allplayers.push(games[i].playerA);
    allplayers.push(games[i].playerB);
  }

  let playersdistinct = [];

  length = allplayers.length;

  for (i = 0; i < length; i++) {
    let checkplayertmp = playersdistinct.find(c => c === allplayers[i]);
    if (!checkplayertmp) {
      playersdistinct.push(allplayers[i]);
    }
  }
  debugplayers('players listed');
  const arraytojson = JSON.stringify(playersdistinct.sort());
  res.send(arraytojson);
});

// get all games from player X
router.get('/:id', async (req, res) => {
  const games = await Game.find({
    $or: [{ playerA: req.params.id }, { playerB: req.params.id }]
  });

  res.send(games);
});

// Export the Router
module.exports = router;
