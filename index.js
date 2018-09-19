// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express');
const cors = require('cors');
const gamesrouter = require('./routes/games');
const playersrouter = require('./routes/players');
const playersrankedrouter = require('./routes/playersranked');
const playersunrankedrouter = require('./routes/playersunranked');
const rootrouter = require('./routes/root');
const usersrouter = require('./routes/users');
const mydebug = require('./common/mydebug');

// ENV things
const fallbackport = '3001';
const port = process.env.PORT || fallbackport;

// setting up express
const app = express(); // create object app from express
app.use(cors()); // musst du mal naschauen was das schon wieder macht... glaube irgendwas mit JSON objects
app.use(express.json()); // configure the object to handle json
app.use('/api/v1/games', gamesrouter);
app.use('/api/v1/players', playersrouter);
app.use('/api/v1/playersranked', playersrankedrouter);
app.use('/api/v1/playersunranked', playersunrankedrouter);
app.use('/', rootrouter);
app.use('/api/v1/users', usersrouter)

// starting server stuff
app.listen(port);
mydebug(`Listener started on ${port}`);
