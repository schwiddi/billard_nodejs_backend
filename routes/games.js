// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express');     // middleware
const Joi = require('joi');             // validation
const debuggames = require('debug')('app:games');
const mongoose = require('mongoose');
const _ = require('underscore');

// ENV things

// Schema for mongoose games
const gameSchema = new mongoose.Schema({
    playerA: String,
    playerB: String, 
    scoreplayerA: Number, 
    scoreplayerB: Number, 
    date: { type: Date, default: Date.now },
    isApproved: { type: Boolean, default: false }
  });
const Game = mongoose.model('Game', gameSchema); // creating model

// setting up express
const router = express.Router();        // create object

// Input Validation for Games
function validateGame(game) {
    const schema = {
        playerA: Joi.string().min(2).required(),
        playerB: Joi.string().min(2).required(),
        scoreplayerA: Joi.number().integer().min(0).max(1).required(),
        scoreplayerB: Joi.number().integer().min(0).max(1).required(),
    };
    debuggames(`Game Input Validate Function was called...`);
    return Joi.validate(game, schema)
}

// CRUD things
// GET
router.get('/', async (req, res) => { // because of the router u use / here but it is /api/v1..
    const games = await Game
    .find()
    .sort('date')
    .select({ playerA: 1, playerB: 1, scoreplayerA: 1 , scoreplayerB: 1, date: 1});
    res.send(games);
    debuggames('someone listed your games');
});

// GET by id
router.get('/:id', async (req, res) => {
    try {
        const game = await Game
        .findById(req.params.id)
        .select({ playerA: 1, playerB: 1, scoreplayerA: 1 , scoreplayerB: 1, date: 1});
        res.send(game);
        debuggames(`someone listed game id: ${req.param.id}`);
    } catch (err) {
        debuggames(`catch erreicht`);
        return res.status(404).send('Game id not found..');
    }
});

// POST new game
router.post('/', async (req, res) => {
    const { error } = validateGame(req.body);
    if (error) {
        debuggames(`someone wanted to add a game but the Joi validation was not ok`);
        return res.status(400).send(error.details[0].message);
    }

    let newgame = new Game( {
        playerA: req.body.playerA,
        playerB: req.body.playerB,
        scoreplayerA: req.body.scoreplayerA,
        scoreplayerB: req.body.scoreplayerB
    });

    newgamereturn = await newgame.save();

    const getnewgame = await Game
    .findById(newgamereturn.id)
    .select({ playerA: 1, playerB: 1, scoreplayerA: 1 , scoreplayerB: 1, date: 1});
    res.send(getnewgame);
    debuggames(`someone added a new game, the id is: ${newgamereturn.id}`);
});

// UPDATE a game by id
router.put('/:id', async (req, res) => {
    const { error } = validateGame(req.body);
    if (error) {
        debuggames(`someone wanted to updated a game but the validation was not ok`);
        return res.status(400).send(error.details[0].message);
    } else {
        debuggames(`Update validation ok`);
    }

    try {
        const game = await Game
        .findById(req.params.id)
        .select({ playerA: 1, playerB: 1, scoreplayerA: 1 , scoreplayerB: 1, date: 1});
        res.send(game);
        debuggames(`someone is updating game id: ${req.param.id}`);
    } catch (err) {
        debuggames(`someone wanted to updated a game that does not exist`);
        return res.status(404).send('The game you like to update does not exist..');
    }
    // game schreiben mit neuen werten
    game = await Game.findByIdAndUpdate(req.params.id, {
        playerA: req.body.playerA,
        playerB: req.body.playerB,
        scoreplayerA: req.body.scoreplayerA,
        scoreplayerB: req.body.scoreplayerB
    }, { new: true});
    debuggames(`someone updated a game by id`);
});

// DELETE a game by id
router.delete('/:id', async (req, res) => {
    try {
        const game = await Game
        .findById(req.params.id)
        .select({ playerA: 1, playerB: 1, scoreplayerA: 1 , scoreplayerB: 1, date: 1});
        if (_.isEmpty(game)) {
            return res.status(404).send('This game was already deleted')
        }
        res.send(game);
        debuggames(`someone is about to delete a game with id: ${req.params.id}`);
    } catch (err) {
        debuggames(`someone wanted to delete a game that does not exist`);
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