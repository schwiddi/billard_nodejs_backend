// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express'); // middleware
const Joi = require('joi'); // validation
const debugplayers = require('debug')('app:players');
const Game = require('../db/mongo_connector');
const mongoose = require('mongoose');

// ENV things

// setting up express
const router = express.Router(); // create object

// Input Validation for Games
// function validateGame(game) {
//     const schema = {
//         playerA: Joi.string().min(2).required(),
//         playerB: Joi.string().min(2).required(),
//         scoreplayerA: Joi.number().integer().min(0).max(1).required(),
//         scoreplayerB: Joi.number().integer().min(0).max(1).required(),
//     };
//     debuggameapi('Game Input Validate Function was called..')
//     return Joi.validate(game, schema);
// }

router.get('/', async (req, res) => {
  const games = await Game.find().select({
    playerA: 1,
    playerB: 1
  });

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
  res.send(playersdistinct);
});

// get all games from player
// router.get('/:id', async (req, res) => {
//     try {
//         const game = await Game.findById(req.params.id);
//         res.send(game);
//         debuggameapi(`someone listed game id: ${req.param.id}`);
//     } catch (err) {
//         debuggameapi(`catch erreicht`);
//         return res.status(404).send('Game id not found..');
//     }
// });

// router.post('/', async (req, res) => {
//     const { error } = validateGame(req.body);
//     if (error) {
//         debuggameapi(`someone wanted to add a game but the Joi validation was not ok`);
//         return res.status(400).send(error.details[0].message);
//     }

//     let game = new Game( {
//         playerA: req.body.playerA,
//         playerB: req.body.playerB,
//         scoreplayerA: req.body.scoreplayerA,
//         scoreplayerB: req.body.scoreplayerB
//     });

//     game = await game.save();
//     res.send(game);
//     debuggameapi(`someone added a new game, the id is: ${game.id}`);
// });

// UPDATE a game by id
// router.put('/:id', async (req, res) => {
//     const { error } = validateGame(req.body);
//     if (error) {
//         debuggameapi(`someone wanted to updated a game but the validation was not ok`);
//         return res.status(400).send(error.details[0].message);
//     } else {
//         debuggameapi(`Update validation ok`);
//     }

//     try {
//         const game = await Game.findById(req.params.id);
//         res.send(game);
//         debuggameapi(`someone is updating game id: ${req.param.id}`);
//     } catch (err) {
//         debuggameapi(`someone wanted to updated a game that does not exist`);
//         return res.status(404).send('The game you like to update does not exist..');
//     }
//     // game schreiben mit neuen werten
//     game = await Game.findByIdAndUpdate(req.params.id, {
//         playerA: req.body.playerA,
//         playerB: req.body.playerB,
//         scoreplayerA: req.body.scoreplayerA,
//         scoreplayerB: req.body.scoreplayerB
//     }, { new: true});
//     debuggameapi(`someone updated a game by id`);
// });

// DELETE a game by id
// router.delete('/:id', async (req, res) => {
//     try {
//         const game = await Game.findById(req.params.id);
//         if (_.isEmpty(game)) {
//             return res.status(404).send('This game was already deleted')
//         }
//         res.send(game);
//         debuggameapi(`someone is about to delete a game with id: ${req.params.id}`);
//     } catch (err) {
//         debuggameapi(`someone wanted to delete a game that does not exist`);
//         return res.status(404).send('The game you like to delete does not exist..');
//     }
//     game = await Game.findByIdAndRemove(req.params.id);
//     debuggameapi(`game deleted ${req.params.id}`);
// });

// Export the Router
module.exports = router;

// allplayers function
// function getAllPlayers() {
//     let allplayers = [];
//     anzahlitemsingamesarray = games.length;
//     for (i = 0; i < anzahlitemsingamesarray; i++) {
//         let resultplayera = allplayers.find(c => c === games[i].playerA);
//         if (!resultplayera) {
//             allplayers.push(games[i].playerA);
//         }
//         let resultplayerb = allplayers.find(c => c === games[i].playerB);
//         if (!resultplayerb) {
//             allplayers.push(games[i].playerB);
//         }
//     }
//     sorted = allplayers.sort();
//     return sorted;
// }

// define routes

// here can go an endpoint to list all players
// that have played on the table
// app.get('/api/v1/players', (req, res) => {
//     const tmpplayers = getAllPlayers();
//     res.send(tmpplayers);
//     console.log('someone listed your players');
// });
