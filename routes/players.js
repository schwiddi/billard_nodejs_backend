// Hints
/*jshint esversion: 6 */

// Import things
const db = require('../db/db_connection');
const express = require('express');
const log = require('../common/logger');
const _ = require('underscore');

// setting up express
const router = express.Router();

// get all players
router.get('/', async (req, res) => {
  const sp = `CALL GetAllPlayers()`;

  db.query(sp, true, (error, results, fields) => {
    if (error) {
      return log.info(error.message);
    } else if (_.isEmpty(results[0])) {
      log.info(`no players in database...`);
      return res.status(200).send('Currently no Players in Database...');
    } else {
      log.info('players listed');
      return res.send(results[0]);
    }
  });
});

// get all encounters from player X

// get all game id's from player X
// router.get('/:id', async (req, res) => {
//   const games = await Game.find({
//     $or: [{ playerA: req.params.id }, { playerB: req.params.id }]
//   });

//   if (_.isEmpty(games)) {
//     log.info(`no games for given player: ${req.params.id}`);
//     return res
//       .status(404)
//       .send(`Got no games for given player stored yet: ${req.params.id} ....`);
//   }

//   log.info(`games from player listed: ${req.params.id}`);
//   res.send(games);
// });

// Export the Router
module.exports = router;
