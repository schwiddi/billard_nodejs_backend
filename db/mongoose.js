const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/r21billard')
    .then(() => console.log('Connected to MongoDB'))
    .catch(err => console.error('Catch Method: ',err));

const gameSchema = new mongoose.Schema({
  playerA: String,
  playerB: String, 
  scoreplayerA: Number, 
  scoreplayerB: Number, 
  date: { type: Date, default: Date.now },
  isApproved: { type: Boolean, default: false }
});
const Game = mongoose.model('Game', gameSchema);

// new game
async function saveGame() {
    try {
        const game = new Game({
            playerA: 'Karl',
            playerB: 'Tim',
            scoreplayerA: 1,
            scoreplayerB: 0
        });
        const result = await game.save();
        console.log('here is the game you have stored: ', result);
        return(result._id)
    }
    catch(err) {
        console.log('arrived in the catch', err.message)
    }
}
//saveGame();


// get all games
async function getAllGames() {
    try {
        const games = await Game.find();
        console.log(games);
    }
    catch(err) {
        console.log('arrived in the catch', err.message)
    }
}
// getAllGames();

// get game by id
async function getGameById(id) {
    try {
        const game = await Game.findById(id);
        console.log(game);
    }
    catch(err) {
        console.log('arrived in the catch', err.message)
    }
}
//getGameById('5b7209673b2d166297d078d1');

// delete game by id
async function deleteGameById(id) {
    try {
        const game = await Game.findByIdAndRemove(id);
        console.log(game);
    }
    catch(err) {
        console.log('arrived in the catch', err.message)
    }
}
//deleteGameById('5b7209673b2d166297d078d1');

// get all games from player
async function getGameFromPlayerByName(player) {
    try {
        const games = await Game.find({$or: [{ playerA: player},{ playerB: player}]})
        console.log(games);
    }
    catch(err) {
        console.log('arrived in the catch', err.message)
    }
}
getGameFromPlayerByName('Schwiddi');