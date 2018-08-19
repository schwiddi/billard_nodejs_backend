// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express'); // middleware
const gamesrouter = require('./routes/games'); // my route to games handler
const playersrouter = require('./routes/players');
const rootrouter = require('./routes/root'); // my route to /
const debuginit = require('debug')('app:init');
const debugdb = require('debug')('app:db');
const mongoose = require('mongoose');
debuginit('Require Section done.');

// ENV things
const fallbackport = '3001';
const port = process.env.PORT || fallbackport;
debuginit('Environment Settings Done.');

// setting up express
const app = express(); // create object app from express
debuginit('Express started.');

// trying to use some middleware req logs
app.use(function(req, res, next) {
  console.log(`middleware got req!`);
  console.log(`req.ip: ${req.ip}`);
  console.log(`req.method: ${req.method}`);
  console.log(`req.originalUrl: ${req.originalUrl}`);
  console.log(`req.path: ${req.path}`);
  next();
});

// other middleware stuff
app.use(express.json()); // configure the object to handle json
app.use('/api/v1/games', gamesrouter); // say middleware to use for this route the const that was importet before
app.use('/api/v1/players', playersrouter);
app.use('/', rootrouter); // use the router to route /
debuginit('Express setup done.');

// Mongoose setup
debugdb('Setting up MongoDB connection...');
mongoose
  .connect(
    'mongodb://localhost:27017/r21billard',
    { useNewUrlParser: true }
  )
  .then(() => debugdb('Connection to MongoDB done.'))
  .catch(err => {
    debugdb('Having problems connecting to DB!!!', err.message);
    process.exit(1);
  });

// starting server stuff
app.listen(port);
console.log(`Backend started on ${port}`);
debuginit('Backend started');
