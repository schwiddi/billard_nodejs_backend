/*jshint esversion: 6 */
// const express = require('express'); // doku http://expressjs.com/de/4x/api.html
const http = require('http');
// const app = express();
// const port = 3001

// app.listen(port, () => {
    // console.log(`listener started on ${port}...`)
// });



const myserver = http.createServer((req, res) => {
    if (req.url === '/') {
        console.log('got connection')
        res.write('hello you');
        res.end();
    }
});

myserver.listen(3002);