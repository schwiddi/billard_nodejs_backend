// Hints
/*jshint esversion: 6 */

// Import things
// const debuggames = require('debug')('app:games');
const mongoose = require('mongoose');

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

// Creating Mongoose Model
const Game = mongoose.model('Game', gameSchema); // creating model

// now Export this Model
module.exports = Game;
