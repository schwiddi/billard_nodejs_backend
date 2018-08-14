// Hints
/*jshint esversion: 6 */


// Import things
const express = require('express');                   // middleware
const gamesrouter = require('./routes/games');        // my route to games handler    
const rootrouter = require('./routes/root');          // my route to /
const debuginit = require('debug')('app:init');
const debugdb = require('debug')('app:db');
const mongoose = require('mongoose');
debuginit('Require Section done.');


// ENV things
const fallbackport = '3001';
const port = process.env.PORT || fallbackport;
debuginit('Environment Settings Done.');


// setting up express
const app = express();                  // create object app from express
debuginit('Express started.');
app.use(express.json());                // configure the object to handle json
app.use('/api/v1/games', gamesrouter);  // say middleware to use for this route the const that was importet before
app.use('/', rootrouter);               // use the router to route /
debuginit('Express setup done.');


// Mongoose setup
debugdb('Setting up MongoDB connection...');
mongoose.connect('mongodb://localhost:27017/r21billard', { useNewUrlParser: true })
    .then(() => debugdb('Connection to MongoDB done.'))
    .catch(err => debugdb('Having problems connecting to DB!!!', err.message));


// starting server stuff
app.listen(port);
console.log(`started listener on port ${port}`);
debuginit('Server started');