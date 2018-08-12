/*jshint esversion: 6 */

// express stuff
const express = require('express');
const app = express();
app.use(express.json());

// Input Validation with joi
const Joi = require('joi');

// Setting Port
const fallbackport = '3001';
const port = process.env.PORT || fallbackport;

// temporar Database :)
const games = [
    { id: 1, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 1, scorePlayerB: 0 },
    { id: 2, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 },
    { id: 3, playerA: 'Mani', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 },
    { id: 4, playerA: 'Hazem', playerB: 'Schwiddi', scorePlayerA: 1, scorePlayerB: 0 }, 
    { id: 5, playerA: 'Schwiddi', playerB: 'Hazem', scorePlayerA: 0, scorePlayerB: 1 }
];



// Validate Function
function validateGame(game) {
    const schema = {
        playerA: Joi.string().min(2).required(),
        playerB: Joi.string().min(2).required(),
        scorePlayerA: Joi.number().integer().min(0).max(1).required(),
        scorePlayerB: Joi.number().integer().min(0).max(1).required(),
    };
    return Joi.validate(game, schema);
}


// allplayers function
function getAllPlayers() {
    let allplayers = [];

    anzahlitemsingamesarray = games.length;
    
    for (i = 0; i < anzahlitemsingamesarray; i++) {
        let result = allplayers.find(c => c === games[i].playerA);
        if (!result) {  
            allplayers.push(games[i].playerA);
        }
    }
    
    for (i = 0; i < anzahlitemsingamesarray; i++) {
        let result = allplayers.find(c => c === games[i].playerB);
        if (!result) {
            allplayers.push(games[i].playerB);
        }
    }
    return allplayers;
}




// define routes
// root route
app.get('/', (req, res) => {
    res.send('<h1>Hello World..</h1><p><a href="api/v1/games">use api/v1/games ...</a></p>');
    console.log('someone landed on the root..');
});

// get all games
app.get('/api/v1/games', (req, res) => {
    res.send(games);
    console.log('someone listed your games');
});

// get game by id
app.get('/api/v1/games/:id', (req, res) => {
    // games.find is standard function for arrays
    // for c look if c.id equals req.params.id
    // and cause of this is a string not an int
    // we need to parse it via global function parseInt
    const game = games.find(c => c.id === parseInt(req.params.id));
    if (!game) {
        console.log(`someone looked for a game id that does not exist`);
        return res.status(404).send('Game id not found');
    }
    
    res.send(game);
    console.log(`someone listed game id: ${game.id}`);
});

// create a new game
// or POST a Game to the backend to say
app.post('/api/v1/games', (req, res) => {
    const { error } = validateGame(req.body);
    if (error) {
        console.log(`someone wanted to add a game but the validation was not ok`);
        return res.status(400).send(error.details[0].message);
    }

    const game = {
        id: games.length + 1,
        playerA: req.body.playerA,
        playerB: req.body.playerB,
        scorePlayerA: req.body.scorePlayerA,
        scorePlayerB: req.body.scorePlayerB
    };

    games.push(game);
    res.send(game);
    console.log(`someone added a new game, the id is: ${game.id}`);
});



// PUT or UPDATE
app.put('/api/v1/games/:id', (req, res) => {
    // lookup the game
    const game = games.find(c => c.id === parseInt(req.params.id));
    // if not exists return 404
    if (!game) {
        console.log(`someone wanted to updated a game that does not exist`);
        return res.status(404).send('Game id not found');
    }
    
    // othervise validate
    // old way --> const result = validateGame(req.body);
    // and here used object destructuring
    const { error } = validateGame(req.body);
    // if invalid 400
    if (error) {
        console.log(`someone wanted to updated a game but the validation was not ok`);
        return res.status(400).send(error.details[0].message);
    }

    // update the game
    game.playerA = req.body.playerA;
    game.playerB = req.body.playerB;
    game.scorePlayerA = req.body.scorePlayerA;
    game.scorePlayerB = req.body.scorePlayerB;

    // return the updated game
    res.send(game);

    console.log(`someone updated game with id: ${game.id}`);
});

// DELETE
app.delete('/api/v1/games/:id', (req, res) => {
    const game = games.find(c => c.id === parseInt(req.params.id));
    if (!game) {
        console.log(`someone wanted to deleted game that does not exist: ${game.id}`);
        return res.status(404).send('Game id not found');
    }

    const index = games.indexOf(game);
    games.splice(index, 1);

    res.send(game);

    console.log(`someone deleted game with id: ${game.id}`);
});

// here can go an endpoint to list all players
// that have played on the table
app.get('/api/v1/players', (req, res) => {
    const tmpplayers = getAllPlayers();
    res.send(tmpplayers);
    console.log('someone listed your players');
});


// starting server stuff
app.listen(port);
console.log(`started listener on port ${port}`);