/*jshint esversion: 6 */
const express = require('express');
const app = express();
const fallbackport = '3002';
const games = [
    { id: 1, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 1, scorePlayerB: 0 },
    { id: 2, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 },
    { id: 3, playerA: 'Mani', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 }
];

// define routes
app.get('/', (req, res) => {
    res.send('<h1>Hello World..</h1><p>use /api/v1/games...');
    console.log('someone has come to the root of your node..');
});

app.get('/api/v1/games', (req, res) => {
    res.send(games);
    console.log('someone used your games api');
});

app.get('/api/v1/games/:id', (req, res) => {
    const game = games.find(c => c.id === parseInt(req.params.id));
    res.send(game);
    const wantedid = req.params.id;
    console.log(`someone looked for the game with the id ${wantedid}`);
});


// Getting PORT form env var
const port = process.env.PORT || fallbackport;

// starting server stuff
app.listen(port);
console.log(`started listener on port ${port}`);