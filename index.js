/*jshint esversion: 6 */
const express = require('express');
const app = express();
app.use(express.json());

// Setting Port
const fallbackport = '3001';
const port = process.env.PORT || fallbackport;

// temporar Database :)
const games = [
    { id: 1, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 1, scorePlayerB: 0 },
    { id: 2, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 },
    { id: 3, playerA: 'Mani', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 },
    { id: 4, playerA: 'Hazem', playerB: 'Schwiddi', scorePlayerA: 1, scorePlayerB: 0 }, 
    { id: 5, playerA: 'Schwiddi', playerB: 'Hazem', scorePlayerA: 0, scorePlayerB: 1 },
];

// define routes
// root route
app.get('/', (req, res) => {
    res.send('<h1>Hello World..</h1><p><a href="api/v1/games">use api/v1/games ...</a></p>');
    console.log('someone has come to the root of your node..');
});

// get all games
app.get('/api/v1/games', (req, res) => {
    res.send(games);
    console.log('someone used your games api');
});

// get game by id
app.get('/api/v1/games/:id', (req, res) => {
    // games.find is standard function for arrays
    // for c look if c.id equals req.params.id
    // and cause of this is a string not an int
    // we need to parse it via global function parseInt
    const game = games.find(c => c.id === parseInt(req.params.id));
    if (!game) res.status(404).send('Game id not found');
    res.send(game);
});

// create a new game
// or POST a Game to the backend to say
app.post('/api/v1/games', (req, res) => {
    const game = {
        id: games.length + 1,
        playerA: req.body.playerA,
        playerB: req.body.playerB,
        scorePlayerA: req.body.scorePlayerA,
        scorePlayerB: req.body.scorePlayerB,
    };

    games.push(game);
    res.send(game);
});





// starting server stuff
app.listen(port);
console.log(`started listener on port ${port}`);