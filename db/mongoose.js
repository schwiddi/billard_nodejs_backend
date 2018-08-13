const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/r21billard')
    .then(() => console.log('Connected to MongoDB'))
    .catch(err => console.error('Catch Method: ',err));

// const gamesSchema = new mongoose.Schema({
//   playerA: String,
//   playerB: String, 
//   scoreplayerA: Number, 
//   scoreplayerB: Number, 
//   date: Date
// });

// const Games = mongoose.model('Games', GamesSchema);

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
