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
            playerA: 'Schwiddi',
            playerB: 'Basil',
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
saveGame();





// async function getGames() {
//   return await Games
//   //.find({ isPublished: true, tags: 'backend' })
//   //.sort({ name: 1 })
//   //.select({ name: 1, author: 1 });
// }

// async function run() {
//   const games = await getGames();
//   console.log(games);
// }

// run();
