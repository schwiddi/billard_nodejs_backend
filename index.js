const express = require('express'); // doku http://expressjs.com/de/4x/api.html

const app = express();

const port = 3001

app.listen(port, () => {
    console.log(`listener started on ${port}...`)
});