/*jshint esversion: 6 */
const express = require('express');
const app = express();
const port = '3001';

// define routes
app.get('/', (req, res) => {
    res.send('Hello..');
    console.log('hey i got a request.. yay..');
});

app.get('/api/v1/games', (req,res) => {
    res.send([1, 2, 3]);
});


// starting server stuff
app.listen(port);
console.log(`started listener on port ${port}`);