// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express'); // middleware
const gamesrouter = require('./routes/games'); // my route to games handler
const playersrouter = require('./routes/players');
const rootrouter = require('./routes/root'); // my route to /
const mydebug = require('./common/mydebug');
const mongoose = require('mongoose');
mydebug('Require Section done.');

// ENV things
const fallbackport = '3001';
const port = process.env.PORT || fallbackport;
mydebug('Environment Settings Done.');

// setting up express
const app = express(); // create object app from express
mydebug('Express started.');

// trying to use some middleware req logs
app.use(function(req, res, next) {
  mydebug(`middleware got req!`);
  mydebug(`req.ip: ${req.ip}`);
  mydebug(`req.method: ${req.method}`);
  mydebug(`req.originalUrl: ${req.originalUrl}`);
  mydebug(`req.path: ${req.path}`);
  next();
});

// other middleware stuff
app.use(express.json()); // configure the object to handle json
app.use('/api/v1/games', gamesrouter); // say middleware to use for this route the const that was importet before
app.use('/api/v1/players', playersrouter);
app.use('/', rootrouter); // use the router to route /
mydebug('Express setup done.');

// Mongoose setup
mydebug('Setting up MongoDB connection...');
mongoose
  .connect(
    'mongodb://localhost:27017/r21billard',
    { useNewUrlParser: true }
  )
  .then(() => mydebug('Connection to MongoDB done.'))
  .catch(err => {
    mydebug('Having problems connecting to DB!!!', err.message);
    process.exit(1);
  });

// starting server stuff
mydebug('starting listener...');
app.listen(port);
mydebug(`Listener started on ${port}`);
