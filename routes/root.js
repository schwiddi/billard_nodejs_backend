// Hints
/*jshint esversion: 6 */

// Import things
const express = require('express'); // middleware
const mydebug = require('../common/mydebug');

// setting up express
const router = express.Router(); // create object

// CRUD things
// GET
// root route
router.get('/', (req, res) => {
  res.send(
    '<h1>Hello World..</h1><p><a href="api/v1/games">use api/v1/games ...</a></p>'
  );
  mydebug('someone landed on the root route..');
});

// Export the Router
module.exports = router;
