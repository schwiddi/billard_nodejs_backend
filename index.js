/*jshint esversion: 6 */
const express = require('express');
const app = express();
const port = '3001'

app.get('/', (req, res) => {
    res.send('Hello..');
    console.log('hey i got a request.. yay..')
});


app.listen(port)
console.log(`started listener on port ${port}`)