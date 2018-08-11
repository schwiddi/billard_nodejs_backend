const express = require('express'); // doku http://expressjs.com/de/4x/api.html

const app = express();

const port = 3001

app.listen(1337, () => {
    console.log(`listener started on ${port}...`)
});