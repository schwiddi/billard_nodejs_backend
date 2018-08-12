// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express');     // middleware
const Joi = require('joi');             // validation

// ENV things

// setting up express
const router = express.Router();        // create object

// temporar Database :)
const games = [
    { id: 1, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 1, scorePlayerB: 0 },
    { id: 2, playerA: 'Schwiddi', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 },
    { id: 3, playerA: 'Mani', playerB: 'Basil', scorePlayerA: 0, scorePlayerB: 1 },
    { id: 4, playerA: 'Hazem', playerB: 'Schwiddi', scorePlayerA: 1, scorePlayerB: 0 }, 
    { id: 5, playerA: 'Schwiddi', playerB: 'Hazem', scorePlayerA: 0, scorePlayerB: 1 }
];

// Input Validation for Games
function validateGame(game) {
    const schema = {
        playerA: Joi.string().min(2).required(),
        playerB: Joi.string().min(2).required(),
        scorePlayerA: Joi.number().integer().min(0).max(1).required(),
        scorePlayerB: Joi.number().integer().min(0).max(1).required(),
    };
    return Joi.validate(game, schema);
}


// CRUD things
// GET
router.get('/', (req, res) => { // you can youse the root here, cause you habe been routed
    res.send(games);
    console.log('someone listed your games');
});

// GET by id
router.get('/:id', (req, res) => {
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

// POST new game
router.post('/', (req, res) => {
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

// UPDATE a game by id
router.put('/:id', (req, res) => {
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

// DELETE a game by id
router.delete('/:id', (req, res) => {
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



// Export the Router
module.exports = router;
// and try to export the database as whell
// module.exports.games = games;