// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express'); // middleware
const cors = require('cors');
const gamesrouter = require('./routes/games'); // my route to games handler
const playersrouter = require('./routes/players');
const rootrouter = require('./routes/root'); // my route to /
const mydebug = require('./common/mydebug');

// ENV things
const fallbackport = '3001';
const port = process.env.PORT || fallbackport;

// setting up express
const app = express(); // create object app from express
app.use(cors());
app.use(express.json()); // configure the object to handle json
app.use('/api/v1/games', gamesrouter); // say middleware to use for this route the const that was importet before
app.use('/api/v1/players', playersrouter);
app.use('/', rootrouter); // use the router to route /

// starting server stuff
app.listen(port);
mydebug(`Listener started on ${port}`);
