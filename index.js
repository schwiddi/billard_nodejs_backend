// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express');             // middleware
const gamesrouter = require('./routes/games');        // my route to games handler    
const rootrouter = require('./routes/root');          // my route to /

// ENV things
const fallbackport = '3001';
const port = process.env.PORT || fallbackport;

// setting up express
const app = express();                  // create object app from express
app.use(express.json());                // configure the object to handle json
app.use('/api/v1/games', gamesrouter);  // say middleware to use for this route the const that was importet before
app.use('/', rootrouter);               // use the router to route /


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


// starting server stuff
app.listen(port);
console.log(`started listener on port ${port}`);