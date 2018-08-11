/*jshint esversion: 6 */
const express = require('express');
const app = express();
const fallbackport = '3002';

// define routes
app.get('/', (req, res) => {
    res.send('<h1>Hello World..</h1>');
    console.log('hey i got a request.. yay..');
});

app.get('/api/v1/games', (req,res) => {
    res.send([1, 2, 3]);
    console.log('someone used your api');
});



// Getting PORT form env var
const port = process.env.PORT || fallbackport;

// starting server stuff
app.listen(port);
console.log(`started listener on port ${port}`);